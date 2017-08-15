package com.yc.fs.service;

import java.util.List;

import com.yc.fs.bean.File;
import com.yc.fs.bean.JsonObject;

public interface IFilmInfoService {
	
    public int add(File filmInfo);
	
    public List<File> findAll();
	
	public JsonObject find(Integer pageNo,Integer rows);
	
	public int  total();
	
    public int delete(String fids);
	
	public File update(File filmInfo);
}
