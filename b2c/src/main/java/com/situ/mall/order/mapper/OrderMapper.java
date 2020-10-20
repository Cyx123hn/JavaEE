package com.situ.mall.order.mapper;

import java.util.List;

import com.situ.mall.order.model.OrderModel;

public interface OrderMapper {
	int insert(OrderModel model);
	int delete(OrderModel model);
	int update(OrderModel model) ;
	OrderModel selectById(Object id);
    OrderModel selectByCode(String code);
	List<OrderModel> selectAll(OrderModel model);
	List<OrderModel> selectModel(OrderModel model);
    int selectCount(OrderModel model);
}
