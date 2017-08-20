$(function() {
	console.log("come");
	checkLogin();
	find20();
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
	$
			.post(
					"../findPostInfoByTypes",
					{
						type : 4
					},
					function(data) {
						var str = '';
						$
								.each(
										data,
										function(index, item) {
											if (index % 2 == 1) {
												str += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;" id="rep_7ree_64565" onmouseover="#">';
												str += '<a href="backdetail.html#'
														+ item._id
														+ '" style="font-weight: bold; color:blue" target="_blank">';
												str += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />'
														+ item.pname
														+ '</a></div>';
											} else {
												str += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;" id="rep_7ree_64565" onmouseover="#">';
												str += '<a href="backdetail.html#'
														+ item._id
														+ '" style="font-weight: bold; color: #3C9D40" target="_blank">';
												str += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />'
														+ item.pname
														+ '</a></div>';
											}
											if (index > 10) {
												return false;
											}
										});

						$("#rep2").append(str);
					}, "json");
}

function pop() {
	// 查找浏览次数最多的12条数据
	$
			.post(
					"../findPop",
					function(data) {
						var str = '';
						$
								.each(
										data,
										function(index, item) {
											str += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;" id="hot_7ree_67525" onMouseOver="#">';
											str += '<a href="backdetail.html#'
													+ item._id
													+ '" target="_blank">';
											str += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />';
											str += item.pname + '</a></div>';
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
	$
			.post(
					"../find20",
					function(data) {
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

						$
								.each(
										data,
										function(index, item) {
											div += '<div style="overflow: hidden; height: 20px; width: 96%; word-break: break-all; border-bottom: 1px dashed #CDCDCD;"';
											div += ' id="new_7ree_67636" onmouseover="">';
											div += '<a href="backdetail.html#'
													+ item._id
													+ '" target=\'_blank\'>';
											div += '<img src="../images/img/list_7ree.gif" border="0" align="absmiddle" />';
											div += ' [' + item.myear + ']'
													+ '[' + item.country + ']'
													+ item.fname + '</a>';
											div += '</div>';
											if (index > 10) {
												return false;
											}
										});

						$("#new2").append(div);

					}, "json");
}
