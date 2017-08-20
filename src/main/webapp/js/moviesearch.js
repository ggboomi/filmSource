$(function(){
	$.post("getSearch",function(data){
		var aaa="";
		$.each(data,function(index,item){
			aaa=item;
		});
		var datas=aaa.split(",");
		var ppx=["","","",""];
		var searchs=["动作","战争","剧情","爱情","科幻","悬疑","家庭","犯罪","恐怖","动画","喜剧","惊悚","冒险","电视剧","纪录片","奇幻","情色","音乐"];
		var areas=["美国","英国","中国大陆","法国","日本","香港","德国","加拿大","印度","韩国","意大利","澳大利亚","西班牙","台湾","比利时","荷兰","瑞典","丹麦","泰国","India"];
		var years=["2016","2015","2014","2013","2012","2011","2010","2009","2008","2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995"];
		var order=["uptime","myear","grade"];
		if(datas[0]=="null"){
			datas[0]="";
			ppx[0]="null";
		}else{
			ppx[0]=datas[0];
			datas[0]="&search="+datas[0];
		}
		if(datas[1]=="null"){
			datas[1]="";
			ppx[1]="null";
		}else{
			ppx[1]=datas[1];
			datas[1]="&area="+datas[1];
		}
		if(datas[2]=="null"){
			datas[2]="";
			ppx[2]="null";
		}else{
			ppx[2]=datas[2];
			datas[2]="&year="+datas[2];
		}
		ppx[3]=datas[3];
		var strs='';
		if(ppx[0]=="null"){
			strs+='<a href="" class="this">不限</a>';
		}else{
			strs+='<a href="movie?order='+datas[3]+datas[1]+datas[2]+'" class="">不限</a>';
		}
		for(var i=0;i<searchs.length;i++){
			if(ppx[0]==searchs[i]){
				strs+='<a href="" class="this">'+searchs[i]+'</a>';
			}else{
				strs+='<a href="movie?order='+datas[3]+'&search='+searchs[i]+datas[1]+datas[2]+'" class="">'+searchs[i]+'</a>';
			}
		}
		$("#search").append(strs);
		
		var stra='';
		if(ppx[1]=="null"){
			stra+='<a href="" class="this">不限</a>';
		}else{
			stra+='<a href="movie?order='+datas[3]+datas[0]+datas[2]+'" class="">不限</a>';
		}
		for(var i=0;i<areas.length;i++){
			if(ppx[1]==areas[i]){
				stra+='<a href="" class="this">'+areas[i]+'</a>';
			}else{
				stra+='<a href="movie?order='+datas[3]+datas[0]+'&area='+areas[i]+datas[2]+'" class="">'+areas[i]+'</a>';
			}
		}
		$("#country").append(stra);
		
		var stry='';
		if(ppx[2]=="null"){
			stry+='<a href="" class="this">不限</a>';
		}else{
			stry+='<a href="movie?order='+datas[3]+datas[0]+datas[1]+'" class="">不限</a>';
		}
		for(var i=0;i<years.length;i++){
			if(ppx[2]==years[i]){
				stry+='<a href="" class="this">'+years[i]+'</a>';
			}else{
				stry+='<a href="movie?order='+datas[3]+datas[0]+datas[1]+'&year='+years[i]+'" class="">'+years[i]+'</a>';
			}
		}
		$("#year").append(stry);
		var stro='';
		if(ppx[3]=="uptime"){
			stro+='<a href="" class="this">添加时间</a>';
			stro+='<a href="movie?order=myear'+datas[0]+datas[1]+datas[2]+'" class="">资源更新</a>';
			stro+='<a href="movie?order=grade'+datas[0]+datas[1]+datas[2]+'" class="">豆瓣评分</a>';
		}else if(ppx[3]=="myear"){
			stro+='<a href="movie?order=uptime'+datas[0]+datas[1]+datas[2]+'" class="">添加时间</a>';
			stro+='<a href="" class="this">资源更新</a>';
			stro+='<a href="movie?order=grade'+datas[0]+datas[1]+datas[2]+'" class="">豆瓣评分</a>';
		}else{
			stro+='<a href="movie?order=uptime'+datas[0]+datas[1]+datas[2]+'" class="">添加时间</a>';
			stro+='<a href="movie?order=myear'+datas[0]+datas[1]+datas[2]+'" class="">资源更新</a>';
			stro+='<a href="" class="this">豆瓣评分</a>';
		}
		$("#order").append(stro);
	},"json");
	
	
	$.post("findAllType",null,function(data){
		strt="";
		$.each(data,function(index,item){
			strt+='<div class="Btitle"><a href="type/'+item.tid+'.html" title="'+item.tname+'电影下载">'+item.tname+'</a></div>';
		});
		$("#mtype").append(strt);
	},"json");
	
	$.post("movieByPage",function(data){
		var str='';
		$.each(data,function(index,item){
			var grade=parseInt(item.grade);
			var fname=item.fname;
			var othernames=(item.othername).split(",");
			grade=grade*5;
			var pic=item.fpic;
			var pics=pic.split(",");
			str+='<div class="perone"><div class="litpic"><a href="subject/'+item.fid+'.html" ';
			str+='title="'+item.fname+'.'+othernames[0]+'.'+item.myear+'" target="_blank"><img src="../'+pics[0]+'" ';
			str+='alt="'+fname+'.'+othernames[0]+'.'+item.myear+'" onerror="this.onerror=null;this.src=\''+item.fpic+'\'" /></a>';
			str+='<p><span class="allstar'+grade+'"></span><strong class="sum">'+item.grade+'</strong></p></div><div class="minfo">';
			str+='<h2><a href="subject/'+item.fid+'.html" title="'+fname+'.'+othernames[0]+'.'+item.myear+'" target="_blank">';
			str+='<b>'+fname+'.'+othernames[0]+'<i>/</i>.'+item.myear+'</b></a></h2><ul><li>类型:';
			var tids=(item.tids).split(",");
			for(var i=0;i<tids.length;i++){
				str+='<a title="'+tids[i]+'" target="_blank" href="search?search='+tids[i]+'" >'+tids[i]+'</a>';
			}
			str+='</li>';
			str+='<li>地区:';
			var country=(item.country).split(",");
			for(var i=0;i<country.length;i++){
				str+='<a title="'+country[i]+'" target="_blank" href="search?area='+country[i]+'" >'+country[i]+'</a>';
			}
			str+='</li>';
			str+='<li>导演:';
			var dname=(item.dname).split(",");
			for(var i=0;i<dname.length;i++){
				str+='<a title="'+dname[i]+'" target="_blank" href="search?dname='+dname[i]+'" >'+dname[i]+'</a>';
			}
			str+='</li>';
			str+='<li>主演:';
			var aname=(item.aname).split(",");
			for(var i=0;i<aname.length;i++){
				str+='<a title="'+aname[i]+'" target="_blank" href="search?aname='+aname[i]+'" >'+aname[i]+'</a>';
			}
			str+='</li></ul></div></div>';
		});
		$("#movie").append(str);
	},"json");
});
		

