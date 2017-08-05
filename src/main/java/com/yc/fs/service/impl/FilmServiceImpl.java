package com.yc.fs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.fs.bean.File;
import com.yc.fs.mapper.IFilmMapper;
import com.yc.fs.service.FilmService;

@Service("filmService")
public class FilmServiceImpl implements FilmService{
	
	@Autowired
	private IFilmMapper mapper;
	
	
	public int add(File file) {
		if(file!=null){
			return mapper.add(file);
		}
		return 0;
	}

}
