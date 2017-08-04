package com.yc.fs.bean;

public class FilmType {
	private int tid;
	private int mtype;
	private String tname;
	@Override
	public String toString() {
		return "FilmType [tid=" + tid + ", mtype=" + mtype + ", tname=" + tname
				+ "]";
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public FilmType(int tid, int mtype, String tname) {
		super();
		this.tid = tid;
		this.mtype = mtype;
		this.tname = tname;
	}
	public FilmType() {
		super();
	}
	
	
}
