package com.situ.crm.ussd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.ussd.mapper.CustomerMapper;
import com.situ.crm.ussd.model.CustomerModel;

import tool.FmtEmpty;

@Service
public class CustomerServiceImpl implements ICommonService<CustomerModel>{
	
	
	@Autowired
	private CustomerMapper customerMapper;
	
	
	public String insertByUQCode(CustomerModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  
		return "3";
	}

	public int insert(CustomerModel model) {
		return customerMapper.insert(model);
	}

	public int delete(CustomerModel model) {
		return customerMapper.delete(model);
	}

	public int update(CustomerModel model) {
		return customerMapper.update(model);
	}

	public List<CustomerModel> selectList(CustomerModel model) {
		return customerMapper.selectList(model);
	}

	public int selectCount(CustomerModel model) {
		return customerMapper.selectCount(model);
	}

	public CustomerModel selectModel(CustomerModel model) {
		CustomerModel user1 = new CustomerModel();
		user1.setCode(model.getCode());
		List<CustomerModel> list = customerMapper.selectList(user1);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<CustomerModel> selectName(CustomerModel model) {
		return null;
	}

}
