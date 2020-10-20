package com.situ.crm.ussd.model;

import com.situ.base.model.BaseModel;

public class ProductModel extends BaseModel{
	private String sum;
	private String cost;
	private String content;
	
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ProductModel [sum=" + sum + ", cost=" + cost + ", content=" + content + "]";
	}
	
	
	
}
