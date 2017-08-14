var fid="";
var muid;
var len=0;
var opts;
var currentPage=1;

$(function(){
	var fids=location.hash;
	fid=fids.split("#")[1];
	
	if(fid==undefined){
		window.location.href="backindex.html";
	}
	
	console.log("fid:"+fid);
	checkLogin();	
	
	$.post("../findDetail",{_id:fid},function(data){
		opts=data.opts;
		var file=data.file;
		var uf=data.userInfo;
		
		
		var type;
		if(data.types.indexOf(",")!=-1){
			type=data.types.split(",")[0];
			
		}else{
			type=data.types
		}
		$("#type").attr("href","forum.html#"+type);
		if(type=="1"){
			$("#type").text("大陆板块");
		}else if(type=="2"){
			$("#type").text("港台板块");
		}else if(type=="3"){
			$("#type").text("日韩板块");
		}else if(type=="4"){
			$("#type").text("欧美板块");
		}else if(type=="5"){
			$("#type").text("讨论区");
		}
		
		if(data.pname.length>20){
			var pname=data.pname.substring(0,20)+"..";
			$("#filmtitle").text(pname);
		}else{
			$("#filmtitle").text(data.pname);
		}
		
		$("#filmtitle").attr("href","backdetail.html#"+fid);
		
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
		
		var link=file.downlink;
		$("#downlink").attr("href","../../"+file.downlink);
		link=link.substring(link.lastIndexOf("/")+1);
		console.log("link:"+link);
		$("#downlink").text(link);
		
		$("#uname").text(uf.uname);
		$("#score").text(uf.score);
		
		muid=uf.muid;
		
		if(uf.photo==undefined){
			$("#upic").attr("src","../images/zanwu.jpg");
		}else{
			$("#upic").attr("src","../../"+uf.photo);
		}
		
	},"json").complete(function() {  
		//完成后操作
		
		//获取登陆信息  flag=1代表已登陆
		var flag=$("#checkL").val();
		if(flag==1){
			$("#postInfo").html("");
			$("#postInfo").append("<textarea rows='2' cols='20' wrap='hard' style='width:90%;height:90%;' id='postText' />");
		}
		
		//显示评论信息，页面电影信息加载完成后调用
		showComment(opts);
    });
	
	
});



function nextpage(page){
	var num=Math.ceil(len/10);
	if(page>num){
		nextpage(1);
	}
	
	currentPage=page;
	if(page==1){
		window.location.reload();//刷新当前页面.
	}else{
		$("#postlist").html("");
		commentDiv(page);
		$("#nextpage").html("");
		$("#nextpage").append('<a onclick="nextpage('+(currentPage+1)+')" hidefocus="true" class="bm_h">下一页 &raquo;</a>');
		
		$("#pgt1").html("");
		$("#pgt2").html("");
		
		console.log("num:"+num);
		var pagestr='<div class="pg">';
		for(var i=1;i<=num;i++){
			if(page==i){
				pagestr+='<strong>'+i+'</strong>';
			}else{
				pagestr+='<a onclick="nextpage('+i+')">'+i+'</a>';
			}
		}
		pagestr+='<label>';
		pagestr+='<input type="text" name="custompage" id="pagetxt" class="px" size="2" title="输入页码，按回车快速跳转" value="'+page+'" onkeydown="if(event.keyCode==13) {var txt= $(\'#pagetxt\').val();  nextpage(txt)}" />';
		pagestr+='<span title="共'+num+'页"> / '+num+' 页</span>';
		pagestr+='</label><a onclick="nextpage('+(currentPage+1)+')" class="nxt">下一页</a>';
		pagestr+='</div></div>';
		
		var pagestr2='<div class="pg">';
		for(var i=1;i<=num;i++){
			if(page==i){
				pagestr2+='<strong>'+i+'</strong>';
			}else{
				pagestr2+='<a onclick="nextpage('+i+')">'+i+'</a>';
			}
		}
		pagestr2+='<label>';
		pagestr2+='<input type="text" name="custompage" id="pagetxt2" class="px" size="2" title="输入页码，按回车快速跳转" value="'+page+'" onkeydown="if(event.keyCode==13) {var txt= $(\'#pagetxt2\').val();  nextpage(txt)}" />';
		pagestr2+='<span title="共'+num+'页"> / '+num+' 页</span>';
		pagestr2+='</label><a onclick="nextpage('+(currentPage+1)+')" class="nxt">下一页</a>';
		pagestr2+='</div></div>';
										
		$("#pgt1").append(pagestr);
		$("#pgt2").append(pagestr2);
	}
}

function showComment(){
	len=opts.length;
	console.log("len:"+len);
	if(len>9){
		$("#nextpage").append('<a onclick="nextpage('+(currentPage+1)+')" hidefocus="true" class="bm_h">下一页 &raquo;</a>');
		
		var num=Math.ceil(len/10);
		console.log("num:"+num);
		var pagestr='<div class="pg"><strong>1</strong>';
		for(var i=2;i<=num;i++){
			pagestr+='<a onclick="nextpage('+i+')">'+i+'</a>';
		}
		pagestr+='<label>';
		pagestr+='<input type="text" id="pagetxt" name="custompage" class="px" size="2" title="输入页码，按回车快速跳转" value="1" onkeydown="if(event.keyCode==13) {var txt= $(\'#pagetxt\').val();  nextpage(txt)}" />';
		pagestr+='<span title="共'+num+'页"> / '+num+' 页</span>';
		pagestr+='</label><a onclick="nextpage('+(currentPage+1)+')" class="nxt">下一页</a>';
		pagestr+='</div></div>';
		
										
		$("#pgt1").append(pagestr);
		
		var pagestr2='<div class="pg"><strong>1</strong>';
		for(var i=2;i<=num;i++){
			pagestr2+='<a onclick="nextpage('+i+')">'+i+'</a>';
		}
		pagestr2+='<label>';
		pagestr2+='<input type="text" id="pagetxt2" name="custompage" class="px" size="2" title="输入页码，按回车快速跳转" value="1" onkeydown="if(event.keyCode==13) {var txt= $(\'#pagetxt2\').val();  nextpage(txt)}" />';
		pagestr2+='<span title="共'+num+'页"> / '+num+' 页</span>';
		pagestr2+='</label><a onclick="nextpage('+(currentPage+1)+')" class="nxt">下一页</a>';
		pagestr2+='</div></div>';
		
		$("#pgt2").append(pagestr2);
	}
	
	console.log(opts);
	
	commentDiv(1);			
	
}

function commentDiv(i){
	i=i*9;
	var str='';
	
	$.each(opts,function(index,item){
		if(index>=i-9){
		    str+='<div id="post_328068" ><table id="pid328068" class="plhin" summary="pid328068" cellspacing="0" cellpadding="0">';
		    str+='<tr><td class="pls" rowspan="2"><div id="favatar328068" class="pls favatar">';
		    str+='<div class="pi"><div class="authi"><a href="space-uid-10234.html" target="_blank" class="xw1" id="uname'+item.cuid+index+'"></a>';
		    str+='</div></div><div class="p_pop blk bui card_gender_0" id="userinfo328068" style="display: none; margin-top: -11px;">';
		    str+='<div class="m z"><div id="userinfo328068_ma"></div></div><div class="i y"><div>';
		    str+='<strong><a href="space-uid-10234.html" target="_blank" class="xi2">zhengchubang</a></strong>';
		    str+='<em>当前离线</em></div><dl class="cl"><dt>积分</dt><dd><a href="#" target="_blank" class="xi2">74</a></dd>';
		    str+='</dl><div class="imicn"><a href="#" target="_blank" title="查看详细资料"><img src="static/image/common/userinfo.gif" alt="查看详细资料" />';
		    str+='</a></div><div id="avatarfeed"><span id="threadsortswait"></span></div></div></div><div>';
		    str+='<div class="avatar" onmouseover="#"><a href="space-uid-10234.html" class="avtm" target="_blank"><img src="#" id="upic'+item.cuid+index+'" /></a></div>';
		    str+='</div><p>该用户从未签到</p><div class="tns xg2"><table cellspacing="0" cellpadding="0">';
		    str+='<th><p><a href="#" class="xi2">1</a></p>主题</th>';
		    str+='<th><p><a href="#" class="xi2">22</a></p>帖子</th>';
		    str+='<td><p><a href="#" class="xi2">74</a></p>积分</td></table></div>';
		    str+='<p><em><a href="#" target="_blank">注册会员</a></em></p><p>';
		    str+='<span id="g_up328068" onmouseover="#"><img src="static/image/common/star_level2.gif" alt="Rank: 2" /></span>';
		    str+='</p><div id="g_up328068_menu" class="tip tip_4" style="display: none;"><div class="tip_horn">';
		    str+='</div><div class="tip_c">注册会员, 积分 74, 距离下一级还需 126 积分</div></div>';
		    str+='<p><span class="pbg2"  id="upgradeprogress_328068" onmouseover="#"><span class="pbr2" style="width:16%;"></span></span></p>';
		    str+='<div id="g_up328068_menu" class="tip tip_4" style="display: none;"><div class="tip_horn"></div><div class="tip_c">注册会员, 积分 74, 距离下一级还需 126 积分</div>';
		    str+='</div><dl class="pil cl"><dt>积分</dt><dd><a href="#" target="_blank" class="xi2">74</a></dd></dl>';
		    str+='<dl class="pil cl"></dl><ul class="xl xl2 o cl"><li class="pm2"><a href="#" onclick="#" title="发消息" class="xi2">发消息</a></li></ul>';
		    str+='</div></td><td class="plc"><div class="pi"><strong><a href="#"   id="postnum328068" onclick="#">推荐</a></strong>';
		    str+='<div class="pti"><div class="pdbt"></div><div class="authi">';
		    
		    if(muid==item.cuid){
		    	str+='<img class="authicn vm" src="../images/img/ico_lz.png" />&nbsp;楼主<span class="pipe">|</span>';
		    }else{
		    	str+='<img class="authicn vm" src="../images/img/online_member.gif" />&nbsp;<span class="pipe">|</span>';
		    }
		   
		    str+='<em id="authorposton328068">发表于：'+item.cdate+'</em><span class="pipe">|</span><a href="#" rel="nofollow">只看该作者</a>';
		    str+='</div></div></div><div class="pct"><div class="pcb"><div class="t_fsz">';
		    str+='<table cellspacing="0" cellpadding="0"><tr><td class="t_f" id="postmessage_328068">';
		    str+='<br />'+item.ccontent+'</td></tr></table></div>';
		    str+='<div id="comment_328068" class="cm"></div><div id="post_rate_div_328068"></div></div></div>';
		    str+='</td></tr><tr><td class="plc plm"></td></tr>	<tr id="_postposition328068"></tr><tr>';
		    str+='<td class="pls"></td><td class="plc" style="overflow:visible;"><div class="po hin"><div class="pob cl"><em>';
		    str+='<a class="fastre" href="#" onclick="#">回复</a>';
		    str+='<a class="replyadd" href="#"  onclick="#" onmouseover="#">支持 <span id="review_support_328068">1</span></a>';
		    str+='<a class="replysubtract" href="#"  onclick="#" onmouseover="#">反对 <span id="review_against_328068">0</span></a>';
		    str+='</em><p><a href="javascript:;" id="mgc_post_328068" onmouseover="#" class="showmenu">使用道具</a>';
		    str+='<a href="javascript:;" onclick="#">举报</a></p>';
		    str+='<ul id="mgc_post_328068_menu" class="p_pop mgcmn" style="display: none;"></ul>';
		    str+='</div></div></td></tr><tr class="ad"><td class="pls"></td><td class="plc"></td></tr></table></div>';
		    
		    
		    $.post("../findByMuid",{muid:item.cuid},function(data){
		    	$("#uname"+item.cuid+index).text(data.uname);
		    	$("#upic"+item.cuid+index).attr("src",data.photo);
		    },"json");
		}
	    if(index>=i-1){
	    	return false;
	    }
	
	});
	
	$("#postlist").append(str);
	scrollTo(0,0);
}


function postInfo(){
	var str=$("#postText").val();
	$.post("../postInfo",{str:str,fid:fid},function(data){
		if(data>0){
			window.location.reload();//刷新当前页面.
		}else{
			alert("发布失败，请重试。");
		}
	},"text");
}


