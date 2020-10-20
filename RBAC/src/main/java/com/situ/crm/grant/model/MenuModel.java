package com.situ.crm.grant.model;

import java.util.ArrayList;
import java.util.List;

import com.situ.base.model.BaseModel;

public class MenuModel  extends BaseModel{
	private String menuUrl;  //菜单地 址
	private String parentCode;  //上级菜单
	private String order;  //排序 1是一级菜单 2是二级菜单
	private String img; //菜单图标
	private String parentName;
	private List<MenuModel> child =new ArrayList<MenuModel>();
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public List<MenuModel> getChild() {
		return child;
	}
	public void setChild(List<MenuModel> child) {
		this.child = child;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	@Override
	public String toString() {
		return "MenuModel [menuUrl=" + menuUrl + ", parentCode=" + parentCode + ", order=" + order + ", parentName="
				+ parentName + ", child=" + child + "]";
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
}
