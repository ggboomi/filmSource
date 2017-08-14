package com.yc.fs.util;

import java.util.List;

public class ArrayToString {
	public static String toString(String[] strs){
		String str="";
		for(int i=0,len=strs.length;i<len;i++){
			str+=strs[i]+",";
		}
		str=str.substring(0, str.lastIndexOf(","));
		System.out.println(str);
		return str;
	}
	
	public static String toString(List<String> strs){
		String str="";
		for(String st:strs){
			str+=st+",";
		}
		if(str.indexOf(",")!=-1){
			str=str.substring(0, str.lastIndexOf(","));
		}
		System.out.println(str);
		return str;
	}
}
