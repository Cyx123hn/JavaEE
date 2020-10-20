package com.situ.crm.grant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.mapper.RelMapper;
import com.situ.crm.grant.model.RelModel;

import tool.FmtEmpty;

@Service
public class RelServiceImpl implements ICommonService<RelModel>{
	
	@Autowired
	private RelMapper relMapper;

	public String insertByUQCode(RelModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(RelModel model) {
	
		return relMapper.insert(model);
	}

	public int delete(RelModel model) {
		return relMapper.delete(model);
	}

	public int update(RelModel model) {//根据roleCode和menuCode查不到，或者查到的id为更新的id;则更新
		RelModel model2 =new RelModel();
		model2.setRoleCode(model.getRoleCode());
		model2.setMenuCode(model.getMenuCode());
		if(selectModel(model2)==null || selectModel(model2).getId().equals(model.getId())) {
		  return relMapper.update(model);
		}
		return 2;
	}

	public List<RelModel> selectList(RelModel model) {
		return relMapper.selectList(model);
	}

	public int selectCount(RelModel model) {
		return relMapper.selectCount(model);
	}

	public RelModel selectModel(RelModel model) {
		 System.err.println(model);
		List<RelModel> list = relMapper.selectList(model);
		
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<RelModel> selectName(RelModel model) {
		return null;
	}
	
}
