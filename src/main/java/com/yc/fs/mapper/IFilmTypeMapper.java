package com.yc.fs.mapper;

import java.util.List;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.FilmType;

public interface IFilmTypeMapper {
	
    public int add(FilmType filmType);
	
    public List<FilmType> findAll();
	
	public JsonObject find(JsonObject jb);
	
	public int  total();
	
	public int delete(String[] tids);
	
	public FilmType update(FilmType filmType);
}
