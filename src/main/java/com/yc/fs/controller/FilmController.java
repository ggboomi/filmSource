package com.yc.fs.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.mongodb.DBObject;
import com.yc.fs.bean.Comment;
import com.yc.fs.bean.DoubanInfo;
import com.yc.fs.bean.File;
import com.yc.fs.bean.PostInfo;
import com.yc.fs.bean.UserInfo;
import com.yc.fs.dao.DBHelper;
import com.yc.fs.service.FilmService;
import com.yc.fs.service.IUserInfoService;
import com.yc.fs.util.ArrayToString;
import com.yc.fs.util.GetDouBanFilm;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService;
	
	@Autowired
	private IUserInfoService userInfoService;

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
		
		//获取用户信息
		UserInfo userinfo=(UserInfo) req.getSession().getAttribute("currentUser");
		
		//获取到的信息bean类
		DoubanInfo di = dbf.getDouBanFilm(fid, path);
		int result = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//添加帖子信息
		
		//生成帖子信息
		PostInfo pi=new PostInfo(Integer.parseInt(di.getId()), userinfo.getMuid(), di.getTitle()+"["+di.getYear()+"]"+"["+ArrayToString.toString(di.getCountries())+"]", di.getSummary(), sdf.format(new Date()), null);
		Map<String, Object> map=pi.getPostInfoToMap();
		
		//通过dbHelper添加数据
		DBHelper db=new DBHelper();
		result=db.addObject(map, "postInfo");
		
		System.out.println("ConfirmResult:"+result);
		
		if (di != null) {
					
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
		}
		return result;
	}
	
	/**
	 * 添加帖子信息
	 * @param title
	 * @param content
	 * @return
	 */
	@RequestMapping("/addPostInfo")
	@ResponseBody
	public int addPostInfo(String title,String content,HttpServletRequest req){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		
		//获取用户信息
		UserInfo userinfo=(UserInfo) req.getSession().getAttribute("currentUser");
		
		PostInfo pi=new PostInfo(0, userinfo.getMuid(), title, content, date, null);
		Map<String, Object> map=pi.getPostInfoToMap();
		
		DBHelper db=new DBHelper();
		int result=db.addObject(map, "postInfo");
		return result;
	}
	
	@RequestMapping("/find20")
	@ResponseBody
	public List<File> find20(){
		DBHelper db=new DBHelper();
		List<DBObject> li=db.findAll(null, "postInfo");
		List<Map<String,Integer>> pids=new ArrayList<Map<String,Integer>>();
		
		
		//从帖子信息中获取豆瓣id
		for(DBObject dbo:li){
			Map<String,Integer> map=new HashMap<String,Integer>();
			map.put(dbo.toMap().get("_id").toString(),Integer.parseInt(dbo.toMap().get("pid").toString()));
			pids.add(map);
		}
		
		return filmService.findByFid(pids);
	}
	
	
	@RequestMapping(value="/findDetail",method = RequestMethod.POST,produces ="text/html;charset=UTF-8")
	@ResponseBody
	public String findDetail(long _id){
		DBHelper db=new DBHelper();
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("_id", _id);
		
		DBObject dbo=db.find(map,"postInfo");
		
		File fl=filmService.findByFid(Integer.parseInt(dbo.get("pid").toString()));
		UserInfo uf=userInfoService.findByUid(Integer.parseInt(dbo.get("uid").toString()));
		
		System.out.println(uf);
		dbo.put("file",fl);
		dbo.put("userInfo",uf);
		
		
		Gson gson=new Gson();
		String str=gson.toJson(dbo);
		System.out.println("str:"+str);
		//
		
		/*//从帖子信息中获取豆瓣id
		
		for(DBObject dbo:li){
			pids.add(Integer.parseInt(dbo.toMap().get("pid").toString()));
		}
		
		System.out.println(pids);*/
		return str;
	}

}
