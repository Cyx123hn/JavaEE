package com.situ.mall.goods.mapper;

import java.util.List;

import com.situ.mall.goods.model.GoodsModel;

public interface GoodsMapper {

	int insert(GoodsModel model);
	int delete(GoodsModel model);
	int update(GoodsModel model) ;
	GoodsModel selectById(Object id);
    GoodsModel selectByCode(String code);
	List<GoodsModel> selectAll(GoodsModel model);
	List<GoodsModel> selectModel(GoodsModel model);
    int selectCount(GoodsModel model);
	
}
