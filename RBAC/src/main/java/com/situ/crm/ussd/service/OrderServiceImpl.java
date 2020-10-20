package com.situ.crm.ussd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.model.UserModel;
import com.situ.crm.ussd.mapper.OrderMapper;
import com.situ.crm.ussd.mapper.StatusInfoMapper;
import com.situ.crm.ussd.model.OrderModel;
import com.situ.crm.ussd.model.StatusInfoModel;

import tool.FmtEmpty;

@Service
public class OrderServiceImpl implements ICommonService<OrderModel>{
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private StatusInfoMapper statusInfoMapper;
	
	public String insertByUQCode(OrderModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(OrderModel model) {
		return orderMapper.insert(model);
	}

	public int delete(OrderModel model) {
		return orderMapper.delete(model);
	}

	public int update(OrderModel model,HttpServletRequest request) {
		OrderModel model2 =new OrderModel();
		model2.setId(model.getId());
		model2=selectModel(model2);
		System.out.println(model2);
		StatusInfoModel model3 =new StatusInfoModel();
		model3.setStatusCode(model2.getStatusCode());
		UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
		model3.setRoleCode(sessionUser.getRoleCode());
		if(FmtEmpty.isEmpty(statusInfoMapper.selectList(model3))) {
			return 6;  //状态权限中没有，无权限修改
		}
		return orderMapper.update(model);
	}

	public List<OrderModel> selectList(OrderModel model) {
		return orderMapper.selectList(model);
	}

	public int selectCount(OrderModel model) {
		return orderMapper.selectCount(model);
	}

	public OrderModel selectModel(OrderModel model) {
		List<OrderModel> list = orderMapper.selectList(model);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<OrderModel> selectName(OrderModel model) {
		return null;
	}

	public int update(OrderModel model) {
		return 0;
	}
}
