
function checkLogin(ar){
	console.log(ar);
	var src="";
	if(ar!=undefined){
		src="checkLogin";
	}else{
		src="../checkLogin";
	}
	
	$.post(src,{},function(data){
		if(data!=null){
			flag=1;
			$("#logindiv").html("");
			$("#logindiv").append("<input type='hidden' value='1' id='checkL' />");
			$("#logindiv").append("欢迎您，"+data.uname+"<br/>");
			$("#logindiv").append("<a href='accounts.html' style='color:blue'>个人中心</a><br/><button id='exitLogin'>退出登陆</button>");		
		}
		
	},"json");
}

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