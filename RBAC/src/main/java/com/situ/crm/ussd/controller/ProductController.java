package com.situ.crm.ussd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.model.TestModel;
import com.situ.crm.ussd.model.ProductModel;

import tool.FmtEmpty;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ICommonService<ProductModel> productService;
	
	
	@RequestMapping("toProduct")
	public String toCustomer() {
		return "/ussd/product/product";
	}
	
	@RequestMapping("add")
	public String add(Model model,String code) {
		ProductModel model2 =new ProductModel();
		if(!FmtEmpty.isEmpty(code)) { //code不为空则回显
		  model2.setCode(code);
		  model.addAttribute("model",productService.selectModel(model2));
		 }
		return "/ussd/product/add";
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpd")
	public String addOrUpd(ProductModel model2,Integer id,Model model) {
		if(FmtEmpty.isEmpty(id)) {
			return productService.insertByUQCode(model2);
		}
		else {
			return productService.update(model2)+"";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(ProductModel model) {
		return productService.delete(model)+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	public String list(ProductModel model,Integer pageIndex,Integer pageLimit) {
		model.setCode("%"+model.getCode()+"%");
		model.setName("%"+model.getName()+"%");
		model.setPageOn(true);
		if(!FmtEmpty.isEmpty(pageIndex)) {
			model.setPageIndex(pageIndex);
		}
		if(!FmtEmpty.isEmpty(pageLimit)) {
			model.setPageLimit(pageLimit);
		}
		
		List<ProductModel> list = productService.selectList(model);
		int count = productService.selectCount(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("count", count);
		map.put("code", 0);
		return new JSONObject(map).toString();
	}
	
	@RequestMapping("toChart")
	public String toChart(Model model) {
		ProductModel model2 =new ProductModel();
		List<ProductModel> list = productService.selectList(model2);
		List<String> name =new ArrayList<String>();
		List<Integer> value =new ArrayList<>();
		List<TestModel> test1 = new ArrayList<>();
		List<TestModel> test2 = new ArrayList<>();
		for (int i=0;i<list.size();i++) {
			name.add(list.get(i).getName());
			value.add(Integer.parseInt(list.get(i).getSum()));
			test1.add(new TestModel(list.get(i).getName(),Integer.parseInt(list.get(i).getSum()) ));
			test2.add(new TestModel(list.get(i).getName(),Integer.parseInt(list.get(i).getCost()) ));
		};
		
		model.addAttribute("name", new JSONArray(name).toString());
		model.addAttribute("value",value);
		model.addAttribute("list", new JSONArray(test1).toString());
		model.addAttribute("list1", new JSONArray(test2).toString());
		return "/ussd/product/chart";
	}
	
}
