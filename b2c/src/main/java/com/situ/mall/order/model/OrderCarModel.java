package com.situ.mall.order.model;

import com.situ.until.Pager;

public class OrderCarModel  extends Pager{

	private Integer id;
	private String userCode; // 用户编号
	private String goodsCode;  //商品编号
	private String num;
	private String url;
	private String price;
	private String name;
	private String subtotal; //小计
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
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
	public String getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(String subtotal) {
		this.subtotal = subtotal;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "OrderCarModel [id=" + id + ", userCode=" + userCode + ", goodsCode=" + goodsCode + ", num=" + num
				+ ", url=" + url + ", price=" + price + ", name=" + name + ", subtotal=" + subtotal + "]";
	}
	
	
	
}
