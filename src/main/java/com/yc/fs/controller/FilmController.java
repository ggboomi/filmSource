package com.yc.fs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.fs.bean.DoubanInfo;
import com.yc.fs.util.GetDouBanFilm;

@Controller
public class FilmController {
	
	/**
	 * 添加电影信息
	 * @param iid
	 * @param req
	 * @return
	 */
	@RequestMapping("/addFilmInfo")
	@ResponseBody
	public int addFilmInfo(String iid, HttpServletRequest req) {
		
		//根据豆瓣id获取DoubanInfo 电影信息
		GetDouBanFilm dbf=new GetDouBanFilm();
		String path=req.getSession().getServletContext().getRealPath("");
		DoubanInfo di=dbf.getDouBanFilm(iid,path);
		
		int result=0;
		if(di!=null){
			
			result=1;
		}else{
			result=-1;
		}
		//String rr=dbf.getResp();

		return result;
	}
}
