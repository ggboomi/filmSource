package com.yc.fs.mapper;

import java.util.List;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.UserInfo;


public interface IUserInfoMapper {
	/**
	 * 添加管理员
	 * @param ba
	 * @return
	 */
	public int add(UserInfo ba);
	
	/**
	 * 管理员登录
	 * @param ba
	 * @return
	 */
	public UserInfo login(UserInfo ba);
	
	
	
	/**
	 * 更新管理员信息
	 * @param ba
	 * @return
	 */
	public UserInfo update(UserInfo ba);
	
	/**
	 * 删除管理员
	 * @param aidss
	 * @return
	 */
	public int delete(String[] aidss);
	
	/**
	 * 查询所有管理员
	 * @return
	 */
	public List<UserInfo> findAll();
	
	/**
	 * 分页查询
	 * @param jb
	 * @return
	 */
	public JsonObject find(JsonObject jb);
	
	/**
	 * 获取总记录数
	 * @return
	 */
	public int total();

	public UserInfo checkEmail(UserInfo ba);
}
