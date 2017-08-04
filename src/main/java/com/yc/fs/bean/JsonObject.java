package com.yc.fs.bean;

import java.io.Serializable;

public class JsonObject implements Serializable {
	private static final long serialVersionUID = 1L;
	private int pageNo = 1;
	private int pageSize = 10;
	private int total = 0;
	private Object rows = null;

	public JsonObject(int pageNo, int pageSize, int total, Object rows) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.total = total;
		this.rows = rows;
	}
	
	public JsonObject(int pageNo, int pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public JsonObject() {
		super();
	}

	@Override
	public String toString() {
		return "JsonObject [pageNo=" + pageNo + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + "]";
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

}
