package com.situ.mall.user.mapper;

import java.util.List;

import com.situ.mall.user.model.UserModel;



  

public interface UserMapper {
  
	int insert(UserModel model);
	int delete(UserModel model);
	UserModel selectById(Object id);
	UserModel selectByCode(String code);
	List<UserModel> selectAll(UserModel model);
	List<UserModel> selectModel(UserModel model);
    int selectCount(UserModel model);
    int update(UserModel model) ;
}
