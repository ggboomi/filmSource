package com.yc.fs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.fs.bean.File;
import com.yc.fs.mapper.IFilmMapper;
import com.yc.fs.service.FilmService;

@Service("filmService")
public class FilmServiceImpl implements FilmService {

	@Autowired
	private IFilmMapper mapper;

	public int add(File file) {
		if (file != null) {
			return mapper.add(file);
		}
		return 0;
	}

	@Override
	public List<File> findByFid(List<Map<String, Integer>> fids) {
		if (fids == null) {
			return null;
		}

		List<File> li = new ArrayList<File>();

		int count = 0;
		// 倒序查询
		for (int i = fids.size() - 1; i >= 0; i--) {
			Map<String, Integer> fid = fids.get(i);

			String key = fid.keySet().iterator().next();
			File file = null;
			if (fid.get(key) != 0) {
				file = mapper.findByFid(fid.get(key));
				file.set_id(key);
				li.add(file);
				if (count >= 18) {
					System.out.println("count:" + count);
					break;
				}
				count++;
			}
			// System.out.println();

		}

		return li;
	}
	
	@Override
	public List<File> findByPage(int pageNo, int pageSize) {
		Map<String, Integer> map=new HashMap<String,Integer>();
		map.put("start", (pageNo-1)*pageSize);
		map.put("pageSize",pageSize);
		return mapper.findByPage(map);
	}

	@Override
	public File findOne(String fid) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("fid", fid);
		return mapper.findOne(map);
	}

	@Override
	public File findByFid(Integer fid) {
		if(fid==0){
			return null;
		}
		return mapper.findByFid(fid);
	}

}
