$(function(){
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
		

