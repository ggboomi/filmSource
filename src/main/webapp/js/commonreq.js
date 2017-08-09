function checkLogin(){
	$.post("../checkLogin",{},function(data){
		if(data!=null){
			$("#logindiv").html("");
			$("#logindiv").append("欢迎您，"+data.uname+"<br/>");
			$("#logindiv").append("<a>个人中心</a>");
		}
	},"json");
}