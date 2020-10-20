package com.situ.mall.goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.goods.mapper.GoodsImgMapper;

import com.situ.mall.goods.model.GoodsImgModel;
import com.situ.mall.goods.service.IGoodsImgService;
import com.situ.until.FmtEmpty;
@Service
public class GoodsImgImpl implements IGoodsImgService {
	@Autowired
	private GoodsImgMapper userMapper;
	@Override
	public int insert(GoodsImgModel GoodsImgModel) {
//		GoodsImgModel  gm=userMapper.selectByCode(GoodsImgModel.getGoodsCode());
//		if (FmtEmpty.isEmpty(gm)) { // 若em为空则说明数据库中无此条记录
			userMapper.insert(GoodsImgModel);
			return 0;
//		}
//		return 1;
	}

	@Override
	public int delete(GoodsImgModel GoodsImgModel) {
		
		return userMapper.delete(GoodsImgModel);
	}

	@Override
	public int update(GoodsImgModel GoodsImgModel) {
		
		return userMapper.update(GoodsImgModel);
	}

	@Override
	public GoodsImgModel selectByCode(String code) {
		return userMapper.selectByCode(code);
		
	}

	@Override
	public GoodsImgModel selectById(Integer id) {
		
		return userMapper.selectById(id);
	}

	@Override
	public Object selectCount(GoodsImgModel GoodsImgModel) {
		
		return userMapper.selectCount(GoodsImgModel);
	}

	@Override
	public List<GoodsImgModel> selectModel(GoodsImgModel GoodsImgModel) {
		
		return userMapper.selectModel(GoodsImgModel);
	}

	@Override
	public List<GoodsImgModel> selectAll(GoodsImgModel GoodsImgModel) {
		
		return userMapper.selectAll(GoodsImgModel);
	}

}
