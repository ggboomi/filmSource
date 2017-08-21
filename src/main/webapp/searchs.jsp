<%@page import="java.util.Arrays"%>
<%@page import="com.yc.fs.bean.File"%>
<%@page import="java.lang.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电影检索 - RARBT种子电影天堂</title>
<link rel="stylesheet" href="css/style_2.css" type="text/css">
<link rel="stylesheet" href="css/movie_1.css" type="text/css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/moviesearch.js"></script>
</head>
<body>
	<div class="hd">
		<div class="hdbl">
			<div class="hdb">
				<div class="hdT">
					<div id="topbar">
						<script type="text/javascript" src="/Public/Home/js/language.js"></script>
						<!-- <a id="a-lang" href="javascript:void(0);" title="點擊以繁體中文方式浏覽"><font color="#FFF300"><b>繁體中文切換</b></font></a> -->
						<a
							onclick="addFavorite(this.href,'rarbt中文站,BT资源共享,rarbt.com');return false;"
							href="/">收藏本站</a><a href="http://www.rarbt.com"
							title="最新电影bt种子下载">最新电影</a><a href="/help1/百度网盘电影观看教程.html"
							title="百度网盘电影观看教程">百度网盘教程</a><a href="/help/bt种子电影教程.html"
							title="bt种子电影">bt教程</a><a href="http://bbs.rarbt.com/"
							title="BT论坛"><b>BT官方论坛</b></a>
					</div>
					<a href="/" title="bt种子电影下载"><img src="images/logo_1.png"
						alt="bt种子电影下载" width="196" height="60" /></a>
					<div class="Ts spe">
						<a href="javascript:void(0);"
							onmouseout="this.parentNode.className='Ts spe'"
							onmouseover="this.parentNode.className='Ts spe hover'" id="cst">站内</a>
						<div class="dp" onmouseout="this.parentNode.className='Ts spe'"
							onmouseover="this.parentNode.className='Ts spe hover'">
							<a href="javascript:void(0);"
								onclick="changeS(this);return false;">Google</a>
						</div>
						<form action="/index.php/search/index.html" method="get"
							name="sform">
							<input size="30" name="search" id="keyword" type="text"
								class="si grey" value="影片名/ 明星/ 导演/ 地区/ 年代/ imdb"
								onclick="if(this.value=='影片名/ 明星/ 导演/ 地区/ 年代/ imdb') this.value='';this.className='si'"><input
								value="搜 索" class="sbt" type="submit"
								onclick="return ckSearch();">
						</form>
					</div>
					<div class="searchtip" id="searchtip" style="display: none;">
						站内搜索支持imdb编号啦！如:<font color="red">tt1371111</font> <span
							onclick="this.parentNode.style.display='none'">x</span>
					</div>
					<DIV class=fx>
						<div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
							<a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
							<a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
							<a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a> <a
								title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq"></a> <a
								title="分享到豆瓣网" href="#" class="bds_douban" data-cmd="douban"></a>
							<span class="bds_more">更多</span> <a class="shareCount"></a>
						</div>
						<script data="type=tools&amp;uid=179151" id="bdshare_js"
							type="text/javascript" src="/Public/Home/js/bds_s_v2_1.js"></script>
					</DIV>
				</div>
				<div class="hd_B">
					<div class="Btitle">
						<a href="type/0.html" title="电影下载">电影</a>
					</div>

					<!-- 电影类型（类型表） -->
					<div id="mtype"></div>

					<div class="Btitle">
						<a href="search?area=美国" title="电影下载">美国</a>
					</div>
					<div class="Btitle">
						<a href="search?area=韩国" title="电影下载">韩国</a>
					</div>
					<div class="Btitle">
						<a href="search?year=2016" title="电影下载">2016</a>
					</div>
					<div class="Btitle">
						<a href="search?year=2015" title="电影下载">2015</a>
					</div>
					<div class="Btitle posrel">
						<span class="newtip"></span><a href="movie?order=grade"><font
							color="#FFF300">电影检索</font></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mb cl no_bgimg">
		<div class="minbar">
			<dl class="cl">
				<dt>类型:</dt>
				<dd id="search"></dd>
			</dl>

			<dl class="cl">
				<dt>国家/地区:</dt>
				<dd id="country"></dd>
			</dl>

			<dl class="cl">
				<dt>年份:</dt>
				<dd id="year"></dd>
			</dl>

			<dl class="cl">
				<dt>排序:</dt>
				<dd id="order"></dd>
			</dl>

		</div>
		<div class="mlist cl">
			<div class="cl"
				style="text-align: center; padding: 10px 0 0 10px; text-align: center; background: #fff">
				<!-- 广告位：960*90 -->
				<p>
					<a href="back/backindex.html" target="_self"> <span
						style="font-family: 'arial black', 'avant garde'; color: rgb(255, 0, 0); background-color: rgb(255, 255, 0);">
							<strong> <span
								style="color: rgb(255, 0, 0); font-family: 'arial black', 'avant garde'; font-size: 20px; background-color: rgb(255, 255, 0);">官方论坛
									bbs.rarbt.com 备用地址 www.rarbt.cc </span> <span
								style="color: rgb(255, 0, 0); font-family: 'arial black', 'avant garde'; font-size: 20px; text-decoration: underline; background-color: rgb(255, 255, 0);">点击进入</span>
						</strong>
					</span>
					</a>
				</p>
			</div>

			<!-- 电影信息 -->
			<div id="movie"></div>

		</div>
		<!--<center style="margin-top:20px;">
</center>-->
		<ul class="pagelist">
			<div id="page">
				<c:set var="p" value="0" />
				<fmt:parseNumber var="pages" integerOnly="true" value="${mtotal/30}" />
				<c:set var="retotal" value="${mtotal%30}" />
				<c:if test="${retotal>0}">
					<c:set var="pages" value="${pages+1}" />
				</c:if>
				<c:if test="${mpnum>1}">
					<li><a class="next" href="mpage/${mpnum-1 }">上一页</a></li>
				</c:if>
				<c:forEach var="i" begin="1" end="${pages}" step="1">
					<c:set var="p" value="${p+1 }" />
					<c:choose>
						<c:when test="${mpnum==p}">
							<li><span class="current">${p }</span></li>
						</c:when>
						<c:otherwise>
							<li><a class="num" href="mpage/${p }.html">${p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${mpnum<pages}">
					<li><a class="next" href="mpage/${mpnum+1 }">下一页</a></li>
					<li><a class="end" href="mpage/${pages }">尾页</a></li>
				</c:if>
				<li><span class="rows">共 ${pages } 页 ${mtotal} 条记录</span></li>
			</div>
		</ul>
	</div>
	<div class="footer">

		<p class="announcement">本站基于互联网自由分享，所有bt种子文件均来自互联网，分享于互联网，本站只作为一个bt种子暂存平台；本站服务器未保存任何影视、音乐、游戏等资源或文件，且本站并不属于bt种子的提供者、制作者、所有者，因此本站不承担任何法律责任！

		
		<p>
		<p>关于我们 | 网站帮助 | 广告合作 | 友情链接 | 网站地图 黔ICP备15014552号-1</p>
		<script type="text/javascript">
			function switchTab1(kai, guan) {
				$('#' + kai + '').show();
				$('#t_' + kai + '').addClass('this');
				$('#' + guan + '').hide();
				$('#t_' + guan + '').removeClass('this');
			}
		</script>
	</div>
	<!-- 广告位：对联全站-->
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?f913d8d669e587a819e4434b2314f732";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>
</html>