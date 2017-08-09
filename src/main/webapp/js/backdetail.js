$(function(){
	var fids=location.hash;
	fid=fids.split("#")[1];
	console.log(fid);
	
	checkLogin();
	
	$.post("../findDetail",{_id:fid},function(data){
		var file=data.file;
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
	},"json");
	
});

