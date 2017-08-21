package com.yc.fs.service;

import java.util.List;
import java.util.Map;

import com.yc.fs.bean.File;
import com.yc.fs.bean.FilmType;

public interface FilmService {
	/**
	 * 添加电影信息
	 * @param file
	 * @return
	 */
	public int add(File file);
	
	/**
	 * 根据电影编号查找
	 * @param fid
	 * @return
	 */
	public List<File> findByFid(List<Map<String,Integer>> fids);
	
	/**
	 * 根据电影编号查找
	 * @param fid
	 * @return
	 */
	public File findByFid(Integer fid);
	
	/**
	 * 根据电影编号查找一个
	 * @param fid
	 * @return
	 */
	public File findOne(String fid);

	/**
	 * 分页查询
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<File> findByPage(int pageNo, int pageSize);

	public List<FilmType> findAllType();

	public List<File> findByTid(String tid, int pageNo, int pageSize);

	public FilmType findTypeByTid(String tid);

	public FilmType findTypeByTname(String tname);

	public int addclick(String fid);

	public List<FilmType> findByClick();

	public List<FilmType> findByTime();

	public int findtotalByTid(String tname);

	public int findtotal();

	public List<File> finds(Map<String, Object> map);

	public List<File> moviesearch(Map<String, Object> map);

	public List<File> findAll();
}
