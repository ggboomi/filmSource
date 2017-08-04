function addUser() {
	var uname = $.trim($("#uname").val());
	var pwd = $.trim($("#pwd").val());
	$.post("addUserInfo", {
		uname : uname,
		pwd : pwd
	}, function(data) {
		data = parseInt($.trim(data));
		if (data > 0) {
			alert("注册成功...");
		} else {
			alert("注册失败...");
		}
	}, "text");
}