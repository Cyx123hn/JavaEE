package com.situ.crm.ussd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.ussd.mapper.CommunicationMapper;
import com.situ.crm.ussd.model.CommunicationModel;

import tool.FmtEmpty;

@Service
public class CommunicationServiceImpl implements ICommonService<CommunicationModel> {
	@Autowired
	private CommunicationMapper communicationMapper;
	

	public String insertByUQCode(CommunicationModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(CommunicationModel model) {
		 communicationMapper.insert(model);
		 return 2;
	}

	public int delete(CommunicationModel model) {
		return communicationMapper.delete(model);
	}

	public int update(CommunicationModel model) {//根据UserCode和CustCode查不到，或者查到的id为更新的id;则更新
//		CommunicationModel model2 =new CommunicationModel();
//		model2.setUserCode(model.getUserCode());
//		model2.setCustCode(model.getCustCode());
//		if(selectModel(model2)==null || selectModel(model2).getId().equals(model.getId())) {
//		  return communicationMapper.update(model);
//		}
		return communicationMapper.update(model);
	}

	public List<CommunicationModel> selectList(CommunicationModel model) {
		return communicationMapper.selectList(model);
	}

	public int selectCount(CommunicationModel model) {
		return communicationMapper.selectCount(model);
	}

	public CommunicationModel selectModel(CommunicationModel model) {
		List<CommunicationModel> list = communicationMapper.selectList(model);
		
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<CommunicationModel> selectName(CommunicationModel model) {
		return null;
	}
}
