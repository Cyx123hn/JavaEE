package com.situ.mall.goods.mapper;

import java.util.List;

import com.situ.mall.goods.model.GoodsImgModel;

public interface GoodsImgMapper {

	int insert(GoodsImgModel model);
	int delete(GoodsImgModel model);
	int update(GoodsImgModel model) ;
	GoodsImgModel selectById(Object id);
    GoodsImgModel selectByCode(String code);
	List<GoodsImgModel> selectAll(GoodsImgModel model);
	List<GoodsImgModel> selectModel(GoodsImgModel model);
    int selectCount(GoodsImgModel model);
	
}
