package com.situ.crm.ussd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.ussd.mapper.StatusInfoMapper;
import com.situ.crm.ussd.model.StatusInfoModel;

import tool.FmtEmpty;

@Service
public class StatusInfoServiceImpl implements ICommonService<StatusInfoModel>{
	@Autowired
	private StatusInfoMapper statusInfoMapper;

	public String insertByUQCode(StatusInfoModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(StatusInfoModel model) {
		return statusInfoMapper.insert(model);
	}

	public int delete(StatusInfoModel model) {
		return statusInfoMapper.delete(model);
	}

	public int update(StatusInfoModel model) {
		StatusInfoModel model2 =new StatusInfoModel();
		model2.setRoleCode(model.getRoleCode());
		model2.setStatusCode(model.getStatusCode());
		if(selectModel(model2)==null || selectModel(model2).getId().equals(model.getId())) {
		  return statusInfoMapper.update(model);
		}
		return 2;
	}

	public List<StatusInfoModel> selectList(StatusInfoModel model) {
		return statusInfoMapper.selectList(model);
	}

	public int selectCount(StatusInfoModel model) {
		return statusInfoMapper.selectCount(model);
	}

	public StatusInfoModel selectModel(StatusInfoModel model) {
		List<StatusInfoModel> list = statusInfoMapper.selectList(model);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<StatusInfoModel> selectName(StatusInfoModel model) {
		return null;
	}
	
	
}
