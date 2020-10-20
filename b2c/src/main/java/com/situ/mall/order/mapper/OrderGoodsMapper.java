package com.situ.mall.order.mapper;

import java.util.List;

import com.situ.mall.order.model.OrderGoodsModel;

public interface OrderGoodsMapper {
	int insert(OrderGoodsModel model);
	int delete(OrderGoodsModel model);
	int update(OrderGoodsModel model) ;
	OrderGoodsModel selectById(Object id);
    OrderGoodsModel selectByCode(String code);
	List<OrderGoodsModel> selectAll(OrderGoodsModel model);
	List<OrderGoodsModel> selectModel(OrderGoodsModel model);
    int selectCount(OrderGoodsModel model);
}
