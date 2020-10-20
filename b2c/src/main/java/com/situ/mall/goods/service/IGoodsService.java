package com.situ.mall.goods.service;

import java.util.List;

import com.situ.mall.goods.model.GoodsModel;

public interface IGoodsService {
	int insert(GoodsModel GoodsModel);

	int delete(GoodsModel GoodsModel);

	int update(GoodsModel GoodsModel);

	GoodsModel selectByCode(String code);
	GoodsModel selectById(Integer id);
	Object selectCount(GoodsModel GoodsModel);

	List<GoodsModel> selectModel(GoodsModel GoodsModel);

	List<GoodsModel> selectAll(GoodsModel GoodsModel);
}
