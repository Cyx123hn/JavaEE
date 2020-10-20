package com.situ.crm.grant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.mapper.UserMapper;
import com.situ.crm.grant.model.UserModel;

import tool.FmtEmpty;
@Service
public class UserServiceImpl implements ICommonService<UserModel>{

		@Autowired
		private UserMapper userMapper;

		/**
		 ** @param UserModel
	     * @return 1=账号已存在 2=失败 0=成功
		 */
		public String insertByUQCode(UserModel model) {
			if(selectModel(model)==null)
				return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
			return "3";
		}

		public int insert(UserModel model) {
			return userMapper.insert(model);
		}

		public int delete(UserModel model) {
			UserModel model2 =new UserModel();
			model2.setParentCode(model.getCode());
			if(!FmtEmpty.isEmpty(userMapper.selectList(model2))) {
				return 2;
			}
			return userMapper.delete(model);
		}

		public int update(UserModel model) {
			return userMapper.update(model);
		}

		public List<UserModel> selectList(UserModel model) {
			return userMapper.selectList(model);
		}

		public int selectCount(UserModel model) {
			return userMapper.selectCount(model);
		}

		public UserModel selectModel(UserModel model) {
			UserModel user1 = new UserModel();
			user1.setCode(model.getCode());
			List<UserModel> list = userMapper.selectList(user1);
			return FmtEmpty.isEmpty(list) ? null : list.get(0);
		}

		public List<UserModel> selectName(UserModel model) {
			return null;
		}

}
