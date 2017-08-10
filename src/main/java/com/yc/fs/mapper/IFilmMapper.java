package com.yc.fs.mapper;

import java.util.List;
import java.util.Map;

import com.yc.fs.bean.File;

public interface IFilmMapper {
	/**
	 * 添加电影信息
	 * @param file
	 * @return
	 */
	public int add(File file);
	
	/**
	 * 更新电影信息
	 * @param file
	 * @return
	 */
	public int update(File file);
	
	/**
	 * 删除电影信息
	 * @param file
	 * @return
	 */
	public int delete(int fid);
	
	/**
	 * 查找所有电影信息
	 * @param file
	 * @return
	 */
	public List<File> findAll();
	
	/**
	 * 分页查询电影信息
	 * @param file
	 * @return
	 */
	public List<File> findByPage();
	
	/**
	 * 根据电影编号查找
	 * @param fid
	 * @return
	 */
	public File findByFid(int fid);
	
	/**
	 * 根据电影类型查找
	 * @param fid
	 * @return
	 */
	public File findByTids(String tids);
	
	/**
	 * 首页分页
	 * @param map
	 * @return
	 */
	public List<File> findByPage(Map<String, Integer> map);

	/**
	 * 查询一个film信息
	 * @param map
	 * @return
	 */
	public File findOne(Map<String, String> map);
}
