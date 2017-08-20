
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
			$("#logindiv").append("<a href='accounts.html' style='color:blue'>个人中心</a><br/><button onclick='exitLogin()'>退出登陆</button>");		
			
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
			window.location.reload();
		}else{
			alert("账号或密码错误，请重试。")
		}
	},"text");
}

function exitLogin(){
	alert("123");
	$.post("../exitLogin",function(data){
		if(data>0){
			window.location.reload();
		}else{
			alert("退出失败，请重试。")
		}
	},"text");
}

/**
 * 搜索功能
 */
function search(flag){
	var str=$("#scbar_txt").val();
	if(str==""||str==null){
		alert("请输入查询关键字");
		return;
	}
	window.location.href=encodeURI("search.html#"+str);
	if(flag!=undefined){
		location.reload();
	}
	
}

/**
 * 获取热搜电影
 */
function getPopFname(){
	$.post("../getPopFilmName",function(data){
		var str='<strong class="xw1">热搜: </strong>';
		$.each(data,function(index,item){
			str+='<a href="javascript:void(0)" onclick="window.open(encodeURI(\'search.html#'+item+'\'));" class="xi2" sc="1">'+item+'</a>';
		});
		$("#scbar_hot").append(str);
	},"json");
}