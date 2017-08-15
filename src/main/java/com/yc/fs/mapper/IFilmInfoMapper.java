package com.yc.fs.mapper;

import java.util.List;

import com.yc.fs.bean.File;
import com.yc.fs.bean.JsonObject;

public interface IFilmInfoMapper {
	
   public int add(File filmInfo);
	
    public List<File> findAll();
	
	public JsonObject find(JsonObject jb);
	
	public int  total();
	
	public int delete(String[] fids);
	
	public File update(File filmInfo);

}
