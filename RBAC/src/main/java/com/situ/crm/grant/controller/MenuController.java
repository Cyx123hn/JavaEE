package com.situ.crm.grant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.model.MenuModel;

import tool.FmtEmpty;

@Controller
@RequestMapping("menu")
public class MenuController {
	
	@Autowired
	private ICommonService<MenuModel> menuService;
	
	@RequestMapping("toMenu")
	public String toMenu() {
		return "/grant/menu/menu";
	}
	
	@RequestMapping("insert")
	public String insert(Model model) {
		 MenuModel model2 =new MenuModel();
		 model.addAttribute("list",menuService.selectName(model2));
		 return "/grant/menu/add";
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(MenuModel model) {
		return menuService.delete(model)+"";
	}
	
	@RequestMapping("update")
	public String update(Model model,String code) {
		 MenuModel model2 =new MenuModel();
		 model.addAttribute("list",menuService.selectName(model2));
		 model2.setCode(code);
		 model.addAttribute("model",menuService.selectModel(model2));
		 return "/grant/menu/add";
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(MenuModel model2,Integer id,Model model) {
		System.out.println(id);
		if(FmtEmpty.isEmpty(id)) {
			if(model2.getParentCode().equals("menu0")) {
				model2.setOrder("1");
			}else {
				model2.setOrder("2");
			}
			return menuService.insertByUQCode(model2);
		}
		else {
			return menuService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(MenuModel model,Integer pageIndex,Integer pageLimit) {
		model.setCode("%"+model.getCode()+"%");
		model.setName("%"+model.getName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<MenuModel> list = menuService.selectList(model);
		int count = menuService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
