package com.yc.fs.service;

import com.yc.fs.bean.File;

public interface FilmService {
	/**
	 * 添加电影信息
	 * @param file
	 * @return
	 */
	public int add(File file);
}
