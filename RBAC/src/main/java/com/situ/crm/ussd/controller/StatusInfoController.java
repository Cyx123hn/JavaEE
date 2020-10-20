package com.situ.crm.ussd.controller;

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
import com.situ.crm.grant.service.RoleServiceImpl;
import com.situ.crm.ussd.model.StatusInfoModel;
import com.situ.crm.ussd.model.StatusModel;
import com.situ.crm.ussd.service.StatusServiceImpl;

import tool.FmtEmpty;

@Controller
@RequestMapping("statusInfo")
public class StatusInfoController {
	@Autowired
	private ICommonService<StatusInfoModel> statusInfoService;
	
	@Autowired
	private RoleServiceImpl roleService;
	
	@Autowired
	private StatusServiceImpl statusService;
	
	@RequestMapping("toStatusInfo")
	public String toRel() {
		return "/ussd/statusInfo/statusInfo";
	}
	@RequestMapping("add")
	public String toAdd(Model model,Integer id) {
		 StatusModel model2 =new StatusModel();
		 model.addAttribute("list",statusService.selectList(model2));
		 RoleModel model3 =new RoleModel();
		 model.addAttribute("list2",roleService.selectList(model3));
		 StatusInfoModel model4 =new StatusInfoModel();
		 if(!FmtEmpty.isEmpty(id)) {
			 System.out.println("-------------"+id);
			 model4.setId(id);
			 model.addAttribute("model",statusInfoService.selectModel(model4));
		 }
		 return "/ussd/statusInfo/add";
	}
	
	@ResponseBody
	@RequestMapping("del")
	public String del(StatusInfoModel model) {
		return statusInfoService.delete(model)+"";
	}
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(StatusInfoModel model2,Integer id,Model model) {
		if(FmtEmpty.isEmpty(id)) {
			return statusInfoService.insertByUQCode(model2);
		}
		else {
			return statusInfoService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(StatusInfoModel model,Integer pageIndex,Integer pageLimit) {
		model.setRoleName("%"+model.getRoleName()+"%");
		model.setStatusName("%"+model.getStatusName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<StatusInfoModel> list = statusInfoService.selectList(model);
		int count = statusInfoService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
