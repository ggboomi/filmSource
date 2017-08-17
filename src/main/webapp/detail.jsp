<%@page import="com.yc.fs.service.impl.FilmServiceImpl"%>
<%@page import="com.yc.fs.bean.FilmType"%>
<%@page import="java.util.List"%>
<%@page import="com.yc.fs.service.FilmService"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.yc.fs.bean.File"%>
<%@page import="java.lang.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="css/arc_1.css" type="text/css">
<link rel="stylesheet" href="css/jquery.treeview_1.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/detail.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${cfilm.fname}:720p|1080p高清BT种子下载- RARBT种子电影天堂</title>

</head>
<body>
	<div class="hd">
		<div class="hdbl">
			<div class="hdb">
				<div class="hdT">
					<div id="topbar">
						<script type="text/javascript" src="js/language.js"></script>
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
						站内搜索支持imdb编号啦！比如:<font color="red">tt1371111</font> <span
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
							type="text/javascript" src="js/bds_s_v2_1.js"></script>
					</DIV>
				</div>
				<div class="hd_B">
					<div class="Btitle">
						<a href="type/0.html" title="电影下载">电影</a>
					</div>
					<div id="mtype"></div>
					<div class="Btitle posrel">
						<span class="newtip"></span><a
							href="/index.php/movie/index.html?order=time"><font
							color="#FFF300">电影检索</font></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cl"
		style="width: 980px; margin: 0px auto; padding: 10px 10px 0; text-align: center; background: #fff">
		<!-- 广告位：960*90 -->
		<script type="text/javascript" language="javascript"
			src="http://www.rarbt.com/js/index960_1.js"></script>
		<a href="http://amblrgg.co/rarbt.htm" target="_blank"><img
			src="http://ww4.sinaimg.cn/large/00637iPCjw1fb1w7m8qqtg30qo02815d.gif"
			border="0"></a>
	</div>
	<div class="mb cl">
		<div class="ml">
			<div class="place">
				<strong>当前位置:</strong> <a href="/">主页</a> > ${cfilm.fname }.${cfilm.othername}/
				.${cfilm.myear} 高清BT种子下载
			</div>
			<div class="viewbox">
				<div class="title">
					<span><a href="#download">下载地址</a></span>
					<h2>
						${cfilm.fname }.${cfilm.othername}<i>/</i>.${cfilm.myear}
					</h2>
				</div>
				<div class="moviedteail">
					<div class="moviedteail_ad">
						<script type="text/javascript" language="javascript"
							src="http://www.rarbt.com/js/350_250.js"></script>
					</div>
					<div class="moviedteail_img">
						<%
							HttpSession sessions = request.getSession();
							File film = (File) sessions.getAttribute("cfilm");
							String pic = film.getFpic();
							String[] pics=pic.split(",");
						%>
						<a class="pic"
							title="${cfilm.fname }.${cfilm.othername}/ .${cfilm.myear}"
							href="#download"><img
							alt="${cfilm.fname }.${cfilm.othername}/ .${cfilm.myear}BT种子高清下载"
							title="${cfilm.fname }.${cfilm.othername}/ .${cfilm.myear}BT种子高清下载"
							src="../<%=pics[0]%>"
							onerror="this.onerror=null;this.src='${cfilm.fpic}'"></a>
						<p class="rt" title="豆瓣评分">
							<%
								double grade = film.getGrade();
								int grade0 = (int) grade;
								double grade111 = 10 * (grade - grade0);
								int grade1 = (int) grade111;
							%>
							<strong><%=grade0%></strong> <em class="dian">.</em><em
								class="fm"><%=grade1%></em><em class="fm">分</em>
						</p>
					</div>
					<div class="moviedteail_tt">
						<h1>${cfilm.fname }</h1>
						<span></span>
					</div>
					<ul class="moviedteail_list">
						<%
							String tids = film.getTids();
							String[] tidss = tids.split(",");
							String country = film.getCountry();
							String[] countrys = country.split(",");
							String dname = film.getDname();
							String[] dnames = dname.split(",");
							String aname = film.getAname();
							String[] anames = aname.split(",");
							String downlink = film.getDownlink();
							String[] downlinks = downlink.split(",");
							int[] ctids=(int[])sessions.getAttribute("ctids");
						%>
						<li>又名:<a title="Game.of.Thrones" target="_blank"
							href="">${cfilm.othername }</a></li>
						<li>标签:<%
							for (int i = 0; i < tidss.length; i++) {
						%><a title="<%=tidss[i]%>"
							target="_blank"
							href="type/<%=ctids[i]%>.html"><%=tidss[i]%></a>
							<%
								}
							%>
						</li>
						<li>地区:<%
							for (int i = 0; i < countrys.length; i++) {
						%><a
							title="<%=countrys[i]%>" target="_blank"
							href="/index.php/search/index.html?area=<%=countrys[i]%>"><%=countrys[i]%></a>
							<%
								}
							%></li>
						<li>年份:<a title="2017" target="_blank"
							href="/index.php/search/index.html?nianfen=2017">${cfilm.myear}</a></li>
						<li>导演:<%
							for (int i = 0; i < dnames.length; i++) {
						%><a
							title="<%=dnames[i]%>" target="_blank"
							href="/index.php/search/index.html?daoyan=<%=dnames[i]%>"><%=dnames[i]%></a>
							<%
								}
							%></li>
						<li>主演:<%
							for (int i = 0; i < anames.length; i++) {
						%><a
							title="<%=anames[i]%>" target="_blank"
							href="/index.php/search/index.html?zhuyan=<%=anames[i]%>"><%=anames[i]%></a>
							<%
								}
							%></li>
						<li>imdb:<a title="imdb" target="_blank" rel="nofollow"
							href="/index.php/search/index.html?imdb=${cfilm.imdb }">tt123456${cfilm.imdb }</a></li>
						<li>详情:<a href="/index.php/dou_ban/index.html?id=23446"
							rel="nofollow" target="_blank"
							title="去豆瓣查看权力的游戏.第七季第2集.Game.of.Thrones/.2017影片介绍"><em
								class="e_db"></em></a></li>
					</ul>

					<div style="margin-top: 10px;">
						<!-- 广告位：350*50 -->
						<script type="text/javascript" language="javascript"
							src="http://www.rarbt.com/js/350_50.js"></script>
					</div>
				</div>

				<a name="download"></a>
				<div class="cl" style="margin: 10px 0; padding: 5px 0;">
					<!-- 广告位：728*90 -->
					<script type="text/javascript" language="javascript"
						src="http://www.rarbt.com/js/zhuyan.js"></script>
				</div>
				<h3 class="tlkt cl">
					下载地址：<small
						style="font-weight: normal; color: #777; font-size: 12px;">扫盲：本站资源需迅雷下载或者BT软件边下边看进行观看,1080p的画质比720p清晰.</small>
					<br /> <span
						style="float: right; color: #ff0000; font-weight: normal; font-size: 12px;">搜索
						<a
						href="http://www.zimuku.net/search?ad=1&q=${cfilm.fname}${cfilm.othername}"
						target="_blank" rel="nofollow">${cfilm.fname}${cfilm.othername}</a>
						外挂字幕
					</span>
				</h3>
				<div class="sl cl">
					<div class="slad"></div>
					<%
						for (int i = 0; i < (downlinks.length) / 2; i++) {
					%>
					<div class="tinfo">
						<a href="<%=downlinks[i*2+1]%>" title="${cfilm.fname }"
							target="_blank"><p class="torrent">
								<img border="0" src="images/torrent_1.gif"
									style="vertical-align: middle"
									alt="${cfilm.fname }.${cfilm.othername}"> 本地下载.<em><%=downlinks[i * 2]%></em>.torrent
							</p></a>
						<ul class="btTree treeview">
							<li><span class="video">${cfilm.fname }${cfilm.othername }.S07E01.1080p.WEB.h264-中英双字-RARBT.mp4</span></li>
						</ul>
					</div>
					<%
						}
					%>
				</div>
				<div style="width: 750px; overflow: hidden;">
					<p>
						<span
							style="color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">
						</span><br
							style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					<div style="width: 715px">
						<span
							style="color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); width: 20px;">
							${cfilm.intro } </span> <br
							style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					</div>
					<br
						style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					<span
						style="color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">【影片截图】</span><br
						style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					<br
						style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					<img id="aimg_Y5f5Q" class="zoom" file="${cfilm.beizhu}"
						lazyloadthumb="1" border="0" alt="" src="${cfilm.beizhu}"
						lazyloaded="true" _load="1" width="600" height="359"
						style="word-wrap: break-word; cursor: pointer; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" /><br
						style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					<br
						style="word-wrap: break-word; color: rgb(68, 68, 68); font-family: Tahoma, Helvetica, SimSun, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);" />
					</p>
				</div>
				<!--打分版，用户可以对当前新闻、游戏或者应用等进行1-5级的评分-->
				<div id="SOHUCS"></div>
				<script charset="utf-8" type="text/javascript"
					src="http://changyan.sohu.com/upload/changyan.js"></script>
				<script type="text/javascript">
					window._config = {
						showScore : true
					};
					window.changyan.api.config({
						appid : 'cysdu2HC0',
						conf : 'prod_0b1d55c21ea4a79dcdf00351b834ea93'
					});
				</script>

				<div class="cl"
					style="margin: 10px 0; padding: 5px 0; text-align: center;">
					<!-- 广告位：bttiantang 700x60 7.18-->
					<script type="text/javascript" language="javascript"
						src="http://www.rarbt.com/js/wen728_02_1.js"></script>
				</div>
				<h3 class="tlkt cl">猜您还喜欢以下影视：</h3>
				<ul class="rel cl">
					<li><a class="pic" href="/subject/23446.html"
						title="权力的游戏.第七季第2集.Game.of.Thrones / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/T3/quan.jpg"
							alt="权力的游戏.第七季第2集.Game.of.Thrones / .2017"
							title="权力的游戏.第七季第2集.Game.of.Thrones / .2017"></a>
						<p>
							<a href="/subject/23446.html"
								title="权力的游戏.第七季第2集.Game.of.Thrones / .2017" target="_blank">权力的游戏.第七季第2集.Game.of.Thrones
								.2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23474.html"
						title="重装上阵.Once.Upon.a.Time.in.Venice / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/T3/zhong.jpg"
							alt="重装上阵.Once.Upon.a.Time.in.Venice / .2017"
							title="重装上阵.Once.Upon.a.Time.in.Venice / .2017"></a>
						<p>
							<a href="/subject/23474.html"
								title="重装上阵.Once.Upon.a.Time.in.Venice / .2017" target="_blank">重装上阵.Once.Upon.a.Time.in.Venice
								.2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23472.html"
						title="赢取女孩.Get.the.Girl / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/T3/ying.jpg"
							alt="赢取女孩.Get.the.Girl / .2017" title="赢取女孩.Get.the.Girl / .2017"></a>
						<p>
							<a href="/subject/23472.html" title="赢取女孩.Get.the.Girl / .2017"
								target="_blank">赢取女孩.Get.the.Girl .2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23468.html"
						title="迫害.Persecuted / .2014" target="_blank"><img height="96"
							width="68" src="http://111.73.45.49/RARBT/T3/pohai.jpg"
							alt="迫害.Persecuted / .2014" title="迫害.Persecuted / .2014"></a>
						<p>
							<a href="/subject/23468.html" title="迫害.Persecuted / .2014"
								target="_blank">迫害.Persecuted .2014</a>
						</p></li>
					<li><a class="pic" href="/subject/23466.html"
						title="真实.Real / .2017" target="_blank"><img height="96"
							width="68" src="http://111.73.45.49/RARBT/T3/zhenshi.jpg"
							alt="真实.Real / .2017" title="真实.Real / .2017"></a>
						<p>
							<a href="/subject/23466.html" title="真实.Real / .2017"
								target="_blank">真实.Real .2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23457.html"
						title="侠探西蒙.The.Saint / .2017" target="_blank"><img
							height="96" width="68" src="http://111.73.45.49/RARBT/T3/xia.jpg"
							alt="侠探西蒙.The.Saint / .2017" title="侠探西蒙.The.Saint / .2017"></a>
						<p>
							<a href="/subject/23457.html" title="侠探西蒙.The.Saint / .2017"
								target="_blank">侠探西蒙.The.Saint .2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23450.html"
						title="长城.The.Great.Wall / .2016" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/T3/chang.jpg"
							alt="长城.The.Great.Wall / .2016" title="长城.The.Great.Wall / .2016"></a>
						<p>
							<a href="/subject/23450.html" title="长城.The.Great.Wall / .2016"
								target="_blank">长城.The.Great.Wall .2016</a>
						</p></li>
					<li><a class="pic" href="/subject/23444.html"
						title="捕食.Downhill / .2016" target="_blank"><img height="96"
							width="68" src="http://111.73.45.49/RARBT/T3/bushi.jpg"
							alt="捕食.Downhill / .2016" title="捕食.Downhill / .2016"></a>
						<p>
							<a href="/subject/23444.html" title="捕食.Downhill / .2016"
								target="_blank">捕食.Downhill .2016</a>
						</p></li>
					<li><a class="pic" href="/subject/23429.html"
						title="斗牛犬之女.Pitbull.Tough.Women / .2016" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/douniu.jpg"
							alt="斗牛犬之女.Pitbull.Tough.Women / .2016"
							title="斗牛犬之女.Pitbull.Tough.Women / .2016"></a>
						<p>
							<a href="/subject/23429.html"
								title="斗牛犬之女.Pitbull.Tough.Women / .2016" target="_blank">斗牛犬之女.Pitbull.Tough.Women
								.2016</a>
						</p></li>
					<li><a class="pic" href="/subject/23424.html"
						title="假小子.The.Assignment / .2016" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/jiaxiao.jpg"
							alt="假小子.The.Assignment / .2016"
							title="假小子.The.Assignment / .2016"></a>
						<p>
							<a href="/subject/23424.html" title="假小子.The.Assignment / .2016"
								target="_blank">假小子.The.Assignment .2016</a>
						</p></li>
					<li><a class="pic" href="/subject/23411.html"
						title="悟空传.Wukong / .2017" target="_blank"><img height="96"
							width="68" src="http://111.73.45.49/RARBT/t2/wukong.jpg"
							alt="悟空传.Wukong / .2017" title="悟空传.Wukong / .2017"></a>
						<p>
							<a href="/subject/23411.html" title="悟空传.Wukong / .2017"
								target="_blank">悟空传.Wukong .2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23408.html"
						title="产前蜜月.The.Babymoon / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/chanqian.jpg"
							alt="产前蜜月.The.Babymoon / .2017" title="产前蜜月.The.Babymoon / .2017"></a>
						<p>
							<a href="/subject/23408.html" title="产前蜜月.The.Babymoon / .2017"
								target="_blank">产前蜜月.The.Babymoon .2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23404.html"
						title="殉道者杀手.Let.Me.Make.You.a.Martyr / .2015" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/xundao.jpg"
							alt="殉道者杀手.Let.Me.Make.You.a.Martyr / .2015"
							title="殉道者杀手.Let.Me.Make.You.a.Martyr / .2015"></a>
						<p>
							<a href="/subject/23404.html"
								title="殉道者杀手.Let.Me.Make.You.a.Martyr / .2015" target="_blank">殉道者杀手.Let.Me.Make.You.a.Martyr
								.2015</a>
						</p></li>
					<li><a class="pic" href="/subject/23403.html"
						title="流浪狗.Savage.Dog / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/liulg.jpg"
							alt="流浪狗.Savage.Dog / .2017" title="流浪狗.Savage.Dog / .2017"></a>
						<p>
							<a href="/subject/23403.html" title="流浪狗.Savage.Dog / .2017"
								target="_blank">流浪狗.Savage.Dog .2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23399.html"
						title="攻壳机动队真人版.Ghost.In.The.Shell / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/gonke.jpg"
							alt="攻壳机动队真人版.Ghost.In.The.Shell / .2017"
							title="攻壳机动队真人版.Ghost.In.The.Shell / .2017"></a>
						<p>
							<a href="/subject/23399.html"
								title="攻壳机动队真人版.Ghost.In.The.Shell / .2017" target="_blank">攻壳机动队真人版.Ghost.In.The.Shell
								.2017</a>
						</p></li>
					<li><a class="pic" href="/subject/23375.html"
						title="神奇女侠.Wonder.Woman / .2017" target="_blank"><img
							height="96" width="68"
							src="http://111.73.45.49/RARBT/t2/shenq.jpg"
							alt="神奇女侠.Wonder.Woman / .2017" title="神奇女侠.Wonder.Woman / .2017"></a>
						<p>
							<a href="/subject/23375.html" title="神奇女侠.Wonder.Woman / .2017"
								target="_blank">神奇女侠.Wonder.Woman .2017</a>
						</p></li>
					<div class="cl"></div>

				</ul>
				<div class="cl" style="margin: 10px 0; padding: 5px 0;">
					<!-- 广告位：728*90 -->
					<script type="text/javascript" language="javascript"
						src="http://www.rarbt.com/js/wen728_02_2.js"></script>
				</div>
			</div>
		</div>
		<!--右边-->
		<div class="mr">
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
						<ul class="lst" id="holst">
						</ul>

						<ul class="lst" id="nrlst" style="display: none">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	﻿
	<script src="http://www.rarbt.com/js/foot0.js"></script>
	<div class="footer">

		<p class="announcement">
			本站基于互联网自由分享，所有bt种子文件均来自互联网，分享于互联网，本站只作为一个bt种子暂存平台；本站服务器未保存任何影视、音乐、游戏等资源或文件，且本站并不属于bt种子的提供者、制作者、所有者，因此本站不承担任何法律责任！



		
		<p>
		<p>关于我们 | 网站帮助 | 广告合作 | 友情链接 | 网站地图 黔ICP备15014552号-2</p>
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
	<script type="text/javascript">
		var cnzz_protocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cspan id='cnzz_stat_icon_1261315582'%3E%3C/span%3E%3Cscript src='"
						+ cnzz_protocol
						+ "s4.cnzz.com/z_stat.php%3Fid%3D1261315582%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
	</script>
	
	<div class="bg-ad">
		<div class="container">
			<div class="bg-ad-left">
				<div id="leimu" class="sidebar_wo">
					<img id="audioBtn" src="http://www.5dm.tv/html/a.png" alt="雷姆"
						onmouseover="this.src='http://www.5dm.tv/html/b.png'"
						onmouseout="this.src='http://www.5dm.tv/html/a.png'">
				</div>
			</div>
			<div class="bg-ad-right">
				<div id="lamu" class="sidebar_wo">
					<img id="audioBtn" src="http://www.5dm.tv/html/c.png" alt="拉姆"
						onmouseover="this.src='http://www.5dm.tv/html/d.png'"
						onmouseout="this.src='http://www.5dm.tv/html/c.png'">
				</div>
			</div>
		</div>
	</div>
	
	<div id="updown">
		<div id="leimu" class="sidebar_wo">
			<img id="audioBtn" src="http://www.5dm.tv/html/a.png" alt="雷姆"
				onmouseover="this.src='http://www.5dm.tv/html/b.png'"
				onmouseout="this.src='http://www.5dm.tv/html/a.png'">
		</div>
		<div id="lamu" class="sidebar_wo">
			<img id="audioBtn" src="http://www.5dm.tv/html/c.png" alt="拉姆"
				onmouseover="this.src='http://www.5dm.tv/html/d.png'"
				onmouseout="this.src='http://www.5dm.tv/html/c.png'">
		</div>
	</div>
<script type="text/javascript">
	$(function() {
		$("#updown > #lamu img").eq(0).click(function() {
			$("html,body").animate({
				scrollTop : 0
			}, 800);
			return false;
		});
		$("#updown > #leimu  img").eq(0).click(function() {
			$("html,body").animate({
				scrollTop : $(document).height()
			}, 800);
			return false;
		});
	});
</script>
</body>

<script src="http://www.rarbt.com/js/foot.js"></script>
</html>
