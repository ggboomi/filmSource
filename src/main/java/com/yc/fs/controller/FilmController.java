package com.yc.fs.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.fs.bean.DoubanInfo;
import com.yc.fs.bean.File;
import com.yc.fs.service.FilmService;
import com.yc.fs.util.ArrayToString;
import com.yc.fs.util.GetDouBanFilm;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService;

	/**
	 * 添加电影信息
	 * @param picFile  上传的bt文件
	 * @param fname  电影名
	 * @param fid 电影编号
	 * @param req  
	 * @return result
	 */
	@RequestMapping("/addFilmInfo")
	@ResponseBody
	public int addFilmInfo(@RequestParam("picFile") MultipartFile picFile, String fname, String fid,
			HttpServletRequest req) {
		// 根据豆瓣id获取DoubanInfo 电影信息
		String path = req.getSession().getServletContext().getRealPath("");
		GetDouBanFilm dbf = new GetDouBanFilm();
		
		//获取到的信息bean类
		DoubanInfo di = dbf.getDouBanFilm(fid, path);
		int result = 0;
		
		
		if (di != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			//生成File bean类 ，以便添加数据库
			File file = new File(Integer.parseInt(fid), ArrayToString.toString(di.getGenres()), fname,
					di.getbImg() + "," + di.getsImg(), Double.valueOf(di.getAverage()),
					ArrayToString.toString(di.getCountries()), Integer.parseInt(di.getYear()), sdf.format(new Date()),
					ArrayToString.toString(di.getAka()), ArrayToString.toString(di.getDire()), "",
					ArrayToString.toString(di.getCast()), "", "", "", di.getSummary());

			try {
				if (!picFile.isEmpty()) {
					
					//保存图片，地址为项目目录上一级的   btFiles文件夹里，用来保存bt文件
					String path2 = req.getServletContext().getRealPath("");
					String savePath = "/btFiles/" + new Date().getTime() + "_" + picFile.getOriginalFilename();
					java.io.File fl = new java.io.File(new java.io.File(path2).getParentFile(), savePath); // 要保存的位置
					picFile.transferTo(fl);
					file.setDownlink(savePath);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			file.setFname(fname);
			
			//添加数据库获取返回值
			result = filmService.add(file);
		} else {
			result = -1;
		}

		return result;
	}

}
