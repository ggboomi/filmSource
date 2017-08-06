
$(function(){
	checkLogin();
});

function login(){
	var type=$("#ls_fastloginfield").val();
	var username=$("#ls_username").val();
	var pwd=$("#ls_password").val();
	
	$.post("../loginByEmail",{uname:username,pwd:pwd},function(data){
		data = parseInt($.trim(data));
		if(data>0){
			console.log("登陆成功");
			checkLogin();
		}else{
			alert("账号或密码错误，请重试。")
		}
	},"text");
}

function checkLogin(){
	$.post("../checkLogin",{},function(data){
		if(data!=null){
			$("#logindiv").html("");
			$("#logindiv").append("欢迎您，"+data.uname+"<br/>");
			$("#logindiv").append("<a>个人中心</a>");
		}
	},"json");
}