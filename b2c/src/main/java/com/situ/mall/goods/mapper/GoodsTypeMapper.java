package com.situ.mall.goods.mapper;

import java.util.List;

import com.situ.mall.goods.model.GoodsTypeModel;



public interface GoodsTypeMapper {

	int insert(GoodsTypeModel model);
	int delete(GoodsTypeModel model);
	int update(GoodsTypeModel model) ;
	GoodsTypeModel selectById(Object id);
    GoodsTypeModel selectByCode(String code);
	List<GoodsTypeModel> selectAll(GoodsTypeModel model);
	List<GoodsTypeModel> selectModel(GoodsTypeModel model);
    int selectCount(GoodsTypeModel model);
    
	
}
