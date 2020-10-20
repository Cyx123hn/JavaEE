package com.situ.crm.grant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.mapper.RelMapper;
import com.situ.crm.grant.mapper.RoleMapper;
import com.situ.crm.grant.mapper.UserMapper;
import com.situ.crm.grant.model.RelModel;
import com.situ.crm.grant.model.RoleModel;
import com.situ.crm.grant.model.UserModel;

import tool.FmtEmpty;

@Service
public class RoleServiceImpl implements ICommonService<RoleModel> {
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired 
	private RelMapper relMapper;

	public String insertByUQCode(RoleModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(RoleModel model) {
		return roleMapper.insert(model);
	}

	public int delete(RoleModel model) {
		UserModel model2 =new UserModel();
		model2.setRoleCode(model.getCode());
		RelModel model3=new RelModel();
		model3.setRoleCode(model.getCode());
		if(!FmtEmpty.isEmpty(userMapper.selectList(model2)))
		{
			return 2; //非空，用户表中角色正在使用
		}
		if(!FmtEmpty.isEmpty(relMapper.selectList(model3))) {
			return 3;//权限表中使用该角色
		}
		return roleMapper.delete(model);
	}

	public int update(RoleModel model) {
		return roleMapper.update(model);
	}

	public List<RoleModel> selectList(RoleModel model) {
		return roleMapper.selectList(model);
	}

	public int selectCount(RoleModel model) {
		return roleMapper.selectCount(model);
	}

	public RoleModel selectModel(RoleModel model) {
		RoleModel user1 = new RoleModel();
		user1.setCode(model.getCode());
		List<RoleModel> list = roleMapper.selectList(user1);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<RoleModel> selectName(RoleModel model) {
		return null;
	}
	
}
