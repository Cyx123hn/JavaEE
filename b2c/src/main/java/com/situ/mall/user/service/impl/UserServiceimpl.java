package com.situ.mall.user.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.user.mapper.UserMapper;
import com.situ.mall.user.model.UserModel;
import com.situ.mall.user.service.IUserService;
import com.situ.until.FmtEmpty;
import com.situ.until.MD5;


@Service
public class UserServiceimpl implements  IUserService {
	

	@Autowired
	private UserMapper userMapper;
	 
	@Override
	public int insert(UserModel model) {
	 	model.setPass(MD5.encode(model.getPass()));
		UserModel em=selectByCode(model.getCode());
		if(FmtEmpty.isEmpty(em)) {  //若em为空则说明数据库中无此条记录
			 userMapper.insert(model);
			return 0;
		}
		 return   1;
		
	}
	@Override
	public int  delete(UserModel model) {
		
		 return  userMapper.delete(model);
		
	}
	@Override
	public int update(UserModel model) {
		model.setPass(MD5.encode(model.getPass()));
	
		return userMapper.update(model);
	}
	
	
	@Override
	public UserModel selectById(Integer id) {
		
		return userMapper.selectById(id);
	}
	@Override
	public List<UserModel> selectAll(UserModel model) {
		
		return userMapper.selectAll(model);
	}
	@Override
	public List<UserModel> selectModel(UserModel model) {
		List<UserModel> list=userMapper.selectModel(model);
		
		return list;
	}
	@Override
	public int selectCount(UserModel model) {
		
		return  userMapper.selectCount(model);
	}
	@Override
	public UserModel selectByCode(String code) {
		
		return userMapper.selectByCode(code);
	}
	
	
}
