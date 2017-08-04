package com.yc.fs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.UserInfo;
import com.yc.fs.mapper.IUserInfoMapper;
import com.yc.fs.service.IUserInfoService;
import com.yc.fs.util.MD5Encryption;
import com.yc.fs.util.StringUtil;

@Service("UserInfoService")
public class UserInfoServiceImpl implements IUserInfoService{
	@Autowired
	private IUserInfoMapper mapper;
	
	public int add(UserInfo ba) {
		if(StringUtil.isNull(ba.getUname(),ba.getPwd())){
			return 0;
		}
		ba.setPwd(MD5Encryption.createPassword(ba.getPwd()));
		return mapper.add(ba);
	}

	public UserInfo login(UserInfo ba) {
		if(StringUtil.isNull(ba.getUname(),ba.getPwd())){
			return null;
		}
		ba.setPwd(MD5Encryption.createPassword(ba.getPwd()));
		return mapper.login(ba);
	}

	public UserInfo update(UserInfo ba) {
		return mapper.update(ba);
	}

	public int delete(String aids) {
		if(StringUtil.isNull(aids)){
			return 0;
		}
		String[] aidss=aids.split(",");
		return mapper.delete(aidss);
	}

	public List<UserInfo> findAll() {
		return mapper.findAll();
	}

	public JsonObject find(String page,String rows) {
		JsonObject jb=new JsonObject(Integer.parseInt(page),Integer.parseInt(rows));
		return mapper.find(jb);
	}

	public int total() {
		return mapper.total();
	}

}
