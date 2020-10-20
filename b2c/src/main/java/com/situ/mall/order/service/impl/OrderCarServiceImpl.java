package com.situ.mall.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.order.mapper.OrderCarMapper;
import com.situ.mall.order.model.OrderCarModel;
import com.situ.mall.order.service.IOrderCarService;
import com.situ.until.FmtEmpty;
@Service
public class OrderCarServiceImpl  implements IOrderCarService{
@Autowired
private  OrderCarMapper mapper;
	
	
	@Override
	public int insert(OrderCarModel model) {
		OrderCarModel om = selectByCode(model.getUserCode(),model.getGoodsCode());
		  int price =Integer.parseInt(model.getSubtotal());
		if(FmtEmpty.isEmpty(om)) {
			 return	 mapper.insert(model);
			
		}else {
		    int  num = Integer.parseInt(om.getNum());
		    num++;
			om.setNum(String.valueOf(num));
			om.setSubtotal(String.valueOf(num*price));
			System.out.println("6666666"+om);
			return mapper.update(om);
		}
		
	}

	@Override
	public int delete(OrderCarModel model) {
		
		return mapper.delete(model);
	}

	@Override
	public int update(OrderCarModel model) {
		
		return mapper.update(model);
	}

	@Override
	public OrderCarModel selectById(Object id) {
		
		return mapper.selectById(id);
	}

	@Override
	public OrderCarModel selectByCode(String userCode,String goodsCode) {
		System.out.println(userCode+goodsCode);
		return mapper.selectByCode(userCode,goodsCode);
	}

	@Override
	public List<OrderCarModel> selectAll(OrderCarModel model) {
		
		return mapper.selectAll(model);
	}

	@Override
	public List<OrderCarModel> selectModel(OrderCarModel model) {
		//System.out.println("6666666666666");
		return  mapper.selectModel(model);
	}

	@Override
	public int selectCount(OrderCarModel model) {
		
		return mapper.selectCount(model);
	}

}
