$(function(){
	var op;
	$.post("getOp",null,function(data){
		op=data;
		if(op=="" || op==null){
			op=0;
		}
		$.post("findByPage",{op:op},function(data){
			var str='';
			$.each(data,function(index,item){
				str+='<div class="item cl"><div class="title"><p class="tt cl"><span><font color="red">'+item.uptime+'';
				str+='</font></span><a href="subject/'+item.fid+'.html" title="'+item.fname+'" target="_blank">';
				str+='<b><font color="#FF6600">'+item.fname+'<i>/</i>.'+item.myear+'</font></b></a></p>';
				str+='又名：<a href="subject/'+item.fname+'.html" title="'+item.othername+'" target="_blank">'+item.othername+'</a></p><p class="des">';
				str+=item.myear+'('+item.country+')';
				var anames=(item.aname).split(",");
				var grades=(item.grade).toString().split(".");
				for(var i=0;i<anames.length;i++){
					str+='<em>/</em>'+anames[i];
				}
				str+='</p><p class="rt">豆瓣评分：<strong>'+grades[0]+'</strong><em class="dian">.</em><em class="fm">'+grades[1]+'</em></div>';
				str+='<div class="litpic"><a href="subject/'+item.fid+'.html" title="'+item.fname+'/.'+item.myear+' target="_blank">';
				str+='<img src="'+item.fpic+'" alt="'+item.fname+'/.'+item.myear+'" /></a></div></div>';
				
			});
			$("#ppx").append(str);
		},"json");
	},"text");
	
	
	str="";
	$.post("findAllType",null,function(data){
		$.each(data,function(index,item){
			str+='<div class="Btitle"><a href="type/'+item.tid+'.html" title="'+item.tname+'电影下载">'+item.tname+'</a></div>';
		});
		$("#mtype").append(str);
	},"json");
});
		

