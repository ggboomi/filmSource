package com.yc.fs.bean;

import java.io.Serializable;

public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;

	private int cuid;
	private String ccontent;
	private String cdate;

	public Comment(int cuid, String ccontent, String cdate) {
		super();
		this.cuid = cuid;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}

	public Comment() {
		super();
	}

	@Override
	public String toString() {
		return "Comment [cuid=" + cuid + ", ccontent=" + ccontent + ", cdate=" + cdate + "]";
	}

	public int getCuid() {
		return cuid;
	}

	public void setCuid(int cuid) {
		this.cuid = cuid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

}
