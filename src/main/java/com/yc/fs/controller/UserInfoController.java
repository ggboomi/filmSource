package com.yc.fs.controller;

import java.io.File;
import java.util.Date;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

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
import com.yc.fs.util.MailConnect;
import com.yc.fs.util.SessionAttribute;

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
	public int addUserInfo(HttpServletRequest request,UserInfo userInfo,String temp){
		Object code=request.getSession().getAttribute(SessionAttribute.EMAILCODE);
		System.out.println("temp"+temp);
		System.out.println("code"+String.valueOf(code));
		if(code==null){
			return 101; //说明验证码已经过期
		}else{
			if(!temp.equals(String.valueOf(code))){
				return 111; //说明验证码错误
			}else{
				int result;
				try {
					result = userInfoService.add(userInfo);
				} catch (Exception e) {
					return -1;
				}
//				if(result>0){  //如果注册成功，则应该将此用户名和邮箱添加有缓存对象中
//					ServletContext application=request.getServletContext();
//					@SuppressWarnings("unchecked")
//					Set<String> userNameList=(Set<String>) application.getAttribute(SessionAttribute.PASSUSERNAME);
//					System.out.println(userInfo);
//					userNameList.add(userInfo.getUname());
//					application.setAttribute(SessionAttribute.PASSUSERNAME, userNameList);
//				}
				return result;
			}
		}
	} 
	
	/**
	 * 后台添加管理员 
	 * @param pic
	 * @param request
	 * @param userinfo
	 * @return
	 */
	@RequestMapping("/addUserInfos")
	@ResponseBody
	public int addUserInfos(@RequestParam("pic") MultipartFile pic,HttpServletRequest request,UserInfo userinfo){
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
	
	/**
	 * 后台登陆
	 * @param ba
	 * @param code
	 * @param session
	 * @return
	 */
	@RequestMapping("/Login")
	@ResponseBody
	public int adminLogin(UserInfo ba,String code,HttpSession session){
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
	
	/**
	 * 论坛登陆
	 * @param ba
	 * @param code
	 * @param session
	 * @return
	 */
	@RequestMapping("/loginByEmail")
	@ResponseBody
	public int loginByEmail(UserInfo uf,HttpSession session){
		int result=-1;
		UserInfo userinfo=userInfoService.login(uf);
		if(userinfo!=null){
			result=1;
			System.out.println(userinfo);
			session.setAttribute("currentUser", userinfo);
		}
		return result;
	}
	
	@RequestMapping("/checkEmail")
	@ResponseBody
	public int checkEmail(UserInfo ba){
		System.out.println(userInfoService.checkEmail(ba));
		if(userInfoService.checkEmail(ba)==null){
			return 1;
		}
		return -1;
	}
	
	@RequestMapping("/checkLogin")
	@ResponseBody
	public UserInfo checkLogin(HttpSession session){
		UserInfo uf=(UserInfo) session.getAttribute("currentUser");
		if(uf!=null){
			return uf;
		}else{
			return null;
		}
	}
	
	@RequestMapping("/sendCode")
	@ResponseBody
	private int sendCodeToEmail(HttpServletRequest request) {
		String uname=request.getParameter("uname");
		System.out.println(uname);

		//生成校验码
		String code="";
		Random rd=new Random();
		while(code.length()<4){
			code+=rd.nextInt(10);
		}
		System.out.println(code);
		if(MailConnect.sendQQmail("1293580602@qq.com", "dihpepdwtahlgefh", uname, code, "又一只皮皮虾")){
			//如果发送成功，则将当前的验证码存起来，以便稍后的验证码校验
			final HttpSession session=request.getSession();
			session.setAttribute(SessionAttribute.EMAILCODE, code);
			//启动一个定时任务，定时清空session中的校验码
			final Timer timer=new Timer();
			
			//定时任务
			TimerTask task=new TimerTask(){
				@Override
				public void run(){
					//移除校验码
					session.removeAttribute(SessionAttribute.EMAILCODE);
					timer.cancel();
				}
			};
			//多长时间后，执行任务一次。单位毫秒
			timer.schedule(task, 1000*60*2);
			return 1;
			
		}else{
			return 0;
		}
	}
}
