package com.situ.mall.order.model;

import com.situ.until.Pager;

public class OrderGoodsModel  extends Pager{

	private  Integer id;
	private String orderCode;
	private String  goodsCode;
	private String  num;
	private String price;
	private String  goodsName;
	private String  url;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "OrderGoodsModel [id=" + id + ", orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", num=" + num
				+ ", price=" + price + ", goodsName=" + goodsName + ", url=" + url + "]";
	}
	
}
