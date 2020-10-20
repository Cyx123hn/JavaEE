package com.situ.mall.user.service;

import java.util.List;

import com.situ.mall.user.model.UserModel;





public interface IUserService {

	int insert(UserModel model);
	int  delete(UserModel model) ;
	int  update(UserModel model);
	UserModel  selectById(Integer id);
	List<UserModel> selectAll(UserModel model);
	List<UserModel> selectModel(UserModel model);
    int selectCount(UserModel model);
	UserModel selectByCode(String code);
}
