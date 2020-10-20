package com.situ.crm.ussd.model;

import java.sql.Timestamp;

import com.situ.base.model.BaseModel;

public class CommunicationModel extends BaseModel{
	private String userCode;
	private String custCode;
	private String userName;
	private String custName;
	private Timestamp time;
	private String type;
	private String content;
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
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	@Override
	public String toString() {
		return "CommunicationModel [userCode=" + userCode + ", custCode=" + custCode + ", userName=" + userName
				+ ", custName=" + custName + ", time=" + time + ", type=" + type + ", content=" + content + "]";
	}
	
}
