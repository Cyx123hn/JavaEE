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
import com.situ.crm.ussd.model.StatusModel;

import tool.FmtEmpty;

@Controller
@RequestMapping("status")
public class StatusController {
	@Autowired
	private ICommonService<StatusModel> statusService;
	
	@RequestMapping("toStatus")
	public String toRole() {
		return "/ussd/status/status";
	}
	
	@RequestMapping("update")
	public String update(Model model,String code ) {
		StatusModel model2 =new StatusModel();
		if(!FmtEmpty.isEmpty(code)) { //code不为空则回显
		  model2.setCode(code);
		  model.addAttribute("model",statusService.selectModel(model2));
		 }
		return "/ussd/status/add";
	}
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(StatusModel model2,Integer id,Model model) {
		System.out.println(id);
		if(FmtEmpty.isEmpty(id)) {
			return statusService.insertByUQCode(model2);
		}
		else {
			return statusService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(StatusModel model) {
		return statusService.delete(model)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(StatusModel model,Integer pageIndex,Integer pageLimit) {
		model.setCode("%"+model.getCode()+"%");
		model.setName("%"+model.getName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<StatusModel> list = statusService.selectList(model);
		int count = statusService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
