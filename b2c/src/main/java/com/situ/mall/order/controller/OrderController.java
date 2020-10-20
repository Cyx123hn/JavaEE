package com.situ.mall.order.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.goods.model.GoodsModel;
import com.situ.mall.order.model.OrderCarModel;
import com.situ.mall.order.model.OrderGoodsModel;
import com.situ.mall.order.model.OrderModel;
import com.situ.mall.order.service.IOrderCarService;
import com.situ.mall.order.service.IOrderGoodsService;
import com.situ.mall.order.service.IOrderService;
import com.situ.until.FmtEmpty;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private IOrderService service;
	@Autowired
	private IOrderCarService service2;
	@Autowired
	private IOrderGoodsService service3;

	@ResponseBody
	@RequestMapping("/add")
	public int add(OrderModel OrderModel, String entryTime1, String vids) {
		System.out.println(vids + "123");
		String[] ids = vids.split(",");

		System.out.println("OrderModel" + OrderModel);
		// System.out.println("entryTime1"+entryTime1);
		if (!FmtEmpty.isEmpty(entryTime1)) {
			Timestamp entryTime = Timestamp.valueOf(entryTime1);
			OrderModel.setEntryTime(entryTime);
		}
		
		Random ran = new Random();

		String code = UUID.randomUUID().toString();
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
		String time = dateFormat.format( now ); 
		Timestamp entryTime = Timestamp.valueOf(time);
		OrderModel.setEntryTime(entryTime);
		OrderModel.setCode(code);
		List<OrderCarModel> list = selectList(code, ids);
		System.out.println("OrderModel" + OrderModel);
		return service.insert(OrderModel);

	}

	public List<OrderCarModel> selectList(String code, String[] ids) {

		List<OrderCarModel> list = new ArrayList<>();
		for (int i = 0; i < ids.length; i++) {
			OrderCarModel model = service2.selectById(Integer.parseInt(ids[i]));
			list.add(model);
			String goodsCode = model.getGoodsCode(); // 商品编号
			String num = model.getNum(); // 数量
			String price = model.getSubtotal();// 小计
			service2.delete(model);
			OrderGoodsModel om = new OrderGoodsModel();
			om.setGoodsCode(goodsCode);
			om.setOrderCode(code);
			om.setNum(num);
			om.setPrice(price);
			service3.insert(om);
		}

		return list;
	}

	@ResponseBody
	@RequestMapping("/delete")
	public int delete(OrderModel OrderModel, Model model) {
		System.out.println("执行delete:" + OrderModel);
        
		String orderCode=OrderModel.getCode();
	
		OrderGoodsModel goodsModel = new OrderGoodsModel();
		goodsModel.setOrderCode(orderCode);
	
	    service3.delete(goodsModel);
		
		return service.delete(OrderModel);
	}

	@ResponseBody
	@RequestMapping("/update")
	public int update(OrderModel OrderModel, String entryTime1) {
		Timestamp entryTime = Timestamp.valueOf(entryTime1);
		OrderModel.setEntryTime(entryTime);

		System.out.println("执行UPDATE" + OrderModel);
		return service.update(OrderModel);

	}

	@ResponseBody
	@RequestMapping("/selectById")
	private OrderModel selectById(OrderModel OrderModel) {
		System.out.println("执行selectById" + OrderModel.getId());
		OrderModel um = service.selectById(OrderModel.getId());
		System.out.println("++++++++" + um);
		return um;
	}

	@ResponseBody
	@RequestMapping("/selectByCode")
	private OrderModel selectByCode(OrderModel OrderModel) {
		System.out.println("执行selectByCode" + OrderModel.getCode());
		OrderModel um = service.selectByCode(OrderModel.getCode());
		System.out.println("++++++++" + um);
		return um;
	}

	@ResponseBody
	@RequestMapping("/selectAll")
	private List<OrderModel> selectAll(OrderModel OrderModel) {
		System.out.println("+++" + OrderModel);
		List<OrderModel> list = service.selectAll(OrderModel);

		return list;
	}

	@ResponseBody
	@RequestMapping("/selectModel")
	private Map<String, Object> selectModel(OrderModel OrderModel) {
		OrderModel.setPageOn(true);
		System.out.println("执行slectModel:" + OrderModel);

		List<OrderModel> list = service.selectModel(OrderModel);

		Map<String, Object> map = new HashMap<>();
		map.put("list", list);

		map.put("count", service.selectCount(OrderModel));

		return map;
	}

	@RequestMapping("/upuser")
	private String upuser(OrderModel OrderModel, Model model) {
		System.out.println("执行selectByCode" + OrderModel);
		OrderModel um = service.selectByCode(OrderModel.getCode());
		model.addAttribute("user", um);

		return "order/order/userupd";
	}

}
