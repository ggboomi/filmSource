package com.yc.fs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.fs.bean.File;
import com.yc.fs.bean.JsonObject;
import com.yc.fs.mapper.IFilmInfoMapper;
import com.yc.fs.service.IFilmInfoService;
import com.yc.fs.util.StringUtil;

   @Service("FilmInfoService")
   public class FilmInfoServiceImpl implements IFilmInfoService {
	@Autowired
	private IFilmInfoMapper mapper;

	@Override
	public int add(File filmInfo) {
		
		
		return mapper.add(filmInfo) ;
	}

	@Override
	public List<File> findAll() {
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
	public int delete(String fids) {
		if(StringUtil.isNull(fids)){
			return 0;
		}
		String[] fidss=fids.split(",");
		return mapper.delete(fidss);
	}

	@Override
	public File update(File filmInfo) {
		// TODO Auto-generated method stub
		return mapper.update(filmInfo);
	}
	
}

