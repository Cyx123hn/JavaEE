package com.situ.crm.grant.model;

import com.situ.base.model.BaseModel;

public class UserModel extends BaseModel{
	private String code;
	private String name;
	private String userPass;  //密码
	private String parentCode;  //上级领导编号
	private String roleCode;  //角色编号
	private String roleName;
	private String parentName;
	
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	@Override
	public String toString() {
		return "UserModel [userPass=" + userPass + ", parentCode=" + parentCode + ", roleCode=" + roleCode + "]";
	}
	
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
	
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public UserModel() {
		
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public UserModel(String code,String name,String userPass,String roleName,String parentName ) {
		this.code =code;
		this.userPass =userPass;
		this.name=name;
		this.roleName=roleName;
		this.parentName=parentName;
	}
	
	
}
