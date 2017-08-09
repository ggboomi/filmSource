
$(function(){
	console.log("come");
	checkLogin();
	find20();
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

function find20(){
	var str="";
	
	$.post("../find20",function(data){
		$.each(data,function(index,item){
			var simg=item.fpic;
			simg=simg.split(",")[0];
			console.log("simg："+simg);
			str+='<li style="width: 94px;">';
			str+='<a href="thread-65922-1-1.html" target="_blank">';
			str+='<img src="../../'+simg+'" width="94" height="120" alt="'+item.fname+'" /></a>';
			str+='<p><a href="thread-65922-1-1.html" title="'+item.fname+'" target="_blank">'+item.fname+'</a>';
			str+='</p></li>';
		});
		$("#ul_list").append(str);
	},"json");

	
	
}

