package com.yc.fs.service;

import java.util.List;

import com.yc.fs.bean.File;

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
	public List<File> findByFid(List<Integer> fids);
}
