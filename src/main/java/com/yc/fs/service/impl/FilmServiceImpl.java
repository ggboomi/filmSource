package com.yc.fs.service.impl;

import java.util.ArrayList;
import java.util.List;

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


	@Override
	public List<File> findByFid(List<Integer> fids) {
		if(fids==null){
			return null;
		}
		
		List<File> li=new ArrayList<File>();
		
		int count=0;
		//倒序查询
		for(int i=fids.size()-1;i>=0;i--){
	        Integer fid=fids.get(i);
	        li.add(mapper.findByFid(fid));
	        if(count>=18){
	        	System.out.println("count:"+count);
	        	break;
	        }
	        count++;
		}
		
		return li;
	}

}
