package com.yc.fs.bean;

public class File {
	private int fid;
	private String tids;
	private String fname;
	private String fpic;
	private Double grade;
	private String country;
	private int myear;
	private String uptime;
	private String othername;
	private String dname;
	private String sname;
	private String aname;
	private String imdb;
	private String downlink;
	private String beizhu;
	private String intro;

	@Override
	public String toString() {
		return "File [fid=" + fid + ", tids=" + tids + ", fname=" + fname + ", fpic=" + fpic + ", grade=" + grade
				+ ", country=" + country + ", myear=" + myear + ", uptime=" + uptime + ", othername=" + othername
				+ ", dname=" + dname + ", sname=" + sname + ", aname=" + aname + ", imdb=" + imdb + ", downlink="
				+ downlink + ", beizhu=" + beizhu + ", intro=" + intro + "]";
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getTids() {
		return tids;
	}

	public void setTids(String tids) {
		this.tids = tids;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFpic() {
		return fpic;
	}

	public void setFpic(String fpic) {
		this.fpic = fpic;
	}

	public Double getGrade() {
		return grade;
	}

	public void setGrade(Double grade) {
		this.grade = grade;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getMyear() {
		return myear;
	}

	public void setMyear(int myear) {
		this.myear = myear;
	}

	public String getUptime() {
		return uptime;
	}

	public void setUptime(String uptime) {
		this.uptime = uptime;
	}

	public String getOthername() {
		return othername;
	}

	public void setOthername(String othername) {
		this.othername = othername;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getImdb() {
		return imdb;
	}

	public void setImdb(String imdb) {
		this.imdb = imdb;
	}

	public String getDownlink() {
		return downlink;
	}

	public void setDownlink(String downlink) {
		this.downlink = downlink;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public File(int fid, String tids, String fname, String fpic, Double grade, String country, int myear, String uptime,
			String othername, String dname, String sname, String aname, String imdb, String downlink, String beizhu,
			String intro) {
		super();
		this.fid = fid;
		this.tids = tids;
		this.fname = fname;
		this.fpic = fpic;
		this.grade = grade;
		this.country = country;
		this.myear = myear;
		this.uptime = uptime;
		this.othername = othername;
		this.dname = dname;
		this.sname = sname;
		this.aname = aname;
		this.imdb = imdb;
		this.downlink = downlink;
		this.beizhu = beizhu;
		this.intro = intro;
	}

	public File() {
		super();
	}

}
