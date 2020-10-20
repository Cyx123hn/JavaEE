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
import com.situ.crm.grant.model.UserModel;
import com.situ.crm.grant.service.UserServiceImpl;
import com.situ.crm.ussd.model.CommunicationModel;
import com.situ.crm.ussd.model.CustomerModel;
import com.situ.crm.ussd.service.CustomerServiceImpl;

import tool.FmtEmpty;

@Controller
@RequestMapping("communication")
public class CommunicationController {
	@Autowired
	 private  ICommonService<CommunicationModel> communicationService;
	@Autowired
	private CustomerServiceImpl customerService;
	@Autowired
	private  UserServiceImpl userService;
	
	@RequestMapping("toCommunication")
	public String toRel() {
		return "/ussd/communication/communication";
	}
	@RequestMapping("add")
	public String toAdd(Model model,Integer id) {
		 CustomerModel model2 =new CustomerModel();
		 model.addAttribute("list",customerService.selectList(model2));
		 UserModel model3 =new UserModel();
		 model.addAttribute("list2",userService.selectList(model3));
		 CommunicationModel model4 =new CommunicationModel();
		 if(!FmtEmpty.isEmpty(id)) {
			 System.out.println("-------------"+id);
			 model4.setId(id);
			 model.addAttribute("model",communicationService.selectModel(model4));
		 }
		 return "/ussd/communication/add";
	}
	
	@ResponseBody
	@RequestMapping("del")
	public String del(CommunicationModel model) {
		return communicationService.delete(model)+"";
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(CommunicationModel model2,Integer id,Model model) {
		if(FmtEmpty.isEmpty(id)) {
			return communicationService.insert(model2)+"";
		}
		else {
			return communicationService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(CommunicationModel model,Integer pageIndex,Integer pageLimit) {
		System.out.println(pageIndex);
		System.out.println("------------"+pageLimit);
		model.setCustName("%"+model.getCustName()+"%");
		model.setUserName("%"+model.getUserName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<CommunicationModel> list = communicationService.selectList(model);
		int count = communicationService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
