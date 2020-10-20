package com.situ.mall.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.order.mapper.OrderMapper;
import com.situ.mall.order.model.OrderModel;
import com.situ.mall.order.service.IOrderService;
import com.situ.until.FmtEmpty;

@Service
public class OrderServiceImpl  implements  IOrderService{
    
	@Autowired OrderMapper mapper;
	
	
	@Override
	public int insert(OrderModel model) {
	OrderModel om = mapper.selectByCode(model.getCode());
	if( FmtEmpty.isEmpty(om)) {
		mapper.insert(model);
		return 0;
	}
		return 1;
	}

	@Override
	public int delete(OrderModel model) {
		
		return mapper.delete(model);
	}

	@Override
	public int update(OrderModel model) {
		
		return mapper.update(model);
	}

	@Override
	public OrderModel selectById(Object id) {
		
		return mapper.selectById(id);
	}

	@Override
	public OrderModel selectByCode(String code) {
		
		return mapper.selectByCode(code);
	}

	@Override
	public List<OrderModel> selectAll(OrderModel model) {
		
		return mapper.selectAll(model);
	}

	@Override
	public List<OrderModel> selectModel(OrderModel model) {
		
		return mapper.selectModel(model);
	}

	@Override
	public int selectCount(OrderModel model) {
		
		return mapper.selectCount(model);
	}

	
	
}
