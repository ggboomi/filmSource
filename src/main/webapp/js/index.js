$(function(){
	$.post("findByPage",null,function(data){
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
//	<div class="item cl">
//	<div class="title">
//		<p class="tt cl">
//			<span><font color='red'>2017/07/23</font></span><a
//				href="subject/23468.html" title="迫害.Persecuted" target="_blank"><b><font
//					color="#FF6600">迫害.Persecuted<i>/</i>.2014
//				</font></b></a>
//		</p>
//		<p>
//			又名：<a href="subject/23468.html" title="Persecuted"
//				target="_blank">Persecuted</a>
//		</p>
//		<p class="des">
//			2014(美国) <em>/</em>詹姆斯·瑞马尔<em>/</em>迪恩·斯托克维尔<em>/</em>劳尔·特鲁希洛<em>/</em>布鲁斯·戴维森<em>/</em>弗雷德·多尔顿·托马斯<em>/</em>David
//			House
//		</p>
//		<p class="rt">
//			豆瓣评分：<strong>4</strong><em class="dian">.</em><em class="fm">7</em>
//			&nbsp;<a href="/index.php/dou_ban/index.html?id=23468"
//				rel="nofollow" target="_blank"
//				title="去豆瓣查看迫害.Persecuted/Persecuted影片介绍"><em class="e_db"></em></a>
//		</p>
//	</div>
//	
//	<div class="litpic">
//	<a href="subject/23468.html" title="迫害.Persecuted/.2014"
//		target="_blank"><img
//		src="http://img7.doubanio.com/view/movie_poster_cover/lpst/public/p1062824805.jpg,http://img7.doubanio.com/view/movie_poster_cover/ipst/public/p1062824805.jpg"
//		alt="迫害.Persecuted/.2014"
//		onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
//</div>
//</div>
///
});
		

