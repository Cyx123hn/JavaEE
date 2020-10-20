package com.situ.base.service;

import java.util.List;


public interface ICommonService<T> {
	String insertByUQCode(T model);
	
	int insert(T model);
	
	int delete(T model);
	
	int update(T model);
	
	List<T> selectList(T model);
	
	int selectCount(T model);
	
	T selectModel(T model);
	
	 List<T> selectName(T model);
}
