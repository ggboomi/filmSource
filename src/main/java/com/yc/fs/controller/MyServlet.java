package com.yc.fs.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 3684104685978726686L;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("自动加载启动.");
		System.out.println("自动加载启动.");
		for (int i = 0; i < 10; i++) {

			System.out.println(i + "、 自动加载启动.");
		}
		
		ServletContext application = getServletContext();
		application.setAttribute("currentUserInfo", 0);
	}
}
