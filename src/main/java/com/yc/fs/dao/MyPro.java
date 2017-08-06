package com.yc.fs.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPro extends Properties{
	private static final long serialVersionUID = -2610497285785797466L;
	
	private static MyPro instance=new MyPro();
	
	private MyPro(){
		InputStream is=MyPro.class.getClassLoader().getResourceAsStream("mongodb.properties");
		try {
			this.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(is!=null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
			
	}
	
	public static MyPro getInstance(){
		return instance;
	}
	
}
