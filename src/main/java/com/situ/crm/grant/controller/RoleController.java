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
import com.situ.crm.grant.model.RoleModel;

import tool.FmtEmpty;

@Controller
@RequestMapping("role")
public class RoleController {
 
	@Autowired
	private ICommonService<RoleModel> roleService;
	
	@RequestMapping("toRole")
	public String toRole() {
		return "/grant/role/role";
	}
	
	@RequestMapping("update")
	public String update(Model model,String code ) {
		RoleModel model2 =new RoleModel();
		if(!FmtEmpty.isEmpty(code)) { //code不为空则回显
		  model2.setCode(code);
		  model.addAttribute("model",roleService.selectModel(model2));
		 }
		return "/grant/role/add";
	}
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(RoleModel model2,Integer id,Model model) {
		System.out.println(id);
		if(FmtEmpty.isEmpty(id)) {
			return roleService.insertByUQCode(model2);
		}
		else {
			return roleService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(RoleModel model) {
		return roleService.delete(model)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(RoleModel model,Integer pageIndex,Integer pageLimit) {
		model.setCode("%"+model.getCode()+"%");
		model.setName("%"+model.getName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<RoleModel> list = roleService.selectList(model);
		int count = roleService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
