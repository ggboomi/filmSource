$(function(){
	var op;
	var flag=0;
	$.post("getOp",null,function(data){
		op=data;
		if(op==-1){
			alert("进来了");
			op=0;
			flag=1;
		}
		$.post("findByPage",{op:op},function(data){
			var str='';
			$.each(data,function(index,item){
				var pic=item.fpic;
				var pics=pic.split(",");
				str+='<div class="item cl"><div class="title"><p class="tt cl"><span><font color="red">'+item.uptime+'';
				str+='</font></span><a href="subject/'+item.fid+'.html" title="'+item.fname+'" target="_blank">';
				str+='<b><font color="#FF6600">'+item.fname+'<i>/</i>.'+item.myear+'</font></b></a></p>';
				str+='又名：<a href="subject/'+item.fid+'.html" title="'+item.othername+'" target="_blank">'+item.othername+'</a></p><p class="des">';
				str+=item.myear+'('+item.country+')';
				var anames=(item.aname).split(",");
				var grades=(item.grade).toString().split(".");
				for(var i=0;i<anames.length;i++){
					str+='<em>/</em>'+anames[i];
				}
				str+='</p><p class="rt">豆瓣评分：<strong>'+grades[0]+'</strong><em class="dian">.</em><em class="fm">'+grades[1]+'</em></div>';
				str+='<div class="litpic"><a href="subject/'+item.fid+'.html" title="'+item.fname+'/.'+item.myear+' target="_blank">';
				str+='<img src="../'+pics[0]+'" alt="'+item.fname+'/.'+item.myear+'" onerror="this.onerror=null;this.src=\''+item.fpic+'\'" /></a></div></div>';
			});
			$("#ppx").append(str);
			if(flag==1){
				$("#page").empty();
				$.post("getTotal",null,function(data){
					var strp='';
					var totalpage=data/10;
					var retotal=data%10;
					if(retotal>0){
						totalpage=totalpage+1;
					}
					strp+='<li><span class="current">1</span></li>';
					for(var i=2;i<totalpage+1;i++){
						strp+='<li><a class="num" href="page/'+i+'.html">'+i+'</a></li>';
					}
					if(totalpage>1){
						strp+='<li><a class="next" href="page/'+2+'">下一页</a></li><li><a class="end" href="page/'+totalpage+'">尾页</a></li>'
						strp+='<li><span class="rows">共 '+totalpage+' 页 '+data+' 条记录</span></li>';
					}
					$("#page").append(strp);
				},"text");
			}
		},"json");
	},"text");
	
	str="";
	$.post("findAllType",null,function(data){
		$.each(data,function(index,item){
			str+='<div class="Btitle"><a href="type/'+item.tid+'.html" title="'+item.tname+'电影下载">'+item.tname+'</a></div>';
		});
		$("#mtype").append(str);
	},"json");
	
	str2="";
	$.post("findByClick",null,function(data){
		$.each(data,function(index,item){
			var grade=parseInt(item.grade);
			var pic=item.fpic;
			var pics=pic.split(",");
			grade=grade*5;
			str2+='<li><div class="img"><a href="subject/'+item.fid+'.html" title="'+item.fname+'" target="_blank"><img ';
			str2+='width="30" height="45" src="../'+pics[0]+'" alt="'+item.fname+'/'+item.othername+'.'+item.myear+'" onerror="this.onerror=null;this.src=\''+item.fpic+'\'"';
			str2+='/></a></div><div class="tit"><a href="subject/'+item.fid+'.html" title="'+item.fname+'" target="_blank">';
			str2+=item.fname+'/'+item.othername+'</a><span class="allstar'+grade+'"></span>'+item.grade+'</div></li>';
		});
		$("#holst").append(str2);
	},"json");
	
	str3="";
	$.post("findByTime",null,function(data){
		$.each(data,function(index,item){
			var grade=parseInt(item.grade);
			var pic=item.fpic;
			var pics=pic.split(",");
			grade=grade*5;
			str3+='<li><div class="img"><a href="subject/'+item.fid+'.html" title="'+item.fname+'" target="_blank"><img ';
			str3+='width="30" height="45" src="../'+pics[0]+'" alt="'+item.fname+'/'+item.othername+'.'+item.myear+'" onerror="this.onerror=null;this.src=\''+item.fpic+'\'"';
			str3+='/></a></div><div class="tit"><a href="subject/'+item.fid+'.html" title="'+item.fname+'" target="_blank">';
			str3+=item.fname+'/'+item.othername+'</a><span class="allstar'+grade+'"></span>'+item.grade+'</div></li>';
		});
		$("#nrlst").append(str3);
	},"json");
});
		

