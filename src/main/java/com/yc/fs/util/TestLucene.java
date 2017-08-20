package com.yc.fs.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mongodb.DBObject;
import com.yc.fs.controller.FilmController;
import com.yc.fs.dao.DBHelper;

public class TestLucene {
	public static void main(String[] args) {
		/*DBHelper db = new DBHelper();
		List<DBObject> li=db.findAll(null, "postInfo");
		
		System.out.println(li);
		LuceneUtil lc=new LuceneUtil();
		lc.Index(li);
		lc.search("电影院");*/
		
		/*FilmController sc=new FilmController();
		List<DBObject> li=sc.getPostByKeys(null,"2016","剧情");//"香港","2016","剧情"
		for(DBObject dbo:li){
			System.out.println(dbo.get("pname"));
		}*/
	}
}
