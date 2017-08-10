var fid="";

$(function(){
	var fids=location.hash;
	fid=fids.split("#")[1];
	console.log("fid:"+fid);
	checkLogin();
	
	
	$.post("../findDetail",{_id:fid},function(data){
		var file=data.file;
		var uf=data.userInfo;
		$(document).attr("title",data.pname);
		$("#h1_title").append('<span id="thread_subject">'+data.pname+'</span>');
		$("#time").text("发表于 "+data.pdate);
		var pic=file.fpic;
		pic=pic.split(",")[0];
		$("#aimg_IB7l4").attr("src","../../"+pic);
		$("#aimg_IB7l4").attr("alt",data.pname);
		
		$("#dname").text("◎ 导演: "+file.dname);
		$("#aname").text("◎主演: "+file.aname);
		$("#country").text("◎ 制片国家/地区: "+file.country);
		$("#othername").text("◎又名: "+file.othername);
		$("#introh1").text("◎"+file.fname+" 的剧情简介 · · · · · ·");
		$("#intro").text(file.intro);
		
		$("#uname").text(uf.uname);
		$("#score").text(uf.score);
		
		
		if(uf.photo==undefined){
			$("#upic").attr("src","../images/zanwu.jpg");
		}else{
			$("#upic").attr("src","../../"+uf.photo);
		}
		
	},"json").complete(function() {  
		//完成后操作
		var flag=$("#checkL").val();
		
		console.log("flag1:"+flag);
		if(flag==1){
			$("#postInfo").html("");
			$("#postInfo").append("<textarea rows='2' cols='20' wrap='hard' style='width:90%;height:90%;' id='postText' />");
		}
    });
	
	
	
});


function postInfo(){
	var str=$("#postText").val();
	$.post("../postInfo",{str:str,fid:fid},function(data){
		if(data>0){
			//刷新界面
		}else{
			alert("发布失败，请重试。")
		}
	},"text");
}

