package com.yc.fs.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.yc.fs.dao.DBHelper;

/**
 * 论坛所需的统计信息统计信息
 * 
 * @author cyp
 *
 */
public class Statistics {

	/**
	 * 获取所有统计信息
	 * 
	 * @param type
	 *            帖子类型
	 */
	public Map<String, Integer> getAllInfo(String type) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalNum", totalNum());
		map.put("filmNum", filmNum());
		// map.put("userNum", userNum());
		map.put("todayPostNum", todayPostNum());
		map.put("yesterdayPostNum", yesterdayPostNum());
		map.put("postNumByType", postNumByType(type));
		map.put("tPostNumByType", tPostNumByType(type));
		map.put("yPostNumByType", yPostNumByType(type));
		return map;
	}

	/**
	 * 获取所有统计信息
	 * 
	 * @param type
	 *            帖子类型
	 */
	public Map<String, Integer> getAllInfo() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("totalNum", totalNum());
		map.put("filmNum", filmNum());
		// map.put("userNum", userNum());
		map.put("todayPostNum", todayPostNum());
		map.put("yesterdayPostNum", yesterdayPostNum());
		return map;
	}

	/**
	 * 获取今天以及所有的类型帖子信息
	 * 
	 * @return
	 */
	public Map<String, Integer> getTypeInfo(String type) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("postNumByType", postNumByType(type));
		map.put("tPostNumByType", tPostNumByType(type));
		return map;
	}

	/**
	 * 所有帖子数量
	 * 
	 * @return
	 */
	public int totalNum() {
		DBHelper db = new DBHelper();
		return db.findCount(null, "postInfo");
	}

	/**
	 * 电影数量
	 * 
	 * @return
	 */
	public int filmNum() {
		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("$ne", 0);
		map.put("pid", map2);

		return db.findCount(map, "postInfo");
	}

	/**
	 * 今天发布的帖子数量
	 * 
	 * @return
	 */
	public int todayPostNum() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());

		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("$regex", date);
		map.put("pdate", map2);

		return db.findCount(map, "postInfo");

	}

	/**
	 * 昨天发布的帖子数量
	 * 
	 * @return
	 */
	public int yesterdayPostNum() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date().getTime() - 86400000L);

		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("$regex", date);
		map.put("pdate", map2);

		return db.findCount(map, "postInfo");
	}

	/**
	 * 各个板块发布过的帖子
	 * 
	 * @param type
	 *            帖子类型
	 * @return 数量
	 */
	public int postNumByType(String type) {
		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("$in", new String[] { type });
		map.put("types", params);

		return db.findCount(map, "postInfo");
	}

	/**
	 * 各个板块今天发布的帖子
	 * 
	 * @param type
	 *            帖子类型
	 * @return 数量
	 */
	public int tPostNumByType(String type) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());

		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> param1 = new HashMap<String, Object>();
		Map<String, Object> param2 = new HashMap<String, Object>();

		param1.put("$in", new String[] { type });
		param2.put("$regex", date);
		map.put("pdate", param2);
		map.put("types", param1);

		return db.findCount(map, "postInfo");
	}

	/**
	 * 各个板块昨天发布的帖子
	 * 
	 * @param type
	 *            帖子类型
	 * @return 数量
	 */
	public int yPostNumByType(String type) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date().getTime() - 86400000L);

		DBHelper db = new DBHelper();

		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> param1 = new HashMap<String, Object>();
		Map<String, Object> param2 = new HashMap<String, Object>();

		param1.put("$in", new String[] { type });
		param2.put("$regex", date);
		map.put("pdate", param2);
		map.put("types", param1);

		return db.findCount(map, "postInfo");
	}

}
