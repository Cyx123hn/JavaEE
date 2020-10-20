package com.situ.mall.user.model;

import com.situ.until.Pager;
 
public class UserModel   extends  Pager {
    
	private  Integer id;
	private String code;
	private String  pass;
	private String  name;
	private String  admin;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", code=" + code + ", pass=" + pass + ", name=" + name + ", admin=" + admin
				+ "]";
	}
	
	
	
}
