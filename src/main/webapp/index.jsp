<%@page import="java.util.Arrays"%>
<%@page import="com.yc.fs.bean.File"%>
<%@page import="java.lang.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>悬疑电影|悬疑片 - RARBT种子电影天堂</title>
<link rel="stylesheet" href="css/index.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>

<body>
	<div class="hd">
		<div class="hdbl">
			<div class="hdb">
				<div class="hdT">
					<div id="topbar">
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
						<form action="<!-- /index.php/search/index.html -->  #"
							method="get" name="sform">
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
						<span class="newtip"></span><a
							href="movie?order=grade"><font
							color="#FFF300">电影检索</font></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cl"
		style="width: 960px; margin: 0px auto; padding: 10px 20px 0; text-align: center; background: #fff">
	</div>
	<div class="mb cl">
		<div id="ml" class="ml">
			<div class="mtlbt cl">
			<%
				HttpSession sessionss = request.getSession();
				String ctype=(String) sessionss.getAttribute("cctype");
				if(ctype==null){
					ctype="电影";
				}else{
					ctype="";
				}
			%>
				<span class="ts"><%=ctype%>${cctype }</span>
			</div>

			<div id="ppx"></div>

			<ul class="pagelist">
				<div id="page">
					<c:set var="p" value="0"/> 
					<fmt:parseNumber var="pages" integerOnly="true" value="${total/10}" />
					<c:set var="retotal" value="${total%10}"/> 
					<c:if test="${retotal>0}">
						<c:set var="pages" value="${pages+1}"/>
					</c:if>
					<c:if test="${pnum>1}">
						<li><a class="next" href="page/${pnum-1 }">上一页</a></li>
		      		</c:if>	 
					<c:forEach var="i" begin="1" end="${pages}" step="1">
						<c:set var="p" value="${p+1 }"/>
						<c:choose>
				           <c:when test="${pnum==p}">
							 <li><span class="current">${p }</span></li>
				           </c:when>
				           <c:otherwise>
							 <li><a class="num" href="page/${p }.html">${p }</a></li>
				           </c:otherwise>
			       		</c:choose>
					</c:forEach>
					<c:if test="${pnum<pages}">
						  <li><a class="next" href="page/${pnum+1 }">下一页</a></li>
						  <li><a class="end" href="page/${pages }">尾页</a></li>
		      		</c:if>	
					<li><span class="rows">共 ${pages } 页 ${total} 条记录</span></li>
				</div>
			</ul>
		</div>
		<!--右边-->
		<div class="mr">
			<div class="mrl">
				<div class="mrlhr">
					<div class="otcat">
						<h3>其他分类</h3>
						<ul>
							<li><a title="最新剧情电影|剧情片"
								href="search?search=剧情">最新剧情电影</a></li>
							<li><a title="最新韩国电影|韩国片"
								href="search?area=韩国">最新韩国电影</a></li>
						</ul>
					</div>
					<div class="otcat">
						<h3>其他地区</h3>
						<ul>
							<li><a title="最新日本电影"
								href="search?area=日本">最新日本电影</a></li>
							<li><a title="最新中国大陆电影"
								href="search?area=中国大陆">最新中国大陆电影</a></li>
							<li><a title="最新中国台湾电影"
								href="search?area=中国台湾">最新中国台湾电影</a></li>
							<li><a title="最新澳大利亚电影"
								href="search?area=澳大利亚">最新澳大利亚电影</a></li>
							<li><a title="最新美国电影"
								href="search?area=美国">最新美国电影</a></li>

						</ul>
					</div>
					<div class="otcat">
						<h3>其他年份</h3>
						<ul>
							<li><a title="2016最新电影"
								href="search?year=2016">2016最新电影</a></li>
							<li><a title="2015最新电影"
								href="search?year=2015">2015最新电影</a></li>
							<li><a title="2014最新电影"
								href="search?year=2014">2014最新电影</a></li>
							<li><a title="2013最新电影"
								href="search?year=2013">2013最新电影</a></li>
							<li><a title="2012最新电影"
								href="search?year=2012">2012最新电影</a></li>
							<li><a title="2011最新电影"
								href="search?year=2011">2011最新电影</a></li>
							<li><a title="2010最新电影"
								href="search?year=2010">2010最新电影</a></li>
							<li><a title="2009最新电影"
								href="search?year=2009">2009最新电影</a></li>
							<li><a title="2008最新电影"
								href="search?year=2008">2008最新电影</a></li>
							<li><a title="2007最新电影"
								href="search?year=2007">2007最新电影</a></li>
						</ul>
					</div>
					<div class="otcat">
						<h3>明星电影</h3>
						<ul>
							<li><a title="周星驰电影全集"
								href="search?aname=周星驰">周星驰电影全集</a></li>
							<li><a title="成龙电影全集"
								href="search?aname=成龙">成龙电影全集</a></li>
							<li><a title="李连杰电影全集"
								href="search?aname=李连杰">李连杰电影全集</a></li>
							<li><a title="刘德华电影全集"
								href="search?aname=刘德华">刘德华电影全集</a></li>
							<li><a title="张国荣电影全集"
								href="search?aname=张国荣">张国荣电影全集</a></li>
							<li><a title="林青霞电影全集"
								href="search?aname=林青霞">林青霞电影全集</a></li>
							<li><a title="李嘉欣电影全集"
								href="search?aname=李嘉欣">李嘉欣电影全集</a></li>
							<li><a title="张曼玉电影全集"
								href="search?aname=张曼玉">张曼玉电影全集</a></li>
							<li><a title="尼古拉斯·凯奇电影全集"
								href="search?aname=尼古拉斯·凯奇">尼古拉斯·凯奇电影全集</a></li>
							<li><a title="布拉德·皮特电影全集"
								href="search?aname=布拉德·皮特">布拉德·皮特电影全集</a></li>
							<li><a title="威尔·史密斯电影全集"
								href="search?aname=威尔·史密斯">威尔·史密斯电影全集</a></li>
							<li><a title="保罗·沃克电影全集"
								href="search?aname=保罗·沃克">保罗·沃克电影全集</a></li>
						</ul>
					</div>

					<!--   <div class="otcat">
  <h3>友情链接</h3>
  <ul>
  <li></li>
  </ul>
  </div> -->

					<div class="cl"></div>

				</div>
				<br> <br>
				<center>
					<!--/*160*600，创建于2013-10-6*/-->

				</center>
			</div>

			﻿
			<div class="mrr">
				<div class="mrrb">

					<div class="mrrdt cl">
						<div class="mrri">
							<img src="images/recommended_1.gif" alt="推荐下载">
						</div>
						<div class="mrrt">
							<ul class="tabmenu">
								<li id="t_holst" class="able this"><a
									href="javascript:void(0);"
									onclick="switchTab1('holst','nrlst')"><strong>火热下载</strong></a></li>
								<li id="t_nrlst" class="able"><a href="javascript:void(0);"
									onclick="switchTab1('nrlst','holst')"><strong>新片推荐</strong></a></li>
							</ul>
						</div>
					</div>

					<div class="mrrdt">
						<!-- 火热下载 -->
						<ul class="lst" id="holst">

						</ul>

						<!-- 新片推荐 -->
						<ul class="lst" id="nrlst" style="display: none">

						</ul>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="cl"
		style="width: 1000px; margin: 0px auto; text-align: center; background: #fff">
	</div>
	﻿
	<script src="http://www.rarbt.com/js/foot0.js"></script>
	<div class="footer">

		<p class="announcement">
			本站基于互联网自由分享，所有bt种子文件均来自互联网，分享于互联网，本站只作为一个bt种子暂存平台；本站服务器未保存任何影视、音乐、游戏等资源或文件，且本站并不属于bt种子的提供者、制作者、所有者，因此本站不承担任何法律责任！

		
		<p>
		<p>关于我们 | 网站帮助 | 广告合作 | 友情链接 | 网站地图 黔ICP备15014552号-1</p>
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>
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
<script src="http://www.rarbt.com/js/foot.js"></script>
</html>