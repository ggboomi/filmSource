package com.yc.fs.service;

import java.util.List;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.FilmType;

public interface IFilmTypeService {
	
    public int add(FilmType filmType);
	
    public List<FilmType> findAll();
	
	public JsonObject find(Integer pageNo,Integer rows);
	
	public int  total();
	
    public int delete(String tids);
	
	public FilmType update(FilmType filmType);
}
