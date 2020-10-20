package com.situ.mall.goods.model;

import com.situ.until.Pager;

public class GoodsTypeModel  extends Pager{

	 
		private  Integer id;
		private String code;
		private String  descr;
		private String  parentcode;
		private String  name;
		
		public GoodsTypeModel(){}
		public GoodsTypeModel(String code){
			this.code=code;
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
		public String getDescr() {
			return descr;
		}
		public void setDescr(String descr) {
			this.descr = descr;
		}
		public String getParentcode() {
			return parentcode;
		}
		public void setParentcode(String parentcode) {
			this.parentcode = parentcode;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		@Override
		public String toString() {
			return "GoodsTypeModel [id=" + id + ", code=" + code + ", descr=" + descr + ", parentcode=" + parentcode
					+ ", name=" + name + "]";
		}
		
		
}
