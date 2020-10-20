package com.situ.mall.goods.service;

import java.util.List;

import com.situ.mall.goods.model.GoodsImgModel;

public interface IGoodsImgService {
	int insert(GoodsImgModel GoodsImgModel);

	int delete(GoodsImgModel GoodsImgModel);

	int update(GoodsImgModel GoodsImgModel);

	GoodsImgModel selectByCode(String code);
	GoodsImgModel selectById(Integer id);
	Object selectCount(GoodsImgModel GoodsImgModel);

	List<GoodsImgModel> selectModel(GoodsImgModel GoodsImgModel);

	List<GoodsImgModel> selectAll(GoodsImgModel GoodsImgModel);

}
