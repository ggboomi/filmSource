package com.yc.fs.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import com.yc.fs.util.CountryToArea;
import com.yc.fs.util.GetDouBanFilm;
import com.yc.fs.util.LuceneUtil;
import com.yc.fs.util.Statistics;

@Controller
public class FilmController {
	@Autowired
	private FilmService filmService;

	@Autowired
	private IUserInfoService userInfoService;

	/**
	 * 添加电影信息
	 * 
	 * @param picFile
	 *            上传的bt文件
	 * @param fname
	 *            电影名
	 * @param fid
	 *            电影编号
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
		Comment comment = new Comment(new Date().getTime(), 1003, "2017-08-10 16:08:48", "撒大苏打撒旦");
		List<Comment> lic = new ArrayList<Comment>();
		lic.add(comment);

		// 生成帖子信息
		PostInfo pi = new PostInfo(Integer.parseInt(di.getId()), userinfo.getMuid(),
				di.getTitle() + "[" + di.getYear() + "]" + "[" + ArrayToString.toString(di.getCountries()) + "]"+"[" + ArrayToString.toString(di.getGenres()) + "]",
				di.getSummary(), sdf.format(new Date()), lic);
		String types=CountryToArea.toArea(ArrayToString.toString(di.getCountries()));
		pi.setTypes(types);
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
	 * 
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
			op = -1;
		}
		return op;
	}
	
	/**
	 * 获取所有电影树木
	 * @return
	 */
	@RequestMapping("/getTotal")
	@ResponseBody
	public int getTotal(HttpServletRequest req) {
		int total=filmService.findtotal();
		return total;
	}

	/**
	 * 首页分页查询
	 * 
	 * @return
	 */
	@RequestMapping("/findByPage")
	@ResponseBody
	public List<File> findAllFilm(String op, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int page = -1;
		try {
			page = (int) session.getAttribute("pnum");
		} catch (Exception e) {
			System.out.println("进来了 page="+page);
			session.setAttribute("pnum",1);
			page = 1;
		}
		System.out.println("page:"+page);
		if (op.equals("0")) {
			session.setAttribute("op", 0);
			session.setAttribute("total", filmService.findtotal());
			System.out.println("total:"+session.getAttribute("total"));
			return filmService.findByPage(page, 10);
		} else if(op.equals("-2")) {
			@SuppressWarnings("unchecked")
			Map<String,Object> map=(Map<String, Object>) session.getAttribute("smap");
			map.put("pageNo", page);
			map.put("pageSize", 10);
			List<File> Files=filmService.finds(map);
			session.setAttribute("total", Files.size());
			System.out.println(Files.size());
			return Files;
		} else {
			FilmType type = filmService.findTypeByTid(op);
			return filmService.findByTid(type.getTname(), page, 10);
		}
	}

	/**
	 * 按点击数排序
	 * 
	 * @return
	 */
	@RequestMapping("/findByClick")
	@ResponseBody
	public List<FilmType> findByClick() {
		return filmService.findByClick();
	}

	/**
	 * 按上传日期排序
	 * 
	 * @return
	 */
	@RequestMapping("/findByTime")
	@ResponseBody
	public List<FilmType> findByTime() {
		return filmService.findByTime();
	}

	/**
	 * 跳转到详情页面
	 * 
	 * @param fid
	 * @param req
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/subject/{fid}")
	public String detailTurn(@PathVariable("fid") String fid, HttpServletRequest req) {
		File film = filmService.findOne(fid);
		String tids = film.getTids();
		String[] tidss = tids.split(",");
		int[] ctids = new int[10];
		for (int i = 0; i < tidss.length; i++) {
			FilmType type = filmService.findTypeByTname(tidss[i]);
			if (type != null) {
				ctids[i] = type.getTid();
			}
		}
		HttpSession session = req.getSession();
		session.setAttribute("ctids", ctids);
		session.setAttribute("cfilm", film);
		return "redirect:../detail.jsp";
	}

	/**
	 * 分页查询，获取并改变页码
	 * @param fid
	 * @param req
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/page/{num}")
	public String pageTurn(@PathVariable("num") String num, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("pnum", Integer.parseInt(num));
		System.out.println("pnum  "+ session.getAttribute("pnum"));
		return "redirect:../index.jsp";
	}

	/**
	 * 根据电影类型编号跳转
	 * 
	 * @param fid
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/type/{tid}")
	public String typeTurn(@PathVariable("tid") String tid, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("pnum", 1);
		if (tid.equals("0")) {
			session.setAttribute("op", 0);
			session.setAttribute("total", filmService.findtotal());
			System.out.println("total:"+session.getAttribute("total"));
		} else {
			FilmType type = filmService.findTypeByTid(tid);
			session.setAttribute("op", type.getTid());
			session.setAttribute("total", filmService.findtotalByTid(type.getTname()));
			System.out.println("total:"+session.getAttribute("total"));
		}
		return "redirect:../index.jsp";
	}
	
	/**
	 * 根据其他类型跳转
	 * @param fid
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/search")
	public String searchTurn(HttpServletRequest req) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("op", -2);
		session.setAttribute("pnum", 1);
		String search=req.getParameter("search");
		String area=req.getParameter("area");
		String year=req.getParameter("year");
		String aname=req.getParameter("aname");
		try {
			search = new String(search.trim().getBytes("ISO-8859-1"),"UTF-8");
		} catch (Exception e) {
			search=null;
		}
		try {
			area = new String(area.trim().getBytes("ISO-8859-1"),"UTF-8");
		} catch (Exception e) {
			area=null;
		}
		try {
			year = new String(year.trim().getBytes("ISO-8859-1"),"UTF-8");
		} catch (Exception e) {
			year=null;
		}
		try {
			aname = new String(aname.trim().getBytes("ISO-8859-1"),"UTF-8");
		} catch (Exception e) {
			aname=null;
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("search", search);
		map.put("area", area);
		map.put("year", year);
		map.put("aname", aname);
		map.put("total","1");
		List<File> Files=filmService.finds(map);
		session.setAttribute("total", Files.size());
		System.out.println("size:"+Files.size());
		map.remove("total");
		session.setAttribute("smap", map);
		return "redirect:index.jsp";
	}

	/**
	 * 根据电影类型名字跳转
	 * 
	 * @param fid
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/typename/{tname}")
	public String typeNameTurn(@PathVariable("tname") String tname, HttpServletRequest req) {
		FilmType type = filmService.findTypeByTname(tname);
		int tid = type.getTid();
		HttpSession session = req.getSession();
		if (tid == 0) {
			session.setAttribute("op", 0);
		} else {
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
		//聊天贴的类型为5
		pi.setTypes("5");
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
	 * 寻找前二十条最多浏览的帖子
	 * 
	 * @return
	 */
	@RequestMapping("/findPop")
	@ResponseBody
	public List<DBObject> findPop() {
		DBHelper db = new DBHelper();
		List<DBObject> li = db.findAll(null, "postInfo");

		for (int i = 0; i < li.size(); i++) {
			if (li.get(i).toMap().get("num") == null) {
				li.remove(i);
				i--;
			}
		}
		
		//按浏览次数从大到小排序
		Collections.sort(li, new Comparator<DBObject>() {

			@Override
			public int compare(DBObject o1, DBObject o2) {
				// return new Double(u1.getSalary()).compareTo(new
				// Double(u2.getSalary())); //升序
				int userNo1 = Integer.parseInt(o1.toMap().get("num").toString());
				int userNo2 = Integer.parseInt(o2.toMap().get("num").toString());
				return new Double(userNo2).compareTo(new Double(userNo1)); // 降序

			}
		});

		return li.subList(0, 12);
	}
	
	/**
	 * 寻找各个板块最新的一条数据
	 * @return
	 */
	@RequestMapping("/findLatest")
	@ResponseBody
	public List<DBObject> findLatest(HttpServletRequest req){
		List<DBObject> li=new ArrayList<DBObject>();
		for(int i=1;i<=5;i++){
			List<DBObject> list=findPostInfoByTypes(String.valueOf(i),req);
			if(list.size()>0){
				li.add(list.get(0));
			}
		}
		return li;
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
		
		//增加浏览次数
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("num", 1);
		map2.put("$inc", map3);
		db.update(map, map2, "postInfo");

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
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping("/postInfo")
	@ResponseBody
	public int postInfo(String str, long fid, HttpServletRequest req) {
		int result = 0;

		UserInfo ui = (UserInfo) req.getSession().getAttribute("currentUser");

		// 查询条件的map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("_id", fid);
		System.out.println(fid);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Comment comment = new Comment(new Date().getTime(), ui.getMuid(), str, sdf.format(new Date()));

		// 要添加的map
		Map<String, Object> params = new HashMap<String, Object>();

		Map<String, Object> param1 = new HashMap<String, Object>();
		param1.put("opts", comment.commentToMap());//

		params.put("$addToSet", param1);
		System.out.println(map);
		System.out.println(params);
		DBHelper db = new DBHelper();
		result = db.update(map, params, "postInfo");
		return result;
	}

	/**
	 * 根据帖子类型查找帖子的方法
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping("/findPostInfoByTypes")
	@ResponseBody
	public List<DBObject> findPostInfoByTypes(String type, HttpServletRequest req) {

		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("$in", new String[] { type });
		map.put("types", params);

		DBHelper db = new DBHelper();
		// 查询数据
		List<DBObject> pi = db.findAll(map, "postInfo");

		List<DBObject> postInfo = new ArrayList<DBObject>();

		// 将数据列倒序以显示最新的数据
		for (int i = (pi.size() - 1); i >= 0; i--) {
			postInfo.add(pi.get(i));
		}
		// 将数据存入session，分页查询
		req.getSession().setAttribute("postInfo", postInfo);

		// 只返回前20条数据
		if (postInfo.size() >= 20) {
			System.out.println("size:" + postInfo.size());
			postInfo = postInfo.subList(0, 20);
		}

		System.out.println(pi);
		return postInfo;

	}

	/**
	 * 获取总共页码
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/findPostInfoTotalPage")
	@ResponseBody
	public int findPostInfoTotalPage(HttpServletRequest req) {
		@SuppressWarnings("unchecked")
		List<DBObject> postInfos = (List<DBObject>) req.getSession().getAttribute("postInfo");
		if (postInfos != null) {
			return (int) Math.ceil(postInfos.size() / 10);
		} else {
			return 0;
		}
	}

	/**
	 * 版块的分页查询
	 * 
	 * @return
	 */
	@RequestMapping("/findPostInfoByPage")
	@ResponseBody
	public List<DBObject> findPostInfoByPage(int page, HttpServletRequest req) {
		List<DBObject> postInfo = new ArrayList<DBObject>();
		int startPage = page * 20 - 20;
		int endPage = page * 20;

		@SuppressWarnings("unchecked")
		List<DBObject> postInfos = (List<DBObject>) req.getSession().getAttribute("postInfo");
		if (postInfos != null) {
			if (postInfos.size() - 1 <= endPage) {
				postInfo = postInfos.subList(startPage, postInfos.size() - 1);
			} else {
				postInfo = postInfos.subList(startPage, endPage);
			}
		}

		return postInfo;
	}

	/**
	 * 查询记录总数
	 * 
	 * @return
	 */
	@RequestMapping("/FindAllCount")
	@ResponseBody
	public int FindAllCount() {
		DBHelper db = new DBHelper();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("$ne", 0);
		map.put("pid", map2);
		return db.findCount(map, "postInfo");
	}

	/**
	 * 查询当前登陆用户
	 * 
	 * @return
	 */
	@RequestMapping("/findCurrentLoginUser")
	@ResponseBody
	public String findCurrentLoginUser(HttpServletRequest req) {
		ServletContext application = req.getServletContext();
		return application.getAttribute("currentUserInfo").toString();
	}

	/**
	 * 后台全站查询
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping("/backSearch")
	@ResponseBody
	public List<Map<String, String>> backSearch(String str) {

		LuceneUtil lc = new LuceneUtil();
		DBHelper db = new DBHelper();
		List<DBObject> li = db.findAll(null, "postInfo");
		lc.Index(li);
		return lc.search(str);
	}
	
	/**
	 * 获取统计信息
	 * @param type
	 * @return
	 */
	@RequestMapping("/getStatistics")
	@ResponseBody
	public Map<String,Integer> getStatistics(String type) {		
		Statistics st=new Statistics();
		if(type!=null){
			Map<String,Integer> map=st.getAllInfo(type);
			map.put("userNum", userInfoService.total());
			return map;
		}else{
			Map<String,Integer> map=st.getAllInfo();
			map.put("userNum", userInfoService.total());
			return map;
		}
	}
	
	/**
	 * 只获取类型统计信息
	 * @param type
	 * @return
	 */
	@RequestMapping("/getStatisticsByType")
	@ResponseBody
	public Map<String,Integer> getStatisticsByType(String type) {		
		Statistics st=new Statistics();
		if(type!=null){
			Map<String,Integer> map=st.getTypeInfo(type);
			map.put("type", Integer.parseInt(type));
			return map;
		}
		return null;
	}
	
	

}
