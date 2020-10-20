package com.situ.crm.grant.model;

import com.situ.base.model.BaseModel;

public class RelModel  extends BaseModel{
	private String roleCode;
	private String menuCode;
	private String roleName;
	private String menuName;
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	@Override
	public String toString() {
		return "RelModel [roleCode=" + roleCode + ", menuCode=" + menuCode + ", roleName=" + roleName + ", menuName="
				+ menuName + "]";
	}
	
	
	
	
	
}
