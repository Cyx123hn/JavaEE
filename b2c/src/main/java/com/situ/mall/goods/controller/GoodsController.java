package com.situ.mall.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.goods.model.GoodsModel;
import com.situ.mall.goods.service.IGoodsService;


@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private IGoodsService userService;
	
	
	@ResponseBody
	@RequestMapping("/add")
	public int add(GoodsModel GoodsModel,String entryTime1) {						

	System.out.println("执行add"+GoodsModel);
			    
	  return userService.insert(GoodsModel);

	} 
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public int delete(GoodsModel GoodsModel, Model model) {
	   System.out.println("执行delete:"+GoodsModel);
		
	    return  userService.delete(GoodsModel);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public int update(GoodsModel GoodsModel,String entryTime1) {
	    System.out.println("+++"+entryTime1);
		
		System.out.println("执行UPDATE"+GoodsModel);
	    return  userService.update(GoodsModel);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectByCode")
	private GoodsModel selectByCode(GoodsModel GoodsModel) {
		System.out.println("执行selectByCode"+GoodsModel.getCode());
		GoodsModel um = userService.selectByCode(GoodsModel.getCode());
		System.out.println("++++++++"+um);
		return um;
	}
	
	@ResponseBody
	@RequestMapping("/selectAll")
	private List<GoodsModel> selectAll(GoodsModel GoodsModel) {
		System.out.println("+++"+GoodsModel);
		List<GoodsModel> list = userService.selectAll(GoodsModel);
		
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String,Object> selectModel(GoodsModel GoodsModel) {
		GoodsModel.setPageOn(true);
		System.out.println("执行slectModel:"+GoodsModel);
//		GoodsModel.setCode("%"+GoodsModel.getCode()+"%");
		GoodsModel.setName("%"+GoodsModel.getName()+"%");
		
//		GoodsModel.setDescr("%"+GoodsModel.getDescr()+"%");
		
		List<GoodsModel> list = userService.selectModel(GoodsModel);
		
	    Map<String,Object> map=new HashMap<>();
	    map.put("list", list);
	   
	    map.put("count", userService.selectCount(GoodsModel));
	   
		
		
		return map;
	}

	
}
