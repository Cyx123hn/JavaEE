package com.situ.mall.goods.model;

import com.situ.until.Pager;

public class GoodsImgModel  extends Pager{
	private  Integer id;
    private  String goodsCode;
    private String  url;
    private String  type;
    
    public GoodsImgModel() {}
    public GoodsImgModel(String goodsCode ) {
    	this.goodsCode=goodsCode;
    	
    }
    public GoodsImgModel(String goodsCode,String url,String type) {
    	this.goodsCode=goodsCode;
    	this.url=url;
    	this.type=type;
    	
    }
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "GoodsImgModel [id=" + id + ", goodsCode=" + goodsCode + ", url=" + url + ", type=" + type + "]";
	}
	
    
    
}
