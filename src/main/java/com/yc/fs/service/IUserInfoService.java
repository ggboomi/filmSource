package com.yc.fs.service;

import java.util.List;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.UserInfo;


public interface IUserInfoService {
	public int add(UserInfo ba);

	public UserInfo login(UserInfo ba);

	public UserInfo update(UserInfo ba);

	public int delete(String aids);

	public List<UserInfo> findAll();

	public JsonObject find(String page,String rows);

	public int total();

}
