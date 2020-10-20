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
import com.situ.crm.grant.model.RelModel;
import com.situ.crm.grant.model.RoleModel;
import com.situ.crm.grant.service.MenuServiceImpl;

import tool.FmtEmpty;

@Controller
@RequestMapping("rel")
public class RelController {
	
	@Autowired
	private ICommonService<RelModel> relService;
	@Autowired
	private MenuServiceImpl menuService;
	@Autowired
	private ICommonService<RoleModel> roleService;
	
	@RequestMapping("toRel")
	public String toRel() {
		return "/grant/rel/rel";
	}
	@RequestMapping("add")
	public String toAdd(Model model,Integer id) {
		 MenuModel model2 =new MenuModel();
		 model.addAttribute("list",menuService.selectMenu(model2));
		 RoleModel model3 =new RoleModel();
		 model.addAttribute("list2",roleService.selectList(model3));
		 RelModel model4 =new RelModel();
		 if(!FmtEmpty.isEmpty(id)) {
			 System.out.println("-------------"+id);
			 model4.setId(id);
			 model.addAttribute("model",relService.selectModel(model4));
		 }
		 return "/grant/rel/add";
	}
	
	@ResponseBody
	@RequestMapping("del")
	public String del(RelModel model) {
		return relService.delete(model)+"";
	}
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(RelModel model2,Integer id,Model model) {
		if(FmtEmpty.isEmpty(id)) {
			return relService.insertByUQCode(model2);
		}
		else {
			return relService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(RelModel model,Integer pageIndex,Integer pageLimit) {
		model.setRoleName("%"+model.getRoleName()+"%");
		model.setMenuName("%"+model.getMenuName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<RelModel> list = relService.selectList(model);
		int count = relService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
