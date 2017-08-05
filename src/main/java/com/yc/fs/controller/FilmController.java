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
	 * 
	 * @param iid
	 * @param req
	 * @return
	 */
	@RequestMapping("/addFilmInfo")
	@ResponseBody
	public int addFilmInfo(@RequestParam("picFile") MultipartFile picFile, String fname, String fid,
			HttpServletRequest req) {
		// 根据豆瓣id获取DoubanInfo 电影信息
		String path = req.getSession().getServletContext().getRealPath("");
		GetDouBanFilm dbf = new GetDouBanFilm();
		DoubanInfo di = dbf.getDouBanFilm(fid, path);
		int result = 0;
		
		if (di != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			File file = new File(Integer.parseInt(fid), ArrayToString.toString(di.getGenres()), fname,
					di.getbImg() + "," + di.getsImg(), Double.valueOf(di.getAverage()),
					ArrayToString.toString(di.getCountries()), Integer.parseInt(di.getYear()), sdf.format(new Date()),
					ArrayToString.toString(di.getAka()), ArrayToString.toString(di.getDire()), "",
					ArrayToString.toString(di.getCast()), "", "", "", di.getSummary());

			try {
				if (!picFile.isEmpty()) {
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
			
			System.out.println("ititle1:" + fname);
			file.setFname(fname);
			System.out.println("down:" + file.getDownlink());
			
			System.out.println(file);					
			
			result = filmService.add(file);
		} else {
			result = -1;
		}

		return result;
	}

}
