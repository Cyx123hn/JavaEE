package com.situ.mall.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.order.model.OrderGoodsModel;
import com.situ.mall.order.service.IOrderGoodsService;

@Controller
@RequestMapping("/orderGoods")
public class OrderGoodsController {

	@Autowired 
	private IOrderGoodsService  service;
	@ResponseBody
	@RequestMapping("/add")
	public int add(OrderGoodsModel OrderGoodsModel,String entryTime1) {						

	System.out.println("执行add"+OrderGoodsModel);
			    
	  return service.insert(OrderGoodsModel);

	} 
	
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(OrderGoodsModel OrderGoodsModel, Model model) {
	   System.out.println("执行delete:"+OrderGoodsModel);
		
	    return  service.delete(OrderGoodsModel);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(OrderGoodsModel OrderGoodsModel) {
	  
		
		System.out.println("执行UPDATE"+OrderGoodsModel);
	    return  service.update(OrderGoodsModel);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectById")
	private OrderGoodsModel selectById(OrderGoodsModel OrderGoodsModel) {
		System.out.println("执行selectById"+OrderGoodsModel.getId());
		OrderGoodsModel um = service.selectById(OrderGoodsModel.getId());
		System.out.println("++++++++"+um);
		return um;
	}
	@ResponseBody
	@RequestMapping("/selectByCode")
	private OrderGoodsModel selectByCode(OrderGoodsModel OrderGoodsModel) {
		System.out.println("执行selectById"+OrderGoodsModel.getId());
		OrderGoodsModel um = service.selectByCode(OrderGoodsModel.getOrderCode());
		System.out.println("++++++++"+um);
		return um;
	}
	
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<OrderGoodsModel> selectAll(OrderGoodsModel OrderGoodsModel) {
		System.out.println("+++"+OrderGoodsModel);
		List<OrderGoodsModel> list = service.selectAll(OrderGoodsModel);
		
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(OrderGoodsModel OrderGoodsModel) {
		OrderGoodsModel.setPageOn(true);
		System.out.println("执行slectModel:"+OrderGoodsModel);
		
		
		List<OrderGoodsModel> list = service.selectModel(OrderGoodsModel);
		
	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	   
	    map.put("count", service.selectCount(OrderGoodsModel));
	   
		
		
		return map;
	}
	
	@RequestMapping("/upGoods")
	private String upGoods(OrderGoodsModel OrderGoodsModel,Model model) {
		System.out.println("执行selectByCode"+OrderGoodsModel);
//		OrderGoodsModel um = service.selectByCode(OrderGoodsModel.getOrderCode());
//		model.addAttribute("user",um);	
		List<OrderGoodsModel> list = service.selectModel(OrderGoodsModel);
		model.addAttribute("list",list);
		return "order/order/pic";
	}
	
	@RequestMapping("/upGoods2")
	private String upGoods2(OrderGoodsModel OrderGoodsModel,Model model) {
		System.out.println("执行selectByCode"+OrderGoodsModel);
//		OrderGoodsModel um = service.selectByCode(OrderGoodsModel.getOrderCode());
//		model.addAttribute("user",um);	
		List<OrderGoodsModel> list = service.selectModel(OrderGoodsModel);
		model.addAttribute("list",list);
		return "car/orderGoods";
	}
	
	
}
