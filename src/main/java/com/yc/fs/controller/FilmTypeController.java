package com.yc.fs.controller;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;


import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.FilmType;
import com.yc.fs.service.IFilmTypeService;

@Controller
public class FilmTypeController {
	@Autowired
	private IFilmTypeService FilmTypeService;
	@RequestMapping("/addfilmType")
	@ResponseBody
	public int addAdminInfo(FilmType FilmType){
		return FilmTypeService.add(FilmType);
  }
	
	@RequestMapping("/findfilmTypeByPage")
	@ResponseBody
	public JsonObject findAdminByPage(int page,int rows){
		
		return FilmTypeService.find(page, rows);
		
		
	}
	
	@RequestMapping("/deletefilmType")
	@ResponseBody
	public int delteFilmType(String fids){
		return FilmTypeService.delete(fids);
	}
	
}