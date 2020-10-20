package com.situ.mall.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.goods.mapper.GoodsMapper;

import com.situ.mall.goods.model.GoodsModel;
import com.situ.mall.goods.service.IGoodsService;
import com.situ.until.FmtEmpty;

@Service
public class GoodsServiceImpl  implements IGoodsService{

	@Autowired
	private GoodsMapper userMapper;
	@Override
	public int insert(GoodsModel GoodsModel) {
		GoodsModel  gm=userMapper.selectByCode(GoodsModel.getCode());
		if (FmtEmpty.isEmpty(gm)) { // 若em为空则说明数据库中无此条记录
			userMapper.insert(GoodsModel);
			return 0;
		}
		return 1;
	}

	@Override
	public int delete(GoodsModel GoodsModel) {
		
		return userMapper.delete(GoodsModel);
	}

	@Override
	public int update(GoodsModel GoodsModel) {
		
		return userMapper.update(GoodsModel);
	}

	@Override
	public GoodsModel selectByCode(String code) {
		return userMapper.selectByCode(code);
		
	}

	@Override
	public GoodsModel selectById(Integer id) {
		
		return userMapper.selectById(id);
	}

	@Override
	public Object selectCount(GoodsModel GoodsModel) {
		
		return userMapper.selectCount(GoodsModel);
	}

	@Override
	public List<GoodsModel> selectModel(GoodsModel GoodsModel) {
		
		return userMapper.selectModel(GoodsModel);
	}

	@Override
	public List<GoodsModel> selectAll(GoodsModel GoodsModel) {
		
		return userMapper.selectAll(GoodsModel);
	}

}
