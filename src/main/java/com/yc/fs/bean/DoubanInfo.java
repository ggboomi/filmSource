package com.yc.fs.bean;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class DoubanInfo {
	private String year; 
	private String id;  //豆瓣编号
	private String alt;  //豆瓣地址
	private String mobile_url; //豆瓣链接
	private String title; //电影名字
	private String[] countries; //国家
	private String[] genres; //类型
	private String[] aka;  //又名
	private String summary; //简介
	private String average; //评分
	private String bImg; //大海报
	private String sImg; //小海报
	
	
	private Object rating;
	private Object images;

	private List<Object> casts;
	
	private List<Object> directors;
	
	private List<String> cast;  //演员名
	private List<String> dire;  //导演名
	
	public Object getImages() {
		return images;
	}

	public void setImages(Object images) {
		this.images = images;
	}

	public DoubanInfo(String year, String id, String alt, String mobile_url, String title, String[] countries,
			String[] genres, String[] aka, String summary,Object rating) {
		super();
		this.year = year;
		this.id = id;
		this.alt = alt;
		this.mobile_url = mobile_url;
		this.title = title;
		this.countries = countries;
		this.genres = genres;
		this.aka = aka;
		this.summary = summary;
		this.rating = rating;
		System.out.println("jjj");
	}

	public DoubanInfo() {
		super();
	}

	public String getAverage() {
		return average;
	}

	public void setAverage(String average) {
		this.average = average;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAlt() {
		return alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
	}

	public String getMobile_url() {
		return mobile_url;
	}

	public void setMobile_url(String mobile_url) {
		this.mobile_url = mobile_url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String[] getCountries() {
		return countries;
	}

	public void setCountries(String[] countries) {
		this.countries = countries;
	}

	public String[] getGenres() {
		return genres;
	}

	public void setGenres(String[] genres) {
		this.genres = genres;
	}

	public String[] getAka() {
		return aka;
	}

	public void setAka(String[] aka) {
		this.aka = aka;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	
	@Override
	public String toString() {
		return "DoubanInfo [year=" + year + ", id=" + id + ", alt=" + alt + ", mobile_url=" + mobile_url + ", title="
				+ title + ", countries=" + Arrays.toString(countries) + ", genres=" + Arrays.toString(genres) + ", aka="
				+ Arrays.toString(aka) + ", summary=" + summary +", rating=" + rating +", average=" + average 
				+ ", images=" + images +", cast=" + cast +", dire=" + dire +"]";
	}

	public Object getRating() {
		return rating;
	}

	public void setRating(Object rating) {
		this.rating = rating;
	}

	public String getbImg() {
		return bImg;
	}

	public void setbImg(String bImg) {
		this.bImg = bImg;
	}

	public String getsImg() {
		return sImg;
	}

	public void setsImg(String sImg) {
		this.sImg = sImg;
	}

	public List<Object> getCasts() {
		return casts;
	}

	public void setCasts(List<Object> casts) {
		System.out.println("jinlaikle");
		this.casts = casts;
		
		for(Object obj:casts){
			@SuppressWarnings("unchecked")
			Map<String, Object> map =(Map<String, Object>) obj;
			System.out.println("map:"+map);
			cast.add(map.get("name").toString());
		}
	}

	public List<Object> getDirectors() {
		return directors;
	}

	public void setDirectors(List<Object> directors) {
		this.directors = directors;
		System.out.println("jinlaikle");
	}	
	
	public List<String> getCast() {
		return cast;
	}

	public void setCast(List<String> cast) {
		this.cast = cast;
	}

	public List<String> getDire() {
		return dire;
	}

	public void setDire(List<String> dire) {
		this.dire = dire;
	}

}
