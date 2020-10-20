package com.situ.crm.ussd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.grant.model.UserModel;
import com.situ.crm.grant.service.UserServiceImpl;
import com.situ.crm.ussd.model.CustomerModel;
import com.situ.crm.ussd.model.OrderModel;
import com.situ.crm.ussd.model.ProductModel;
import com.situ.crm.ussd.model.StatusInfoModel;
import com.situ.crm.ussd.service.CustomerServiceImpl;
import com.situ.crm.ussd.service.OrderServiceImpl;
import com.situ.crm.ussd.service.ProductServiceImpl;
import com.situ.crm.ussd.service.StatusInfoServiceImpl;

import tool.FmtEmpty;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	private OrderServiceImpl orderService;
	@Autowired
	private StatusInfoServiceImpl statusInfoService;
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private CustomerServiceImpl customerService;
	

	@RequestMapping("toOrder")
	public String toOrder() {
		return "/ussd/order/order";
	}
	
	@RequestMapping("add")
	public String add(Model model,Integer id,HttpServletRequest request) {
		
		 UserModel model3 =new UserModel();
		 model.addAttribute("list2",userService.selectList(model3));
		 CustomerModel customerModel =new CustomerModel();
		 model.addAttribute("list3",customerService.selectList(customerModel));
		 ProductModel productModel =new ProductModel();
		 model.addAttribute("list4",productService.selectList(productModel));
		 OrderModel model2 =new OrderModel();
		 UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
		 StatusInfoModel statusInfoModel =new StatusInfoModel();
		 statusInfoModel.setRoleCode(sessionUser.getRoleCode());
		if(!FmtEmpty.isEmpty(id)) { //code不为空则回显
		  model2.setId(id);
		  model.addAttribute("model",orderService.selectModel(model2));
		  model.addAttribute("list",statusInfoService.selectList(statusInfoModel));
		 }else {
			 statusInfoModel.setRoleCode("role3");
			 model.addAttribute("list",statusInfoService.selectList(statusInfoModel));
		}
		return "/ussd/order/add";
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(OrderModel model2,Integer id,Model model,HttpServletRequest request) {
		if(FmtEmpty.isEmpty(id)) {
			System.out.println(model2);
			return orderService.insertByUQCode(model2);
		}
		else {
			return orderService.update(model2,request)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(OrderModel model) {
		return orderService.delete(model)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(OrderModel model,Integer pageIndex,Integer pageLimit) {
		model.setProdName("%"+model.getProdName()+"%");
		model.setCustName("%"+model.getCustName()+"%");
		model.setUserName("%"+model.getUserName()+"%");
		model.setStatusName("%"+model.getStatusName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<OrderModel> list = orderService.selectList(model);
		int count = orderService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
}
	

