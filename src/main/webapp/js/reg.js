function addUser() {
	var uname = $.trim($("#uname").val());
	var pwd = $.trim($("#pwd").val());
	$.post("addUserInfo", {
		uname : uname,
		pwd : pwd
	}, function(data) {
		data = parseInt($.trim(data));
		if (data > 0) {
			alert("注册成功...");
		} else {
			alert("注册失败...");
		}
	}, "text");
}

/*邮箱自动补全*/
function $$(id){
	return document.getElementById(id);
}
var lists;
var len;
window.onload=function(){
	var objtxt=$$("uname");
	var objlist=$$("maillist");
	
	lists=objlist.getElementsByTagName("li");
	//移除第一个li
	len=lists.length;
	objlist.style.top=($("#uname").offset().top+$("#uname").outerHeight())+"px";
	objlist.style.left=$("#uname").offset().left+"px";
	
	objtxt.onfocus=function(){
		var txt=this.value;
		$("#regemail_msg").text("");
		if(txt.indexOf("@")>0){ //如果用户输入了@,则只取前面的数据
			txt=txt.substring(0,txt.indexOf("@"));
		}
		addtxt(txt);
		objlist.style.display="block";
	}
	
	objtxt.onblur=function(){
		var txt=this.value;
		var reg=/\w+([-+.]\w)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		if(!reg.test(txt)){//检验邮箱格式是否正确
			$("#regemail_msg").text("邮箱格式不正确...").css("color","red");
		}else{ //校验邮箱是否已经注册
			$.post("checkEmail",{uname:txt},function(data){
				data=parseInt($.trim(data));
				if(data==1){
					$("#regemail_msg").text("邮箱格式校验成功...").css("color","green");
					$("#sendCode").attr("disabled",false).css({"background":"#FF9651","border-color":"#AE7E31"});
				}else{
					$("#regemail_msg").text("该邮箱已被注册，请直接登陆...").css("color","red");
				}
			},"text");
		}
		objlist.style.display="none";
		showAll();
	}
	
	objtxt.onkeyup=function(){
		var txt=this.value;
		var flag="";
		if(txt.indexOf("@")>=0){
			flag=txt.substring(txt.indexOf("@")-1);
			txt=txt.substring(0,txt.indexOf("@"));
		}else{
			flag="";
		}
		addtxt(txt);
		searchs(flag);
	}

	for(var i=1;i<len;i++){
		lists[i].onmousedown=function(){
			$$("uname").value=this.innerHTML;
			$$("maillist").style.display="none";
		}
	}
	
}

function showAll(txt){
	for(var i=1;i<len;i++){
		lists[i].style.display="block";
	}
}

function searchs(txt){
	var reg=new RegExp(txt,"i");
	for(var i=1;i<len;i++){
		if(reg.test(lists[i].textContent)){
			lists[i].style.display="block";
		}else{
			lists[i].style.display="none";
		}
	}
}

function addtxt(txt){
	var val;
	for(var i=1;i<len;i++){
		val=lists[i].innerHTML;
		val=val.substring(val.indexOf("@"));
		lists[i].innerHTML=txt+val;
	}
}

$(function(){
//	$("td .labelbox").css("color","blue");
//	$("#username").bind({
//		focus:function(){
//			$("username_msg").text("4~6位的数字、字母、下划线组成").css("color","blue");
//		},
//		blur:function(){
//			var txt=$(this).val();
//			var reg=/^[\u4e00-\u9fa5\a-zA-Z][\u4e00-\u9fa5\a-zA-z_0-9]{2,18}$/;
//			if(!reg.test(txt)){
//				$("username_msg").text("用户名格式错误...").css("color","red");
//			}else{
//				$("username_msg").text("");
//			}
//		}
//	})
	
	$("#pwd").bind({
		keyup:function(){
			var txt=$(this).val();
			$("#reg_nopad>li").css("background","#dcdcdc");
			
			if(txt==""){
				
			}else if( (/^\d*$/).test(txt) ){ //全数字
				$("#reg_nopad>li:eq(0)").css("background","red");
			}else if( (/^[a-zA-Z0-9]{5,}$/).test(txt) ){
				$("#reg_nopad>li:lt(2)").css("background","gold");
			}else if(txt.length>6){
				$("#reg_nopad>li:lt(3)").css("background","green");
			}else{
				$("#reg_nopad>li:eq(0)").css("background","red");
			}
		}
	})
	
	$("#repwd").bind({
		focus:function(){
			$("#reppassword_msg").text("");
		},
		blur:function(){
			var pwd1=$("#pwd").val();
			var pwd2=$(this).val();
			if(pwd1!=pwd2){
				$("#reppassword_msg").text("两次密码输入不一致").css("color","red");
			}else{
				$("#reppassword_msg").text();
			}
		}
	});
	
	//验证码
	$("#regsafecode").keyup(function(){ //验证码
		if( $(this).val().length==4){
			$("#myRegButton").removeClass("secbig").addClass("redbig");
		}else{
			$("#myRegButton").removeClass("redbig").addClass("secbig");
		}
	});
	
	//手机号码
	$("#tel").bind({
		focus:function(){
			$("tel_msg").text("");
		},
		blur:function(){
			var reg=/^((\d{3,4})|(\d{3,4})-?)\d{7,8}$/;
			if(reg.test($(this).val())){
				$("#tel_msg").text("");
			}else{
				$("#tel_msg").text("手机号码格式错误...");
			}
		}
	});
});

//发送验证码
var timer=undefined;
var time=120;
function sendCodeToMail(){
	var uname=$.trim($("#uname").val());

	if(uname=="" || uname==null){
		$("#regsafecode_msg").text("请先输入您的邮箱...").css("color","red");
		return;
	}else{
		$("#sendCode").attr("disabled",true).css({"background":"#EEEEEE","border-color":"#C0C0C0"});
		$.post("sendCode",{uname:uname},function(data){
			data=$.trim(data);
			if(data=="1"){
				$("#sendCode").val("邮件发送成功(120s)");
				if(timer!=undefined){
					clearInterval(timer);
				}
				timer=setInterval("changeBtnStatus()",1000);
			}else{
				$("#sendCode").val("邮件发送失败，点击重新发送").attr("disabled",false).css({"background":"#FF9651","border-color":"#AE7E31"});
			}
		},"text");		
	}
}


function changeBtnStatus(){
	time--;
	if(time<=0){
		clearInterval(timer);
		$("#sendCode").val("重新获得验证码").attr("disabled",false).css({"background":"#FF9651","border-color":"#AE7E31"});
		timer=undefined;
	}else{
		$("#sendCode").val("邮件发送成功("+time+"s)");
		$("#regemail_msg").text("");
	}
}


//用户注册
function addUser(){
	var uname=$.trim( $("#uname").val());
	var pwd=$.trim( $("#pwd").val());
	var temp=$.trim($("#regsafecode").val()); //将验证码存到userInfo对象的temp属性中
	if(uname=="" || pwd=="" ){
		alert("您输入的信息不完整，请确认后再提交...");
		return;
	}
	var objs=$(".labelbox"); //获取所有的提示lable对象
	for(var i=0;i<objs.length;i++){
		if($(objs[i]).text()!=""){  //如果label中有内容说明文本框中输入的内容有问题
			alert("您输入的信息有误，请修改后在提交....");
			return;
		}
	}
	
	$.post("addUserInfo",{uname:uname,pwd:pwd,pow:2,temp:temp},function(data){
		if(data==101){
			alert("验证码已过期，请重新获取...");
			$("#sendCode").val("重新获取验证码").attr("disable",flase)
		}else if(data==111){
			alert("验证码错误...")
		}else if(data==1){
			alert("注册成功");
			location.href="back/backindex.html"; //页面跳转
		}else{
			alert("注册失败，请稍后重试")
		}
	},"text");
}



