package com.yc.fs.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	private int pid; // id
	private int uid; // 发帖用户id
	private String pname; // 标题
	private String pcontent; // 信息
	private String pdate; // 发布时间
	private String types;  //板块信息

	private List<Comment> comment; // 评论

	public Map<String, Object> getPostInfoToMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("_id", new Date().getTime());
		map.put("pid", pid);
		map.put("uid", uid);
		map.put("pname", pname);
		map.put("pcontent", pcontent);
		map.put("pdate", pdate);
		map.put("types", types);
		map.put("num", 0);

		Map<String, Object> opt = new HashMap<String, Object>();
		if (comment != null) {
			for (Comment ct : comment) {
				
				opt.put(String.valueOf(ct.getCid()),ct.commentToMap());
			}
		}

		map.put("opts", new String[] {});
		return map;
	}

	public PostInfo() {
		super();
	}

	public PostInfo(int pid, int uid, String pname, String pcontent, String pdate, List<Comment> comment) {
		super();
		this.pid = pid;
		this.uid = uid;
		this.pname = pname;
		this.pcontent = pcontent;
		this.pdate = pdate;
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "PostInfo [pid=" + pid + ", uid=" + uid + ", pname=" + pname + ", pcontent=" + pcontent + ", pdate="
				+ pdate + ", comment=" + comment + "]";
	}

	public int getPid() {
		return pid;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

}
