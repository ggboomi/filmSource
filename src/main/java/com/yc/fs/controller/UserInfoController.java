package com.yc.fs.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.fs.bean.JsonObject;
import com.yc.fs.bean.UserInfo;
import com.yc.fs.service.IUserInfoService;

@Controller
public class UserInfoController {
	@Autowired
	private IUserInfoService userInfoService;
	
	@RequestMapping("/findUserInfoByPage")
	@ResponseBody
	public JsonObject findAdminByPage(String page,String rows){
		System.out.println(page+"   "+rows);
		System.out.println(userInfoService.find(page, rows));
		return userInfoService.find(page, rows);
	}
	
	@RequestMapping("/addUserInfo")
	@ResponseBody
	public int addAdminInfo(HttpServletRequest request,UserInfo userInfo){
		System.out.println(userInfo);
		return userInfoService.add(userInfo);
	}
	
	@RequestMapping("/addUserInfos")
	@ResponseBody
	public int addAdminInfo(@RequestParam("pic") MultipartFile pic,HttpServletRequest request,UserInfo userinfo){
		System.out.println(userinfo);
		try {
			if(!pic.isEmpty()){ //说明有图片要上传
				String path=request.getServletContext().getRealPath("");
				String savePath="/pics/"+new Date().getTime()+"_"+pic.getOriginalFilename();
				System.out.println(savePath);
				File fl=new File(new File(path).getParentFile(),savePath); //要保存的位置
				pic.transferTo(fl);
				userinfo.setPhoto(savePath);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfoService.add(userinfo);
	}
	
	@RequestMapping("/Login")
	@ResponseBody
	public int adminLogin(UserInfo ba,String code,HttpSession session){
		System.out.println("进来了");
		String codes=String.valueOf(session.getAttribute("rand"));
		int result=-1;
		if(!code.equals(codes)){
			result=1;
		}else{
			System.out.println(ba);
			UserInfo userinfo=userInfoService.login(ba);
			if(userinfo!=null){
				result=3;
				session.setAttribute("currentLogin", userinfo);
			}else{
				result=2;
			}
		}
		return result;
	}
	
//	@RequestMapping("/Login")
//	@ResponseBody
//	public int deleteAdmin(String uname,String pwd){
//		return userInfoService.login(uname,pwd);
//	}
}
