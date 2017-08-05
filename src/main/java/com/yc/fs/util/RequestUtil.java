package com.yc.fs.util;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class RequestUtil {
	public static <T> T getObjectFormRequest(HttpServletRequest request,Class<T> c) throws Exception{
		T t=c.newInstance();
		//获取用户提交的表单中的表单元素的name属性的属性值
		Enumeration<String> enums=request.getParameterNames();
		
		//获取给定类中的所有setter方法
		List<Method> methods=getSetMethods(c);
		String name=null;
		String setName=null;
		Class<?>[] attrs=null;
		String type=null;
		//循坏所有的表单元素中的name属性的属性值 email->setemail
		while(enums.hasMoreElements()){
			name=enums.nextElement();//获取当前属性名 email uname
			setName="set"+name.substring(0,1).toUpperCase()+name.substring(1); //将属性名的第一个字母变成大写
			for(Method md:methods){
				if(setName.equals(md.getName())){
					attrs=md.getParameterTypes();
					type=attrs[0].getSimpleName();
					if("Double".equals(md.getName())){
						md.invoke(t, Double.parseDouble(request.getParameter(name)));
					}else if("Integer".equals(type)){
						md.invoke(t, Integer.parseInt(request.getParameter(name)));
					}else{
						md.invoke(t,request.getParameter(name));
					}
				}
			}
		}
		return t;
	}
	
	public static <T> List<Method> getSetMethods(Class<T> c){
		List<Method> list=new ArrayList<Method>();
		//获取给定类中的所有方法
		Method[] methods=c.getMethods();
		if(methods!=null && methods.length>0){
			for(Method md:methods){
				if(md.getName().startsWith("set")){
					list.add(md);
				}
			}
		}
		return list;
	}
}
