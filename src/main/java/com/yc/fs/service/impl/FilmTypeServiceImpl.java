package com.yc.fs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.FilmType;
import com.yc.fs.mapper.IFilmTypeMapper;
import com.yc.fs.service.IFilmTypeService;
import com.yc.fs.util.StringUtil;

@Service("FilmTypeService")
public class FilmTypeServiceImpl implements IFilmTypeService {
	@Autowired
	private IFilmTypeMapper mapper;

	@Override
	public int add(FilmType filmType) {
		
		
		return mapper.add(filmType) ;
	}

	@Override
	public List<FilmType> findAll() {
		return mapper.findAll();
		
	}

	@Override
	public JsonObject find(Integer pageNo, Integer rows) {
		JsonObject jb=new JsonObject(pageNo,rows);
		return mapper.find(jb);
		
	}

	@Override
	public int total() {
		
		return mapper.total();
	}

	@Override
	public int delete(String tids) {
		if(StringUtil.isNull(tids)){
			return 0;
		}
		String[] muidss=tids.split(",");
		return mapper.delete(muidss);
	}

	@Override
	public FilmType update(FilmType filmType) {
		// TODO Auto-generated method stub
		return mapper.update(filmType);
	}
	
}
