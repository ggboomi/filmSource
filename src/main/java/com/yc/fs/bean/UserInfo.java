package com.yc.fs.bean;

public class UserInfo {
	private int muid; //编号
	private String uname; //姓名
	private String pwd;//密码
	private String pow;//权限
	private String photo;//图片
	private int score; //积分
	
	@Override
	public String toString() {
		return "UserInfo [muid=" + muid + ", uname=" + uname + ", pwd=" + pwd
				+ ", pow=" + pow + ", photo=" + photo + ", score=" + score + "]";
	}

	public int getMuid() {
		return muid;
	}

	public void setMuid(int muid) {
		this.muid = muid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPow() {
		return pow;
	}

	public void setPow(String pow) {
		this.pow = pow;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public UserInfo(int muid, String uname, String pwd, String pow, String photo,
			int score) {
		super();
		this.muid = muid;
		this.uname = uname;
		this.pwd = pwd;
		this.pow = pow;
		this.photo = photo;
		this.score = score;
	}

	public UserInfo() {
		super();
	}
	
}
