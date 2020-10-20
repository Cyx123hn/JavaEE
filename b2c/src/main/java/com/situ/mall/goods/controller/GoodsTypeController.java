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
import com.situ.mall.goods.model.GoodsTypeModel;
import com.situ.mall.goods.service.IGoodsService;
import com.situ.mall.goods.service.IGoodsTypeService;

@Controller
@RequestMapping("/goodsType")
public class GoodsTypeController {

	@Autowired
	private IGoodsTypeService userService;
	@Autowired
	private IGoodsService userService2;

	@ResponseBody
	@RequestMapping("/add")
	public int add(GoodsTypeModel GoodsTypeModel, String entryTime1) {

		System.out.println("执行add" + GoodsTypeModel);

		return userService.insert(GoodsTypeModel);

	}

	@ResponseBody
	@RequestMapping("/delete")
	public int delete(GoodsTypeModel GoodsTypeModel, Model model) {
		System.out.println("执行delete:" + GoodsTypeModel);

		String typeCode = GoodsTypeModel.getCode();
		System.out.println("typeCode:" + typeCode);
		GoodsModel goodsModel = new GoodsModel();
		goodsModel.setTypeCode(typeCode);
		System.out.println(goodsModel);
		List<GoodsModel> list = userService2.selectModel(goodsModel);
		for(GoodsModel  mo :list) {
			mo.setTypeCode("无");
			userService2.update(mo);
		}
		
		
		return userService.delete(GoodsTypeModel);
//		return 0;
	}

	@ResponseBody
	@RequestMapping("/update")
	public int update(GoodsTypeModel GoodsTypeModel, String entryTime1) {
		System.out.println("+++" + entryTime1);

		System.out.println("执行UPDATE" + GoodsTypeModel);
		return userService.update(GoodsTypeModel);

	}

	@ResponseBody
	@RequestMapping("/selectByCode")
	private GoodsTypeModel selectByCode(GoodsTypeModel GoodsTypeModel) {
		System.out.println("执行selectByCode" + GoodsTypeModel.getCode());
		GoodsTypeModel um = userService.selectByCode(GoodsTypeModel.getCode());
		System.out.println("++++++++" + um);
		return um;
	}

	@RequestMapping("/upuser")
	private String upuser(GoodsTypeModel GoodsTypeModel, Model model) {
		System.out.println("执行selectByCode" + GoodsTypeModel.getCode());
		GoodsTypeModel um = userService.selectByCode(GoodsTypeModel.getCode());
		model.addAttribute("user", um);
		List<GoodsTypeModel> list = select(new GoodsTypeModel());
		System.out.println(list);
		model.addAttribute("list", list);
		return "goods/type/userupd";
	}

	@ResponseBody
	@RequestMapping("/select")
	private List<GoodsTypeModel> select(GoodsTypeModel GoodsTypeModel) {
		System.out.println("+++" + GoodsTypeModel);
		GoodsTypeModel.setParentcode("type1");
		List<GoodsTypeModel> list = userService.selectAll(GoodsTypeModel);
		GoodsTypeModel.setParentcode("type0");
		List<GoodsTypeModel> list1 = userService.selectAll(GoodsTypeModel);

		list.add(list1.get(0));
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectAll")
	private List<GoodsTypeModel> selectAll(GoodsTypeModel GoodsTypeModel) {
		System.out.println("+++" + GoodsTypeModel);

		List<GoodsTypeModel> list = userService.selectAll(GoodsTypeModel);
		System.out.println(list);
		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String, Object> selectModel(GoodsTypeModel GoodsTypeModel) {
		GoodsTypeModel.setPageOn(true);
		System.out.println("执行slectModel:" + GoodsTypeModel);
		GoodsTypeModel.setCode("%" + GoodsTypeModel.getCode() + "%");
		GoodsTypeModel.setName("%" + GoodsTypeModel.getName() + "%");
		GoodsTypeModel.setParentcode("%" + GoodsTypeModel.getParentcode() + "%");
		GoodsTypeModel.setDescr("%" + GoodsTypeModel.getDescr() + "%");

		List<GoodsTypeModel> list = userService.selectModel(GoodsTypeModel);

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);

		map.put("count", userService.selectCount(GoodsTypeModel));

		return map;
	}

	@ResponseBody
	@RequestMapping("/selectAll2")
	private List<GoodsTypeModel> selectAll2(GoodsTypeModel GoodsTypeModel) {
		System.out.println("+++" + GoodsTypeModel);

		List<GoodsTypeModel> list = userService.selectAll(GoodsTypeModel);

		return list;
	}
}
