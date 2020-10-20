package com.situ.crm.grant.mapper;

import java.util.List;

import com.situ.base.mapper.BaseMapper;
import com.situ.crm.grant.model.MenuModel;

public interface MenuMapper extends BaseMapper<MenuModel>{
	List<MenuModel> selectMenu(MenuModel model);
}
