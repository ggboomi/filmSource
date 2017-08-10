
$(function(){
	console.log("come");
	checkLogin();
	find20();
	findUser();
});

function findUser(){
	var str="";
	$.post("../findUser",function(data){
		$.each(data,function(index,item){
			str+='<span class="avt" style="margin-left: 3px; float: left;">';
			str+='<a href="#" target="_blank" title="'+item.uname+'">';
			if(item.photo==undefined){
				str+='<img src="../images/zanwu.jpg" /></a></span>';
			}else{
				str+='<img src="../../'+item.photo+'" /></a></span>';
			}
						 		
		});
		$("#newUser").text(data[0].uname);
		$("#userInfo").append(str);
	});
}

function find20(){
	var str="";
	var div="";
	$.post("../find20",function(data){
		$.each(data,function(index,item){
			var simg=item.fpic;
			simg=simg.split(",")[0];
			
			str+='<li style="width: 94px;">';
			str+='<a href="backdetail.html#'+item._id+'" target="_blank">';
			str+='<img src="../../'+simg+'" width="94" height="120" alt="'+item.fname+'" /></a>';
			str+='<p><a href="backdetail.html#'+item._id+'" title="'+item.fname+'" target="_blank">'+item.fname+'</a>';
			str+='</p></li>';
			
		});
		$("#ul_list").append(str);
		
		$.each(data,function(index,item){
			div+='<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;"';
			div+=' id="new_7ree_67636" onmouseover="">';
			div+='<a href="backdetail.html#'+item._id+'" target=\'_blank\'>';
			div+='<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />';
			div+=' ['+item.myear+']'+'['+item.country+']'+item.fname+'</a>';
			div+='</div>';
			if(index>10){
				return false;
			}
		});
		
		$("#new2").append(div);
		
	},"json");

	
}

