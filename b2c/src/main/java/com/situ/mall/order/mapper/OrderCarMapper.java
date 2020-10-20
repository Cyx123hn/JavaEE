package com.situ.mall.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.order.model.OrderCarModel;



public interface OrderCarMapper {

	int insert(OrderCarModel model);
	int delete(OrderCarModel model);
	int update(OrderCarModel model) ;
	OrderCarModel selectById(Object id);
    OrderCarModel selectByCode(@Param(value="userCode")String userCode,@Param(value="goodsCode")String goodsCode);
	List<OrderCarModel> selectAll(OrderCarModel model);
	List<OrderCarModel> selectModel(OrderCarModel model);
    int selectCount(OrderCarModel model);
}
