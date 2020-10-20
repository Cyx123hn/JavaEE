package com.situ.mall.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.situ.mall.order.model.OrderCarModel;
import com.situ.mall.order.service.IOrderCarService;

@Controller
@RequestMapping("/orderCar")
public class OrderCarController {

	@Autowired
	private IOrderCarService  service;

	
	@ResponseBody
	@RequestMapping("/add")
	public int add(OrderCarModel OrderCarModel) {						

	System.out.println("执行add"+OrderCarModel);
			    
  return service.insert(OrderCarModel);

	} 
	
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(OrderCarModel OrderCarModel, Model model) {
	   System.out.println("执行delete:"+OrderCarModel);
		
	    return  service.delete(OrderCarModel);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(OrderCarModel OrderCarModel) {
	  
		
		System.out.println("执行UPDATE"+OrderCarModel);
	    return  service.update(OrderCarModel);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectById")
	private OrderCarModel selectById(OrderCarModel OrderCarModel) {
		System.out.println("执行selectById"+OrderCarModel.getId());
		OrderCarModel um = service.selectById(OrderCarModel.getId());
		System.out.println("++++++++"+um);
		return um;
	}
	
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<OrderCarModel> selectAll(OrderCarModel OrderCarModel) {
		System.out.println("+++"+OrderCarModel);
		List<OrderCarModel> list = service.selectAll(OrderCarModel);
		
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(OrderCarModel OrderCarModel) {
		OrderCarModel.setPageOn(true);
		System.out.println("执行slectModel:"+OrderCarModel);
		
		
		List<OrderCarModel> list = service.selectModel(OrderCarModel);
		
	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	   
	    map.put("count", service.selectCount(OrderCarModel));
	   
		
		
		return map;
	}
	@RequestMapping("/upuser")
	private String upuser(OrderCarModel OrderCarModel,Model model) {
		System.out.println("执行selectByCode"+OrderCarModel);
		OrderCarModel um = service.selectById(OrderCarModel.getId());
		model.addAttribute("user",um);
		
		return "order/car/userupd";
	}
	
	
}
