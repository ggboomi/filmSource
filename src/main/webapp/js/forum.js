var fids=location.hash;
fids=fids.split("#")[1];

var totalPage;
var currentPage;

var search1="";
var search2="";
var search3="";
var searchId1="";
var searchId2="";
var searchId3="";

$(function(){
	
	if(fids==undefined){
		window.location.href="backindex.html";
	}
	
	
	checkLogin();
	getPopFname();
	
	if(fids=="1"){
		$("#type").text("大陆板块");
		$("#title2").text("大陆板块");
		$(document).attr("title","大陆板块【电影资源】");
	}else if(fids=="2"){
		$("#type").text("港台板块");
		$("#title2").text("港台板块");
		$(document).attr("title","港台板块【电影资源】");
	}else if(fids=="3"){
		$("#type").text("日韩板块");
		$("#title2").text("日韩板块");
		$(document).attr("title","日韩板块【电影资源】");
	}else if(fids=="4"){
		$("#type").text("欧美板块");
		$("#title2").text("欧美板块");
		$(document).attr("title","欧美板块【电影资源】");
	}else if(fids=="5"){
		$("#type").text("讨论区");
		$("#title2").text("讨论区");
		$(document).attr("title","讨论区【会员讨论区域】");
	}
	
	$("#allFilm").attr("href","forum.html#"+fids);
	
	$("#type").attr("href","forum.html#"+type);
	
	$.post("../findPostInfoByTypes",{type:fids},function(data){
		showList(data);
	},"json");
	
	$.post("../findPostInfoTotalPage",function(data){
		totalPage = parseInt($.trim(data));
		nextPage(1);		
	},"text");
	
	$.post("../getStatistics",{type:fids},function(data){
		$("#filmTotal").text(data.filmNum);
		$("#st").text(data.tPostNumByType);
		$("#sp").text(data.postNumByType);
	},"json");
	
});

function tosearch(){
	if(search1=="不限"){
		search1="";
	}
	
	if(search2=="不限"){
		search2="";
	}
	
	if(search3=="不限"){
		search3="";
	}
	$.post("../getPostByKeys",{country:search1,years:search2,type:search3},function(data){
		if(data.length>0){
			showList(data);
		}else{
			
		}
		
	},"json").complete(function() { 
		$.post("../findPostInfoTotalPage",function(data){
			totalPage = parseInt($.trim(data));
			nextPage(1);		
		},"text");
	});
}

function tosearch1(value,id){
	console.log("value:"+value);
	console.log("id:"+id);
	search1=value;
	if(searchId1!=""){
		$("#"+searchId1).css("color","#369");
	}
	searchId1=id;
	$("#"+searchId1).css("color","black");
	tosearch();
}

function tosearch2(value,id){
	console.log("value:"+value);
	search2=value;
	if(searchId2!=""){
		$("#"+searchId2).css("color","#369");
	}
	searchId2=id;
	$("#"+searchId2).css("color","black");
	tosearch();
}

function tosearch3(value,id){
	console.log("value:"+value);
	search3=value;
	if(searchId3!=""){
		$("#"+searchId3).css("color","#369");
	}
	searchId3=id;
	$("#"+searchId3).css("color","black");
	tosearch();
}

function showList(data){
	var str='';
	$("#threadlisttableid").html("");
	$.each(data,function(index,item){
		str+='<tbody id="forum'+item._id+'">';
		str+='<tr><td class="icn"><a href="backdetail.html#'+item._id+'" title="新窗口打开" target="_blank"> <img src="../images/img/folder_common.gif" /></a></td>';
		str+='<th class="common"><a href="javascript:;" id="content_68006" class="showcontent y" title="更多操作" onclick="#"></a>';
		str+='<em>[<a href="#">电影发布</a>]</em><a href="backdetail.html#'+item._id+'" onclick="#" class="s xst">'+item.pname+'</a></th>';
		str+='<td class="by"><cite> <a id="uname'+item._id+'1"></a></cite> <em>';
		str+='<span class="xi1"><span title="2017-8-13">'+item.pdate+'</span></span></em></td>';
		str+='<td class="num"><a href="backdetail.html#'+item._id+'" class="xi2">'+item.opts.length+'</a><em>'+item.num+'</em></td>';
		str+='<td class="by"><cite><a id="uname'+item._id+'2"></a></cite><em><a href="#">';
		if(item.opts.length!=0){
			var len=item.opts.length-1;
			if(item.opts[len]!=undefined){
				str+='<span title="'+item.opts[len].cdate+'">'+item.opts[len].cdate+'</span></a></em></td></tr></tbody>';
				$.post("../findByMuid",{muid:item.opts[len].cuid},function(data){
			    	$("#uname"+item._id+"2").text(data.uname);
			    },"json");
			}
		}
		$.post("../findByMuid",{muid:item.uid},function(data){
			$("#uname"+item._id+"1").text(data.uname);
	    },"json");
		
	});
	
	$("#threadlisttableid").append(str);
}

function nextPage(page){
	currentPage=page;
	
	if(page>totalPage){
		nextPage(1);
		return;
	}
	
	$("#pageArea").html("");
	$("#pageArea2").html("");
	
	var pagestr='';
	for(var i=1;i<=totalPage;i++){
		if(page==i){
			pagestr+='<strong>'+i+'</strong>';
		}else{
			pagestr+='<a onclick="nextPage('+i+')">'+i+'</a>';
		}
	}
	pagestr+='<label>';
	pagestr+='<input type="text" name="custompage" id="pagetxt" class="px" size="2" title="输入页码，按回车快速跳转" value="'+page+'" onkeydown="if(event.keyCode==13) {var txt= $(\'#pagetxt\').val();  nextPage(txt)}" />';
	pagestr+='<span title="共'+totalPage+'页"> / '+totalPage+' 页</span>';
	pagestr+='</label><a onclick="nextPage('+(currentPage+1)+')" class="nxt">下一页</a>';
	pagestr+='</div></div>';
	
	$("#pageArea").append(pagestr);
	
	var pagestr2='';
	for(var i=1;i<=totalPage;i++){
		if(page==i){
			pagestr2+='<strong>'+i+'</strong>';
		}else{
			pagestr2+='<a onclick="nextPage('+i+')">'+i+'</a>';
		}
	}
	pagestr2+='<label>';
	pagestr2+='<input type="text" name="custompage" id="pagetxt2" class="px" size="2" title="输入页码，按回车快速跳转" value="'+page+'" onkeydown="if(event.keyCode==13) {var txt= $(\'#pagetxt2\').val();  nextPage(txt)}" />';
	pagestr2+='<span title="共'+totalPage+'页"> / '+totalPage+' 页</span>';
	pagestr2+='</label><a onclick="nextPage('+(currentPage+1)+')" class="nxt">下一页</a>';
	pagestr2+='</div></div>';
	
	$("#pageArea2").append(pagestr);
	
	showData(page);
}

function showData(page){
	$.post("../findPostInfoByPage",{page:page},function(data){
		showList(data);
	},"json");
}