package com.situ.mall.order.model;



import java.sql.Timestamp;

import com.situ.until.Pager;

public class OrderModel  extends Pager{

 private Integer id;
 private  String code;
 private  String userCode;  
 private Timestamp entryTime;   
 private String typeCode;  //收货地址主键
 private  String state;
 
 public static void main(String[] args) {
	 Timestamp t=new Timestamp(System.currentTimeMillis());
	 System.out.println(t.toString());
	 System.out.println();
}
 
 private  String userName; 
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
public String getUserCode() {
	return userCode;
}
public void setUserCode(String userCode) {
	this.userCode = userCode;
}
public Timestamp getEntryTime() {
	return entryTime;
}
public void setEntryTime(Timestamp entryTime) {
	this.entryTime = entryTime;
}
public String getTypeCode() {
	return typeCode;
}
public void setTypeCode(String typeCode) {
	this.typeCode = typeCode;
}



public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
@Override
public String toString() {
	return "OrderModel [id=" + id + ", code=" + code + ", userCode=" + userCode + ", entryTime=" + entryTime
			+ ", typeCode=" + typeCode + ", state=" + state + ", userName=" + userName + "]";
}


}
