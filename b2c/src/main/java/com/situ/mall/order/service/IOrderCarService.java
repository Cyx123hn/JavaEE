package com.situ.mall.order.service;

import java.util.List;

import com.situ.mall.order.model.OrderCarModel;

public interface IOrderCarService {

	
	
	int insert(OrderCarModel model);
	int delete(OrderCarModel model);
	int update(OrderCarModel model) ;
	OrderCarModel selectById(Object id);
    OrderCarModel selectByCode(String userCode,String goodsCode);
	List<OrderCarModel> selectAll(OrderCarModel model);
	List<OrderCarModel> selectModel(OrderCarModel model);
    int selectCount(OrderCarModel model);
}
