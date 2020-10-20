package com.situ.mall.goods.service;

import java.util.List;

import com.situ.mall.goods.model.GoodsTypeModel;

public interface IGoodsTypeService {

	int insert(GoodsTypeModel goodsTypeModel);

	int delete(GoodsTypeModel goodsTypeModel);

	int update(GoodsTypeModel goodsTypeModel);

	GoodsTypeModel selectByCode(String code);
	GoodsTypeModel selectById(Integer id);
	Object selectCount(GoodsTypeModel goodsTypeModel);

	List<GoodsTypeModel> selectModel(GoodsTypeModel goodsTypeModel);

	List<GoodsTypeModel> selectAll(GoodsTypeModel goodsTypeModel);

}
