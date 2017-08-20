package com.yc.fs.util;


import java.util.List;


import com.mongodb.DBObject;
import com.yc.fs.dao.DBHelper;

public class TestLucene {
	public static void main(String[] args) {
		DBHelper db = new DBHelper();
		List<DBObject> li=db.findAll(null, "postInfo");
		
		System.out.println(li);
		LuceneUtil lc=new LuceneUtil();
		lc.Index(li);
		lc.search("电影院");
	}
}
