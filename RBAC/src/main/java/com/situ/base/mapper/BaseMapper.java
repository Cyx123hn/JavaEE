package com.situ.base.mapper;

import java.util.List;


public interface BaseMapper<T> {
	int insert(T model);
	
	int delete(T model);
	
	int update(T model);
	
	List<T> selectList(T model);
	
	int selectCount(T model);
}
