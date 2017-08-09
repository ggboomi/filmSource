
$(function(){
	console.log("come");
	checkLogin();
	find20();
});



function find20(){
	var str="";
	
	$.post("../find20",function(data){
		$.each(data,function(index,item){
			var simg=item.fpic;
			simg=simg.split(",")[0];
			
			str+='<li style="width: 94px;">';
			str+='<a href="backdetail.html#'+item._id+'" target="_blank">';
			str+='<img src="../../'+simg+'" width="94" height="120" alt="'+item.fname+'" /></a>';
			str+='<p><a href="thread-65922-1-1.html" title="'+item.fname+'" target="_blank">'+item.fname+'</a>';
			str+='</p></li>';
		});
		$("#ul_list").append(str);
	},"json");

	
	
}

