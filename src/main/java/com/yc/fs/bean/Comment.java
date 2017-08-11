package com.yc.fs.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private long cid;
	private long cuid;
	private String ccontent;
	private String cdate;

	public Comment(long cid,long cuid, String ccontent, String cdate) {
		super();
		this.cid=cid;
		this.cuid = cuid;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}

	public Comment() {
		super();
	}
	
	public Map<String,Object> commentToMap(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("cuid", cuid);
		map.put("ccontent", ccontent);
		map.put("cdate", cdate);
		return map;
	}

	public long getCid() {
		return cid;
	}

	public void setCid(long cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Comment [cuid=" + cuid + ", ccontent=" + ccontent + ", cdate=" + cdate + "]";
	}

	public long getCuid() {
		return cuid;
	}

	public void setCuid(long cuid) {
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
