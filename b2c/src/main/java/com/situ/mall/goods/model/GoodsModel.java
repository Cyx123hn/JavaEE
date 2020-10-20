package com.situ.mall.goods.model;

import com.situ.until.Pager;

public class GoodsModel extends Pager {
  	
	private  Integer id;
	private  String code;
	private  String name;
	private  String price;  //单价
	private  String descr;  //描述
	private  String inventory;  //库存
	private  String  state;  //状态 上架，下架
	private  String  typeCode;  //商品分类主键
	private String  parentcode;   //一级分类主键
	private String  typeName;
	private String  url;
	public GoodsModel() {}
	public GoodsModel( String code) {
		this.code=code;
	}
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	
	
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	

	@Override
	public String toString() {
		return "GoodsModel [id=" + id + ", code=" + code + ", name=" + name + ", price=" + price + ", descr=" + descr
				+ ", inventory=" + inventory + ", state=" + state + ", typeCode=" + typeCode + ", parentcode="
				+ parentcode + ", typeName=" + typeName + ", url=" + url + "]";
	}
	
	
	
	
}
