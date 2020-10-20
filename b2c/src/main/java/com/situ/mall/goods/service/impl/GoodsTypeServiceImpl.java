package com.situ.mall.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.goods.mapper.GoodsTypeMapper;
import com.situ.mall.goods.model.GoodsTypeModel;
import com.situ.mall.goods.service.IGoodsTypeService;

import com.situ.until.FmtEmpty;
@Service
public class GoodsTypeServiceImpl implements IGoodsTypeService {
	@Autowired
	private GoodsTypeMapper userMapper;

	@Override
	public int insert(GoodsTypeModel goodsTypeModel) {
		GoodsTypeModel em = selectByCode(goodsTypeModel.getCode());
		if (FmtEmpty.isEmpty(em)) { // 若em为空则说明数据库中无此条记录
			userMapper.insert(goodsTypeModel);
			return 0;
		}
		return 1;
	}

	@Override
	public int delete(GoodsTypeModel goodsTypeModel) {

		return userMapper.delete(goodsTypeModel);
	}

	@Override
	public int update(GoodsTypeModel goodsTypeModel) {

		return userMapper.update(goodsTypeModel);
	}

	@Override
	public GoodsTypeModel selectByCode(String code) {

		return userMapper.selectByCode(code);
	}

	@Override
	public Object selectCount(GoodsTypeModel goodsTypeModel) {
	
		return userMapper.selectCount(goodsTypeModel);
	}

	@Override
	public List<GoodsTypeModel> selectModel(GoodsTypeModel goodsTypeModel) {
		List<GoodsTypeModel> list = userMapper.selectModel(goodsTypeModel);

		return list;
	}

	@Override
	public List<GoodsTypeModel> selectAll(GoodsTypeModel goodsTypeModel) {
		return userMapper.selectAll(goodsTypeModel);
	}

	@Override
	public GoodsTypeModel selectById(Integer id) {
		
		return userMapper.selectById(id);
	}

}
