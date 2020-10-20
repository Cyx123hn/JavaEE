package com.situ.crm.grant.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.base.service.ICommonService;
import com.situ.crm.grant.mapper.MenuMapper;
import com.situ.crm.grant.mapper.RelMapper;
import com.situ.crm.grant.model.MenuModel;
import com.situ.crm.grant.model.RelModel;

import tool.FmtEmpty;

@Service
public class MenuServiceImpl implements ICommonService<MenuModel> {
	
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private RelMapper relMapper;

	public String insertByUQCode(MenuModel model) {
		if(selectModel(model)==null)
			return FmtEmpty.isEmpty(insert(model)) ? "4" : "5";  //插入成功返回0
		return "3";
	}

	public int insert(MenuModel model) {
		return menuMapper.insert(model);
	}

	public int delete(MenuModel model) {
		MenuModel model3 =new MenuModel();
		model3.setParentCode(model.getCode());
		if(!FmtEmpty.isEmpty(menuMapper.selectList(model3))) {
			return 3; //有二级菜单
		}
		RelModel model2 =new RelModel();
		model2.setMenuCode(model.getCode());
		if(!FmtEmpty.isEmpty(relMapper.selectList(model2))) {
			return 2;  //权限表有菜单
		}
		
		return menuMapper.delete(model);
	}

	public int update(MenuModel model) {
		return menuMapper.update(model);
	}

	public List<MenuModel> selectList(MenuModel model) {
		return menuMapper.selectList(model);
	}

	public int selectCount(MenuModel model) {
		return menuMapper.selectCount(model);
	}

	public MenuModel selectModel(MenuModel model) {
		MenuModel user1 = new MenuModel();
		user1.setCode(model.getCode());
		List<MenuModel> list = menuMapper.selectList(user1);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}
	
	public List<MenuModel> selectName(MenuModel model){
		List<MenuModel> list = new ArrayList<MenuModel>();
		model.setParentCode("menu");
		list.addAll(selectList(model));
		model.setParentCode("menu0");
		list.addAll(selectList(model));
		return list;
	}
	public List<MenuModel> selectMenu(MenuModel model){
		return menuMapper.selectMenu(model);
	}

}
