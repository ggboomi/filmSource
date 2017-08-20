$(function() {
	console.log("come");
	checkLogin();
	find20();
	
	getPopFname();
	
	news();
	findUser();

	pop();

	byType();

	findLatest();

	$.post("../getStatistics", function(data) {
		$("#et").text(data.todayPostNum);
		$("#ey").text(data.yesterdayPostNum);
		$("#ep").text(data.totalNum);
		$("#eu").text(data.userNum);
	}, "json");

	for (var i = 1; i <= 5; i++) {
		$.post("../getStatisticsByType", {
			type : i
		}, function(data) {
			$("#t" + data.type).text(data.tPostNumByType);
			$("#p" + data.type).text(data.postNumByType);

		}, "json");
	}

	$.post("../test", function(data) {

	}, "json");

	// 查找当前在线人数
	$.post("../findCurrentLoginUser", function(data) {
		$("#loginUser").text(data);
	}, "text");

});

function news(){
	$.post("../findNews", function(data) {
		var div='';
		$.each(data,function(index, item) {
			div += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;"';
			div += ' id="menu'+item._id+'" onmouseover="showMenu(this.id,1)" onmouseout="noMenu(this.id,1)">';
			div += '<a href="backdetail.html#'
					+ item._id
					+ '" target=\'_blank\'>';
			div += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />';
			div += item.pname + '</a>';
			div += '</div>';
			
			div+='<div id="menu'+item._id+'1" class="p_pop" style="width: 220px; position: absolute; z-index: 301; left: 205.5px; top: '+(530+index*21)+'px; display: none;">';
			div+=' &nbsp;&nbsp;<strong>'+item.pname+'</strong><br>';
			var typeName='';
			var type=0;
			if(item.types!=undefined){
				if(item.types.indexOf(",")!=-1){
					type=item.types.split(",")[0];
				}else{
					type=item.types;
				}
			}
			
			if(type=="1"){
				typeName="大陆板块";
			}else if(type=="2"){
				typeName="港台板块";
			}else if(type=="3"){
				typeName="日韩板块";
			}else if(type=="4"){
				typeName="欧美板块";
			}else if(type=="5"){
				typeName="讨论区";
			}
			div+=' &nbsp;&nbsp;版块：'+typeName+'<br>';
			div+='&nbsp;&nbsp;作者：<span id="userName1'+item.uid+index+'"></span><br>';
			$.post("../findByMuid",{muid:item.uid},function(data){
		    	$("#userName1"+item.uid+index).text(data.uname);
		    },"json");
			div+='&nbsp;&nbsp;时间：'+item.pdate+'<br>';
			div+='&nbsp;&nbsp;浏览：'+item.num+'&nbsp;&nbsp;回复：'+item.opts.length+'次';
			div+='</ul></div>';
			
			if (index > 10) {
				return false;
			}
		});
		
		$("#new2").append(div);
	}, "json");	
}

function findLatest() {
	$.post("../findLatest", function(data) {
		$.each(data,
				function(index, item) {
					var str = '<a href="backdetail.html#' + item._id
							+ '" class="xi2">' + item.pname + '</a> ';
					str += '<cite><span title="2017-7-27 13:19">' + item.pdate
							+ '</span> ';
					str += '<a href="#" id="uname' + item.uid + index
							+ '"></a></cite>';

					$.post("../findByMuid", {
						muid : item.uid
					}, function(data) {
						$("#uname" + item.uid + index).text(data.uname);
					}, "json");

					var types = item.types;
					if (types.indexOf(",") != -1) {
						var type = types.split(",");
						$("#type" + type[0]).append(str);
					} else {
						$("#type" + types).append(str);
					}
				});
	}, "json");
}

function byType() {
	$.post("../findPostInfoByTypes",{type : 4},
		function(data) {
		var str = '';
		$.each(data,function(index, item) {
			if (index % 2 == 1) {
				str += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;" id="menu'+item._id+'" onmouseover="showMenu(this.id,2)" onmouseout="noMenu(this.id,2)">';
				str += '<a href="backdetail.html#'
						+ item._id
						+ '" style="font-weight: bold; color:blue" target="_blank">';
				str += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />'
						+ item.pname
						+ '</a></div>';
			} else {
				str += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;" id="menu'+item._id+'" onmouseover="showMenu(this.id,2)" onmouseout="noMenu(this.id,2)">';
				str += '<a href="backdetail.html#'
						+ item._id
						+ '" style="font-weight: bold; color: #3C9D40" target="_blank">';
				str += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />'
						+ item.pname
						+ '</a></div>';
			}
			
			str+='<div id="menu'+item._id+'2" class="p_pop" style="width: 220px; position: absolute; z-index: 301; left: 517.5px; top: '+(530+index*21)+'px; display: none;">';
			str+=' &nbsp;&nbsp;<strong>'+item.pname+'</strong><br>';
			var typeName='';
			var type=0;
			if(item.types!=undefined){
				if(item.types.indexOf(",")!=-1){
					type=item.types.split(",")[0];
				}else{
					type=item.types;
				}
			}
			
			if(type=="1"){
				typeName="大陆板块";
			}else if(type=="2"){
				typeName="港台板块";
			}else if(type=="3"){
				typeName="日韩板块";
			}else if(type=="4"){
				typeName="欧美板块";
			}else if(type=="5"){
				typeName="讨论区";
			}
			str+=' &nbsp;&nbsp;版块：'+typeName+'<br>';
			str+='&nbsp;&nbsp;作者：<span id="userName2'+item.uid+index+'"></span><br>';
			$.post("../findByMuid",{muid:item.uid},function(data){
		    	$("#userName2"+item.uid+index).text(data.uname);
		    },"json");
			str+='&nbsp;&nbsp;时间：'+item.pdate+'<br>';
			str+='&nbsp;&nbsp;浏览：'+item.num+'&nbsp;&nbsp;回复：'+item.opts.length+'次';
			str+='</ul></div>';
			
			if (index > 10) {
				return false;
			}
		});

		$("#rep2").append(str);
	}, "json");
}

function pop() {
	// 查找浏览次数最多的12条数据
	$.post("../findPop",function(data) {
		var str = '';
		$.each(data,function(index, item) {
			str += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;" id="menu'+item._id+'" onmouseover="showMenu(this.id,3)" onmouseout="noMenu(this.id,3)">';
			str += '<a href="backdetail.html#'
					+ item._id
					+ '" target="_blank">';
			str += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />';
			str += item.pname + '</a></div>';
			
			str+='<div id="menu'+item._id+'3" class="p_pop" style="width: 220px; position: absolute; z-index: 301; left: 830.5px; top: '+(530+index*21)+'px; display: none;">';
			str+=' &nbsp;&nbsp;<strong>'+item.pname+'</strong><br>';
			var typeName='';
			var type=0;
			if(item.types!=undefined){
				if(item.types.indexOf(",")!=-1){
					type=item.types.split(",")[0];
				}else{
					type=item.types;
				}
			}
			
			if(type=="1"){
				typeName="大陆板块";
			}else if(type=="2"){
				typeName="港台板块";
			}else if(type=="3"){
				typeName="日韩板块";
			}else if(type=="4"){
				typeName="欧美板块";
			}else if(type=="5"){
				typeName="讨论区";
			}
			str+=' &nbsp;&nbsp;版块：'+typeName+'<br>';
			str+='&nbsp;&nbsp;作者：<span id="userName3'+item.uid+index+'"></span><br>';
			$.post("../findByMuid",{muid:item.uid},function(data){
		    	$("#userName3"+item.uid+index).text(data.uname);
		    },"json");
			str+='&nbsp;&nbsp;时间：'+item.pdate+'<br>';
			str+='&nbsp;&nbsp;浏览：'+item.num+'&nbsp;&nbsp;回复：'+item.opts.length+'次';
			str+='</ul></div>';
		});

		$("#hot2").append(str);

	}, "json");
}

function findUser() {
	var str = "";
	$.post("../findUser", function(data) {
		$.each(data, function(index, item) {
			str += '<span class="avt" style="margin-left: 3px; float: left;">';
			str += '<a href="#" target="_blank" title="' + item.uname + '">';
			if (item.photo == undefined) {
				str += '<img src="../images/zanwu.jpg" /></a></span>';
			} else {
				str += '<img src="../../' + item.photo + '" /></a></span>';
			}

		});
		$("#newUser").text(data[0].uname);
		$("#userInfo").append(str);
	});
}

function find20() {
	var str = "";
	var div = "";
	$.post("../find20",function(data) {
		$.each(data, function(index, item) {
			var simg = item.fpic;
			simg = simg.split(",")[0];

			str += '<li style="width: 94px;">';
			str += '<a href="backdetail.html#' + item._id
					+ '" target="_blank">';
			str += '<img src="../../' + simg
					+ '" width="94" height="120" alt="'
					+ item.fname + '" /></a>';
			str += '<p><a href="backdetail.html#' + item._id
					+ '" title="' + item.fname
					+ '" target="_blank">' + item.fname
					+ '</a>';
			str += '</p></li>';

		});
		$("#ul_list").append(str);

	}, "json");
}

//showMenu({'ctrlid':this.id,'duration':'1'})
function showMenu(id,flag){
	$("#"+id+flag).css('display','block');
}

function noMenu(id,flag){
	$("#"+id+flag).css('display','none');
}
