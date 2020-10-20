package com.situ.crm.ussd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.ussd.mapper.StatusMapper;
import com.situ.crm.ussd.model.StatusModel;

import tool.FmtEmpty;

@Service
public class StatusServiceImpl implements ICommonService<StatusModel>{
	
	@Autowired
	private StatusMapper statusMapper;

	public String insertByUQCode(StatusModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(StatusModel model) {
		return statusMapper.insert(model);
	}

	public int delete(StatusModel model) {
		return statusMapper.delete(model);
	}

	public int update(StatusModel model) {
		return statusMapper.update(model);
	}

	public List<StatusModel> selectList(StatusModel model) {
		return statusMapper.selectList(model);
	}

	public int selectCount(StatusModel model) {
		return statusMapper.selectCount(model);
	}

	public StatusModel selectModel(StatusModel model) {
		StatusModel user1 = new StatusModel();
		user1.setCode(model.getCode());
		List<StatusModel> list = statusMapper.selectList(user1);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<StatusModel> selectName(StatusModel model) {
		return null;
	}

}
