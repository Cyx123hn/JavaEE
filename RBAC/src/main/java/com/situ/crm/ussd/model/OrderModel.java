package com.situ.crm.ussd.model;

import java.sql.Timestamp;

import com.situ.base.model.BaseModel;

public class OrderModel extends BaseModel{
	private String userCode;
	private String userName;
	private String custCode;
	private String custName;
	private String prodName;
	private String prodCode;
	private String count;
	private Timestamp time;
	private String statusCode;
	private String statusName;
	private String roleCode;
	
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getCustCode() {
		return custCode;
	}
	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}
	public String getProdCode() {
		return prodCode;
	}
	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	@Override
	public String toString() {
		return "OrderModel [userCode=" + userCode + ", userName=" + userName + ", custCode=" + custCode + ", custName="
				+ custName + ", prodName=" + prodName + ", prodCode=" + prodCode + ", count=" + count + ", time=" + time
				+ ", statusCode=" + statusCode + ", statusName=" + statusName + "]";
	}
	
	                                     
}
