package com.yc.fs.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.yc.fs.bean.FilmType;
import com.yc.fs.bean.PostInfo;
import com.yc.fs.bean.UserInfo;
import com.yc.fs.dao.DBHelper;
import com.yc.fs.service.FilmService;
import com.yc.fs.service.IUserInfoService;
import com.yc.fs.util.ArrayToString;
import com.yc.fs.util.GetDouBanFilm;

@Controller
public class FilmController1 {
	@Autowired
	private FilmService filmService;

	@Autowired
	private IUserInfoService userInfoService;

	/**
	 * 添加电影信息
	 * 
	 * @param picFile 上传的bt文件
	 * @param fname 电影名
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

		// 获取用户信息
		UserInfo userinfo = (UserInfo) req.getSession().getAttribute("currentUser");

		// 获取到的信息bean类
		DoubanInfo di = dbf.getDouBanFilm(fid, path);
		int result = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		// 添加帖子信息
		Comment comment=new Comment(new Date().getTime(),1003, "2017-08-10 16:08:48", "撒大苏打撒旦");
		List<Comment> lic=new ArrayList<Comment>();
		lic.add(comment);
		
		// 生成帖子信息
		PostInfo pi = new PostInfo(Integer.parseInt(di.getId()), userinfo.getMuid(),
				di.getTitle() + "[" + di.getYear() + "]" + "[" + ArrayToString.toString(di.getCountries()) + "]",
				di.getSummary(), sdf.format(new Date()), lic);
		Map<String, Object> map = pi.getPostInfoToMap();

		// 通过dbHelper添加数据
		DBHelper db = new DBHelper();
		result = db.addObject(map, "postInfo");

		System.out.println("ConfirmResult:" + result);

		if (di != null) {

			// 生成File bean类 ，以便添加数据库
			File file = new File(Integer.parseInt(fid), ArrayToString.toString(di.getGenres()), fname,
					di.getbImg() + "," + di.getsImg(), Double.valueOf(di.getAverage()),
					ArrayToString.toString(di.getCountries()), Integer.parseInt(di.getYear()), sdf.format(new Date()),
					ArrayToString.toString(di.getAka()), ArrayToString.toString(di.getDire()), 0,
					ArrayToString.toString(di.getCast()), "", "", "", di.getSummary());

			try {
				if (!picFile.isEmpty()) {
					// 保存图片，地址为项目目录上一级的 btFiles文件夹里，用来保存bt文件
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

			// 添加数据库获取返回值
			result = filmService.add(file);
		}
		return result;
	}

	/**
	 * 获取当前首页分类类型
	 * @return
	 */
	@RequestMapping("/getOp")
	@ResponseBody
	public int getOp(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int op;
		try {
			op = (int) session.getAttribute("op");
		} catch (Exception e) {
			op=0;
		}
		return op;
	}
	
	/**
	 * 首页分页查询
	 * 
	 * @return
	 */
	@RequestMapping("/findByPage")
	@ResponseBody
	public List<File> findAllFilm(String op) {
		if(op.equals("0")){
			return filmService.findByPage(1,10);
		}else{
			FilmType type=filmService.findTypeByTid(op);
			return filmService.findByTid(type.getTname(),1,10);
		}
	}
	
	/**
	 * 首页分页查询
	 * 
	 * @return
	 */
	@RequestMapping("/findByClick")
	@ResponseBody
	public List<FilmType> findByClick() {
		return filmService.findByClick();
	}
	
	/**
	 * 首页分页查询
	 * 
	 * @return
	 */
	@RequestMapping("/findByTime")
	@ResponseBody
	public List<FilmType> findByTime() {
		System.out.println(filmService.findByTime());
		return filmService.findByTime();
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/subject/{fid}")
	public String detailTurn(@PathVariable("fid") String fid, HttpServletRequest req) {
		File film = filmService.findOne(fid);
		System.out.println("成功？:"+filmService.addclick(fid));
		String tids=film.getTids();
		String[] tidss=tids.split(",");
		int[] ctids=new int[10];
		for(int i=0;i<tidss.length;i++){
			FilmType type=filmService.findTypeByTname(tidss[i]);
			if(type!=null){
				ctids[i]=type.getTid();
			}
		}
		HttpSession session = req.getSession();
		session.setAttribute("ctids", ctids);
		session.setAttribute("cfilm", film);
		return "redirect:../detail.jsp";
	}

	/**
	 * 根据电影类型编号跳转
	 * @param fid
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="/type/{tid}")
	public String typeTurn(@PathVariable("tid") String tid,HttpServletRequest req){
		HttpSession session = req.getSession();
		if(tid.equals("0")){
			session.setAttribute("op", 0);
		}else{
			FilmType type=filmService.findTypeByTid(tid);
			session.setAttribute("op", type.getTid());
		}
		return "redirect:../index.jsp";
	}
	
	/**
	 * 根据电影类型名字跳转
	 * @param fid
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="/typename/{tname}")
	public String typeNameTurn(@PathVariable("tname") String tname,HttpServletRequest req){
		FilmType type=filmService.findTypeByTname(tname);
		int tid=type.getTid();
		HttpSession session = req.getSession();
		if(tid==0){
			session.setAttribute("op", 0);
		}else{
			session.setAttribute("op", tid);
		}
		return "redirect:../index.jsp";
	}
	
	@RequestMapping("/findAllType")
	@ResponseBody
	public List<FilmType> findAllType() {
		return filmService.findAllType();
	}
	
	/**
	 * 添加帖子信息
	 * 
	 * @param title
	 * @param content
	 * @return
	 */
	@RequestMapping("/addPostInfo")
	@ResponseBody
	public int addPostInfo(String title, String content, HttpServletRequest req) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());

		// 获取用户信息
		UserInfo userinfo = (UserInfo) req.getSession().getAttribute("currentUser");

		PostInfo pi = new PostInfo(0, userinfo.getMuid(), title, content, date, null);
		Map<String, Object> map = pi.getPostInfoToMap();

		DBHelper db = new DBHelper();
		int result = db.addObject(map, "postInfo");
		return result;
	}

	/**
	 * 寻找前二十条最新发布的数据
	 * 
	 * @return
	 */
	@RequestMapping("/find20")
	@ResponseBody
	public List<File> find20() {
		DBHelper db = new DBHelper();
		List<DBObject> li = db.findAll(null, "postInfo");
		List<Map<String, Integer>> pids = new ArrayList<Map<String, Integer>>();

		// 从帖子信息中获取豆瓣id
		for (DBObject dbo : li) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put(dbo.toMap().get("_id").toString(), Integer.parseInt(dbo.toMap().get("pid").toString()));
			pids.add(map);
		}

		return filmService.findByFid(pids);
	}

	/**
	 * 寻找帖子详细信息，根据mongodb _id查找
	 * 
	 * @param _id
	 * @return
	 */
	@RequestMapping(value = "/findDetail", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findDetail(long _id) {
		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("_id", _id);

		DBObject dbo = db.find(map, "postInfo");

		File fl = filmService.findByFid(Integer.parseInt(dbo.get("pid").toString()));
		UserInfo uf = userInfoService.findByUid(Integer.parseInt(dbo.get("uid").toString()));

		dbo.put("file", fl);
		dbo.put("userInfo", uf);

		Gson gson = new Gson();
		String str = gson.toJson(dbo);
		//

		/*
		 * //从帖子信息中获取豆瓣id
		 * 
		 * for(DBObject dbo:li){
		 * pids.add(Integer.parseInt(dbo.toMap().get("pid").toString())); }
		 * 
		 * System.out.println(pids);
		 */
		return str;
	}

	/**
	 * 帖子评论信息
	 * @param str
	 * @return
	 */
	@RequestMapping("/postInfo")
	@ResponseBody
	public int postInfo(String str,long fid,HttpServletRequest req) {
int result = 0;
		
		UserInfo ui=(UserInfo) req.getSession().getAttribute("currentUser");
		
		// 查询条件的map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("_id", fid);
		System.out.println(fid);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Comment comment=new Comment(new Date().getTime(),ui.getMuid(),str,sdf.format(new Date()));
		
		//要添加的map
		Map<String, Object> params = new HashMap<String, Object>();
		
		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("opts",comment.commentToMap());//
		
		params.put("$addToSet", param1);
		System.out.println(map);
		System.out.println(params);
		DBHelper db = new DBHelper();
		result=db.update(map, params, "postInfo");
		return result;
	}

}
