package com.situ.base.model;

import tool.Pager;

public class BaseModel  extends Pager{
	private String createTime; //创建时间
	private String updateTime; //更新时间
	private String creatrBy;   //创建人（主键）
	private String updateBy;    //更新人（主键）
	private Integer deleted=0;  //删除标志（0=未删，1=删除—）
	private Integer state =1;	//状态标志（0=禁用，1可用)
	private String orderBy;		//排序
	protected String name;		//名称
	protected String code;		//编号
	private Integer id;			//id
	private String descr;		//描述
	private String type;		//类型
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getCreatrBy() {
		return creatrBy;
	}
	public void setCreatrBy(String creatrBy) {
		this.creatrBy = creatrBy;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
