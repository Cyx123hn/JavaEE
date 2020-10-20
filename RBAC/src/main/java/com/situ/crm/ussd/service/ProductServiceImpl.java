package com.situ.crm.ussd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.ussd.mapper.ProductMapper;
import com.situ.crm.ussd.model.ProductModel;

import tool.FmtEmpty;

@Service
public class ProductServiceImpl implements ICommonService<ProductModel>{
	
	@Autowired
	private ProductMapper productMapper;

	public String insertByUQCode(ProductModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  
		return "3";
	}

	public int insert(ProductModel model) {
		return productMapper.insert(model);
	}

	public int delete(ProductModel model) {
		return productMapper.delete(model);
	}

	public int update(ProductModel model) {
		return productMapper.update(model);
	}

	public List<ProductModel> selectList(ProductModel model) {
		return productMapper.selectList(model);
	}

	public int selectCount(ProductModel model) {
		return productMapper.selectCount(model);
	}

	public ProductModel selectModel(ProductModel model) {
		ProductModel user1 = new ProductModel();
		user1.setCode(model.getCode());
		List<ProductModel> list = productMapper.selectList(user1);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<ProductModel> selectName(ProductModel model) {
		return null;
	}
}
