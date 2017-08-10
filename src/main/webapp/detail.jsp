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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${cfilm.fname}:720p|1080p高清BT种子下载 - RARBT种子电影天堂</title>

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
					<a href="/" title="bt种子电影下载"><img
						src="/Public/Home/images/logo_1.png" alt="bt种子电影下载" width="196"
						height="60" /></a>
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
							type="text/javascript" src="/Public/Home/js/bds_s_v2_1.js"></script>
					</DIV>
				</div>
				<div class="hd_B">
					<div class="Btitle">
						<a href="http://www.rarbt.com/" title="电影下载">电影</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/1.html" title="动作电影">动作</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/2.html" title="战争电影">战争</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/3.html" title="剧情电影">剧情</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/4.html" title="爱情电影">爱情</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/5.html" title="科幻电影">科幻</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/6.html" title="悬疑电影">悬疑</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/7.html" title="家庭电影">家庭</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/8.html" title="犯罪电影">犯罪</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/9.html" title="恐怖电影">恐怖</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/10.html" title="动画电影">动画</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/11.html" title="喜剧电影">喜剧</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/12.html" title="惊悚电影">惊悚</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/13.html" title="冒险电影">冒险</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/category/14.html" title="电视剧电影">电视剧</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/search/index.html?area=美国" title="美国电影">美国</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/search/index.html?area=韩国" title="韩国电影">韩国</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/search/index.html?nianfen=2016"
							title="2016最新电影">2016</a>
					</div>
					<div class="Btitle">
						<a href="/index.php/search/index.html?nianfen=2015"
							title="2015最新电影">2015</a>
					</div>
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
						<a class="pic"
							title="${cfilm.fname }.${cfilm.othername}/ .${cfilm.myear}"
							href="#download"><img
							alt="${cfilm.fname }.${cfilm.othername}/ .${cfilm.myear}BT种子高清下载"
							title="${cfilm.fname }.${cfilm.othername}/ .${cfilm.myear}BT种子高清下载"
							src="${cfilm.fpic }"
							onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'"></a>
						<p class="rt" title="豆瓣评分">
							<%
								HttpSession sessions = request.getSession();
								File film = (File) sessions.getAttribute("cfilm");
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
							String dname=film.getDname();
							String[] dnames = dname.split(",");
							String aname=film.getAname();
							String[] anames = aname.split(",");
							String downlink=film.getDownlink();
							String[] downlinks = downlink.split(",");
						%>
						<li>又名:<a title="Game.of.Thrones" target="_blank"
							href="/index.php/search/index.html?youming=${cfilm.othername }">${cfilm.othername }</a></li>
						<li>标签:<%for(int i=0;i<tidss.length;i++){%><a title="动作" target="_blank"
							href="/index.php/search/index.html?biaoqian=<%=tidss[i]%>"><%=tidss[i]%></a><%}%>
						</li>
						<li>地区:<%for(int i=0;i<countrys.length;i++){%><a title="<%=countrys[i]%>" target="_blank"
							href="/index.php/search/index.html?area=<%=countrys[i]%>"><%=countrys[i]%></a><%}%></li>
						<li>年份:<a title="2017" target="_blank"
							href="/index.php/search/index.html?nianfen=2017">${cfilm.myear}</a></li>
						<li>导演:<%for(int i=0;i<dnames.length;i++){%><a title="<%=dnames[i]%>" target="_blank"
							href="/index.php/search/index.html?daoyan=<%=dnames[i]%>"><%=dnames[i]%></a><%}%></li>
						<li>主演:<%for(int i=0;i<anames.length;i++){%><a title="<%=anames[i]%>" target="_blank"
							href="/index.php/search/index.html?zhuyan=<%=anames[i]%>"><%=anames[i]%></a><%}%></li>
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
					<br/>	<span
						style="float: right; color: #ff0000; font-weight: normal; font-size: 12px;">搜索
						<a
						href="http://www.zimuku.net/search?ad=1&q=${cfilm.fname}${cfilm.othername}"
						target="_blank" rel="nofollow">${cfilm.fname}${cfilm.othername}</a>
						外挂字幕
					</span>
				</h3>
				<div class="sl cl">
					<div class="slad"></div>
					<%for(int i=0;i<(downlinks.length)/2;i++){%>
					<div class="tinfo">
						<a href="<%=downlinks[i*2+1]%>"
							title="${cfilm.fname }"
							target="_blank"><p class="torrent">
								<img border="0" src="/Public/Home/picture/torrent_1.gif"
									style="vertical-align: middle"
									alt="${cfilm.fname }.${cfilm.othername}"> 本地下载.<em><%=downlinks[i*2]%></em>.torrent
							</p></a>
						<ul class="btTree treeview">
							<li><span class="video">${cfilm.fname }${cfilm.othername }.S07E01.1080p.WEB.h264-中英双字-RARBT.mp4</span></li>
						</ul>
					</div>
					<%}%>
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
					<img id="aimg_Y5f5Q" class="zoom"
						file="${cfilm.beizhu}" lazyloadthumb="1"
						border="0" alt="" src="${cfilm.beizhu}"
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
							<img src="/Public/Home/picture/recommended_1.gif" alt="推荐下载">
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
							<li>
								<div class="img">
									<a href="/subject/21950.html" title="机械师2：复活" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-07-27/【rarbt中文站】【rarbt.com】机械师2复活.jpg"
										alt="机械师2：复活/Mechanic: Resurrection.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/21950.html" title="机械师2：复活" target="_blank">机械师2：复活/Mechanic:
										Resurrection.2016</a> <span class="allstar40"></span>8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/21856.html" title="大鱼海棠" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-07-14/【rarbt中文站】【rarbt.com】大鱼海棠.jpg"
										alt="大鱼海棠/大海.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/21856.html" title="大鱼海棠" target="_blank">大鱼海棠/大海.2016</a>
									<span class="allstar35"></span>6.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/859.html" title="渎职" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/duzhi1.jpg"
										alt="渎职/Misconduct.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/859.html" title="渎职" target="_blank">渎职/Misconduct.2016</a>
									<span class="allstar25"></span>5.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/1006.html" title="死囚大逃杀2" target="_blank"><img
										width="30" height="45"
										src="/btzhong/tupian/04Jan2016222915227.jpg"
										alt="死囚大逃杀2/The Condemned 2.2015"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/1006.html" title="死囚大逃杀2" target="_blank">死囚大逃杀2/The
										Condemned 2.2015</a> <span class="allstar20"></span>4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22816.html"
										title="行尸走肉 第七季第14集.The.Walking.Dead" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/SHI1.jpg"
										alt="行尸走肉 第七季第14集.The.Walking.Dead/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22816.html"
										title="行尸走肉 第七季第14集.The.Walking.Dead" target="_blank">行尸走肉
										第七季第14集.The.Walking.Dead/.2016</a> <span class="allstar45"></span>8.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22815.html" title="刺客信条.Assassins.Creed"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/cike.jpg"
										alt="刺客信条.Assassins.Creed/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22815.html" title="刺客信条.Assassins.Creed"
										target="_blank">刺客信条.Assassins.Creed/.2016</a> <span
										class="allstar30"></span>5.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22817.html" title="花开莱州.Bloom.Laizhou"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/HKLZ.jpg"
										alt="花开莱州.Bloom.Laizhou/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22817.html" title="花开莱州.Bloom.Laizhou"
										target="_blank">花开莱州.Bloom.Laizhou/.2016</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22818.html" title="致青春.原来你还在这里.Never.Gone"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/ZQC.jpg"
										alt="致青春.原来你还在这里.Never.Gone/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22818.html" title="致青春.原来你还在这里.Never.Gone"
										target="_blank">致青春.原来你还在这里.Never.Gone/.2016</a> <span
										class="allstar20"></span>4.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22819.html" title="沉默.Silence"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/CM.jpg"
										alt="沉默.Silence/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22819.html" title="沉默.Silence"
										target="_blank">沉默.Silence/.2016</a> <span class="allstar40"></span>7.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22877.html"
										title="吐槽大会.第10期.Roast.2017.03.26" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/tu4.jpg"
										alt="吐槽大会.第10期.Roast.2017.03.26/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22877.html"
										title="吐槽大会.第10期.Roast.2017.03.26" target="_blank">吐槽大会.第10期.Roast.2017.03.26/.2017</a>
									<span class="allstar35"></span>7.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/1927.html" title="黑海夺金" target="_blank"><img
										width="30" height="45"
										src="/btzhong/tupian/02Mar20151335091220.jpg"
										alt="黑海夺金/Black Sea.2014"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/1927.html" title="黑海夺金" target="_blank">黑海夺金/Black
										Sea.2014</a> <span class="allstar35"></span>7.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/2570.html" title="银河护卫队" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-07-07/【rarbt中文站】【rarbt.com】银河护卫队.jpg"
										alt="银河护卫队/Guardians of the Galaxy.2014"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/2570.html" title="银河护卫队" target="_blank">银河护卫队/Guardians
										of the Galaxy.2014</a> <span class="allstar40"></span>8.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22276.html" title="小修女" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-10-19/【rarbt中文站】【rarbt.com】小修女.jpg"
										alt="小修女/Little Sister.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22276.html" title="小修女" target="_blank">小修女/Little
										Sister.2016</a> <span class="allstar30"></span>6.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22909.html" title="契克.Tschick"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/qk.jpg"
										alt="契克.Tschick/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22909.html" title="契克.Tschick"
										target="_blank">契克.Tschick/.2016</a> <span class="allstar40"></span>7.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22910.html" title="悍女.Brimstone"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/hn.jpg"
										alt="悍女.Brimstone/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22910.html" title="悍女.Brimstone"
										target="_blank">悍女.Brimstone/.2016</a> <span class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22361.html" title="他们叫我吉克" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-11-16/【rarbt中文站】【rarbt.com】他们叫我吉克.jpg"
										alt="他们叫我吉克/Lo chiamavano Jeeg Robot.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22361.html" title="他们叫我吉克" target="_blank">他们叫我吉克/Lo
										chiamavano Jeeg Robot.2016</a> <span class="allstar35"></span>6.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22840.html" title="吐槽大会.第7期.Roast.2017.03.05"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/tu4.jpg"
										alt="吐槽大会.第7期.Roast.2017.03.05/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22840.html" title="吐槽大会.第7期.Roast.2017.03.05"
										target="_blank">吐槽大会.第7期.Roast.2017.03.05/.2016</a> <span
										class="allstar35"></span>7.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22907.html" title="血汗金钱.Blood.Money"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/xxjq.jpg"
										alt="血汗金钱.Blood.Money/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22907.html" title="血汗金钱.Blood.Money"
										target="_blank">血汗金钱.Blood.Money/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22908.html" title="永远闪耀.Always.Shine"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/yysy.jpg"
										alt="永远闪耀.Always.Shine/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22908.html" title="永远闪耀.Always.Shine"
										target="_blank">永远闪耀.Always.Shine/.2016</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23012.html" title="越狱.第五季第3集.Prison.Break"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:80/RARBT/t2/yueyu.jpg"
										alt="越狱.第五季第3集.Prison.Break/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23012.html" title="越狱.第五季第3集.Prison.Break"
										target="_blank">越狱.第五季第3集.Prison.Break/.2017</a> <span
										class="allstar45"></span>9.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/21336.html" title="信任" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-04-09/【rarbt中文站】【rarbt.com】信任.jpg"
										alt="信任/The Trust.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/21336.html" title="信任" target="_blank">信任/The
										Trust.2016</a> <span class="allstar30"></span>5.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22371.html" title="中国版捉迷藏.Hide and Seek"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/ZMC.jpg"
										alt="中国版捉迷藏.Hide and Seek/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22371.html" title="中国版捉迷藏.Hide and Seek"
										target="_blank">中国版捉迷藏.Hide and Seek/.2016</a> <span
										class="allstar30"></span>5.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22372.html" title="斯诺登/斯诺登风暴.Snowden"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/SLD.jpg"
										alt="斯诺登/斯诺登风暴.Snowden/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22372.html" title="斯诺登/斯诺登风暴.Snowden"
										target="_blank">斯诺登/斯诺登风暴.Snowden/.2016</a> <span
										class="allstar40"></span>7.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22373.html" title="屏住呼吸/禁室杀戮.Don't Breathe"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/BZHX.jpg"
										alt="屏住呼吸/禁室杀戮.Don't Breathe/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22373.html" title="屏住呼吸/禁室杀戮.Don't Breathe"
										target="_blank">屏住呼吸/禁室杀戮.Don't Breathe/.2016</a> <span
										class="allstar35"></span>7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22447.html" title="会计刺客.The.Accountant"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/KJ.jpg"
										alt="会计刺客.The.Accountant/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22447.html" title="会计刺客.The.Accountant"
										target="_blank">会计刺客.The.Accountant/.2016</a> <span
										class="allstar35"></span>7.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22450.html"
										title="辣警霸王花.Special.Female.Force" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/LJ.jpg"
										alt="辣警霸王花.Special.Female.Force/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22450.html"
										title="辣警霸王花.Special.Female.Force" target="_blank">辣警霸王花.Special.Female.Force/.2016</a>
									<span class="allstar20"></span>4.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22501.html" title="婆罗门纳曼.Brahman.Naman"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/PLM.jpg"
										alt="婆罗门纳曼.Brahman.Naman/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22501.html" title="婆罗门纳曼.Brahman.Naman"
										target="_blank">婆罗门纳曼.Brahman.Naman/.2016</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22502.html" title="阿尔塔米拉.Finding.Altamira"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/AET.jpg"
										alt="阿尔塔米拉.Finding.Altamira/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22502.html" title="阿尔塔米拉.Finding.Altamira"
										target="_blank">阿尔塔米拉.Finding.Altamira/.2016</a> <span
										class="allstar35"></span>6.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22503.html"
										title="隧道尽头.At.The.End.Of.The.Tunnel" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/SDJT.jpg"
										alt="隧道尽头.At.The.End.Of.The.Tunnel/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22503.html"
										title="隧道尽头.At.The.End.Of.The.Tunnel" target="_blank">隧道尽头.At.The.End.Of.The.Tunnel/.2016</a>
									<span class="allstar35"></span>7.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22504.html" title="【高分高口碑！力荐！】驴得水.Mr.Donkey"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/LDS.jpg"
										alt="【高分高口碑！力荐！】驴得水.Mr.Donkey/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22504.html" title="【高分高口碑！力荐！】驴得水.Mr.Donkey"
										target="_blank">【高分高口碑！力荐！】驴得水.Mr.Donkey/.2016</a> <span
										class="allstar40"></span>8.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22700.html" title="奇异博士" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/201611/qybs.jpg"
										alt="奇异博士/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22700.html" title="奇异博士" target="_blank">奇异博士/.2016</a>
									<span class="allstar40"></span>7.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22876.html" title="特朗普：如何成为美国最招黑的政治家"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/TPN.jpg"
										alt="特朗普：如何成为美国最招黑的政治家/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22876.html" title="特朗普：如何成为美国最招黑的政治家"
										target="_blank">特朗普：如何成为美国最招黑的政治家/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22911.html" title="萤火奇兵.Lighting.Dindin"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/yhqb.jpg"
										alt="萤火奇兵.Lighting.Dindin/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22911.html" title="萤火奇兵.Lighting.Dindin"
										target="_blank">萤火奇兵.Lighting.Dindin/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22912.html" title="黑暗的幽灵.Ghosts.of.Darkness"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/youling.jpg"
										alt="黑暗的幽灵.Ghosts.of.Darkness/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22912.html" title="黑暗的幽灵.Ghosts.of.Darkness"
										target="_blank">黑暗的幽灵.Ghosts.of.Darkness/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22913.html" title="黑暗中的恶魔.Devil.in.the.Dark"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/emo.jpg"
										alt="黑暗中的恶魔.Devil.in.the.Dark/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22913.html" title="黑暗中的恶魔.Devil.in.the.Dark"
										target="_blank">黑暗中的恶魔.Devil.in.the.Dark/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22915.html" title="别敲两次门.Dont.Knock.Twice"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/bieqiao.jpg"
										alt="别敲两次门.Dont.Knock.Twice/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22915.html" title="别敲两次门.Dont.Knock.Twice"
										target="_blank">别敲两次门.Dont.Knock.Twice/.2016</a> <span
										class="allstar25"></span>5.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22970.html" title="山谷沟渠.Valley.of.Ditches"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t2/SGGQ.jpg"
										alt="山谷沟渠.Valley.of.Ditches/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22970.html" title="山谷沟渠.Valley.of.Ditches"
										target="_blank">山谷沟渠.Valley.of.Ditches/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23026.html"
										title="金刚.骷髅岛.Kong.Skull.Island(WEB)" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49:80/RARBT/t2/jingang.jpg"
										alt="金刚.骷髅岛.Kong.Skull.Island(WEB)/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23026.html"
										title="金刚.骷髅岛.Kong.Skull.Island(WEB)" target="_blank">金刚.骷髅岛.Kong.Skull.Island(WEB)/.2017</a>
									<span class="allstar35"></span>6.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23428.html" title="承诺.The.Promise"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/chengnuo.jpg"
										alt="承诺.The.Promise/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23428.html" title="承诺.The.Promise"
										target="_blank">承诺.The.Promise/.2016</a> <span
										class="allstar30"></span>6.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22007.html" title="X特遣队" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-08-08/【rarbt中文站】【rarbt.com】X特遣队.jpg"
										alt="X特遣队/Suicide Squad.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22007.html" title="X特遣队" target="_blank">X特遣队/Suicide
										Squad.2016</a> <span class="allstar35"></span>7.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22338.html" title="奇异博士" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-11-07/【rarbt中文站】【rarbt.com】p2388501883.rarbt_副本.jpg"
										alt="奇异博士/Doctor Strange.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22338.html" title="奇异博士" target="_blank">奇异博士/Doctor
										Strange.2016</a> <span class="allstar40"></span>8.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22360.html" title="白昼之雨" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-11-16/【rarbt中文站】【rarbt.com】白昼之雨.jpg"
										alt="白昼之雨/ヒメアノ～ル.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22360.html" title="白昼之雨" target="_blank">白昼之雨/ヒメアノ～ル.2016</a>
									<span class="allstar35"></span>7.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22362.html" title="修剪草坪的小黄人 " target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-11-16/【rarbt中文站】【rarbt.com】81rhTsgRR7L.jpg"
										alt="修剪草坪的小黄人 /Mower Minions.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22362.html" title="修剪草坪的小黄人 " target="_blank">修剪草坪的小黄人
										/Mower Minions.2016</a> <span class="allstar35"></span>7.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22365.html" title="新木偶奇遇记" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/muou.jpg"
										alt="新木偶奇遇记/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22365.html" title="新木偶奇遇记" target="_blank">新木偶奇遇记/.2016</a>
									<span class="allstar15"></span>2.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22364.html" title="新异形" target="_blank"><img
										width="30" height="45"
										src="/Uploads/2016-11-16/【rarbt中文站】【rarbt.com】新异形.jpg"
										alt="新异形/Alienate.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22364.html" title="新异形" target="_blank">新异形/Alienate.2016</a>
									<span class="allstar15"></span>3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22366.html" title="枕边有张脸2" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/zb.jpg"
										alt="枕边有张脸2/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22366.html" title="枕边有张脸2" target="_blank">枕边有张脸2/.2016</a>
									<span class="allstar25"></span>4.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22374.html" title="赴汤蹈火.Hell or High Water"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/FTDH.jpg"
										alt="赴汤蹈火.Hell or High Water/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22374.html" title="赴汤蹈火.Hell or High Water"
										target="_blank">赴汤蹈火.Hell or High Water/.2016</a> <span
										class="allstar40"></span>7.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22375.html"
										title="死亡复苏：终极游戏.Dead Rising: Endgame" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/SWFS.jpg"
										alt="死亡复苏：终极游戏.Dead Rising: Endgame/丧尸围城3：终极游戏.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22375.html"
										title="死亡复苏：终极游戏.Dead Rising: Endgame" target="_blank">死亡复苏：终极游戏.Dead
										Rising: Endgame/丧尸围城3：终极游戏.2016</a> <span class="allstar20"></span>4.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22376.html" title="幽灵医院.CarrieInperiue"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/ylyy.jpg"
										alt="幽灵医院.CarrieInperiue/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22376.html" title="幽灵医院.CarrieInperiue"
										target="_blank">幽灵医院.CarrieInperiue/.2016</a> <span
										class="allstar10"></span>2.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22377.html" title="别犹豫.Don't Think Twice"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/BYY.jpg"
										alt="别犹豫.Don't Think Twice/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22377.html" title="别犹豫.Don't Think Twice"
										target="_blank">别犹豫.Don't Think Twice/.2016</a> <span
										class="allstar40"></span>7.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22378.html" title="彼得的龙.Pete's Dragon"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/BDDL.jpg"
										alt="彼得的龙.Pete's Dragon/寻龙传说/妙妙龙.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22378.html" title="彼得的龙.Pete's Dragon"
										target="_blank">彼得的龙.Pete's Dragon/寻龙传说/妙妙龙.2016</a> <span
										class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22443.html" title="XOXO" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/XOXO.jpg"
										alt="XOXO/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22443.html" title="XOXO" target="_blank">XOXO/.2016</a>
									<span class="allstar30"></span>5.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22444.html" title="麦兜·饭宝奇兵" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/MD.jpg"
										alt="麦兜·饭宝奇兵/麦兜·麦露宝.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22444.html" title="麦兜·饭宝奇兵" target="_blank">麦兜·饭宝奇兵/麦兜·麦露宝.2016</a>
									<span class="allstar30"></span>6.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22445.html" title="毁灭者.Eliminators"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/HMZ.jpg"
										alt="毁灭者.Eliminators/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22445.html" title="毁灭者.Eliminators"
										target="_blank">毁灭者.Eliminators/.2016</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22446.html" title="摩根.Morgan" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/MGG.jpg"
										alt="摩根.Morgan/魔诡.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22446.html" title="摩根.Morgan" target="_blank">摩根.Morgan/魔诡.2016</a>
									<span class="allstar30"></span>6.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22448.html"
										title="母亲的双眼.The.Eyes.of.My.Mother" target="_blank"><img
										width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/MQ.jpg"
										alt="母亲的双眼.The.Eyes.of.My.Mother/吾母之眼.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22448.html"
										title="母亲的双眼.The.Eyes.of.My.Mother" target="_blank">母亲的双眼.The.Eyes.of.My.Mother/吾母之眼.2016</a>
									<span class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22452.html" title="萨利机长.Sully"
										target="_blank"><img width="30" height="45"
										src="http://122.228.200.55:8082/fujian1/SL.jpg"
										alt="萨利机长.Sully/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22452.html" title="萨利机长.Sully"
										target="_blank">萨利机长.Sully/.2016</a> <span class="allstar40"></span>8.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22696.html" title="杠上开花.So.Luckly"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/GSKH.jpg"
										alt="杠上开花.So.Luckly/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22696.html" title="杠上开花.So.Luckly"
										target="_blank">杠上开花.So.Luckly/.2016</a> <span
										class="allstar20"></span>4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22697.html" title="爱上试睡师.Good.Night"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/SSS.jpg"
										alt="爱上试睡师.Good.Night/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22697.html" title="爱上试睡师.Good.Night"
										target="_blank">爱上试睡师.Good.Night/.2016</a> <span
										class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/22698.html" title="海洋奇缘.Moana"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49:8090/RARBT/t1/HYQY.jpg"
										alt="海洋奇缘.Moana/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/22698.html" title="海洋奇缘.Moana"
										target="_blank">海洋奇缘.Moana/.2016</a> <span class="allstar40"></span>7.7
								</div>
							</li>
						</ul>

						<ul class="lst" id="nrlst" style="display: none">
							<li>
								<div class="img">
									<a href="/subject/23475.html" title="记忆大师 Battle.Of.Memories"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/jiyi.jpg"
										alt="记忆大师 Battle.Of.Memories/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23475.html" title="记忆大师 Battle.Of.Memories"
										target="_blank">记忆大师 Battle.Of.Memories/.2017</a> <span
										class="allstar35"></span>7.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23474.html"
										title="重装上阵.Once.Upon.a.Time.in.Venice" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/zhong.jpg"
										alt="重装上阵.Once.Upon.a.Time.in.Venice/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23474.html"
										title="重装上阵.Once.Upon.a.Time.in.Venice" target="_blank">重装上阵.Once.Upon.a.Time.in.Venice/.2017</a>
									<span class="allstar25"></span>5.5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23473.html"
										title="两个爱人和一只熊.Two.Lovers.and.a.Bear" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/liang.jpg"
										alt="两个爱人和一只熊.Two.Lovers.and.a.Bear/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23473.html"
										title="两个爱人和一只熊.Two.Lovers.and.a.Bear" target="_blank">两个爱人和一只熊.Two.Lovers.and.a.Bear/.2016</a>
									<span class="allstar30"></span>6.5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23472.html" title="赢取女孩.Get.the.Girl"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/ying.jpg"
										alt="赢取女孩.Get.the.Girl/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23472.html" title="赢取女孩.Get.the.Girl"
										target="_blank">赢取女孩.Get.the.Girl/.2017</a> <span
										class="allstar20"></span>4.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23471.html" title="永恒生活.Life.Eternal"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/yong.jpg"
										alt="永恒生活.Life.Eternal/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23471.html" title="永恒生活.Life.Eternal"
										target="_blank">永恒生活.Life.Eternal/.2016</a> <span
										class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23470.html"
										title="真谛存星空.The.Truth.is.in.the.Stars" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/zhendi.jpg"
										alt="真谛存星空.The.Truth.is.in.the.Stars/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23470.html"
										title="真谛存星空.The.Truth.is.in.the.Stars" target="_blank">真谛存星空.The.Truth.is.in.the.Stars/.2017</a>
									<span class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23469.html" title="疼痛.Anguish"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/tongku.jpg"
										alt="疼痛.Anguish/.2015"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23469.html" title="疼痛.Anguish"
										target="_blank">疼痛.Anguish/.2015</a> <span class="allstar20"></span>4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23468.html" title="迫害.Persecuted"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/pohai.jpg"
										alt="迫害.Persecuted/.2014"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23468.html" title="迫害.Persecuted"
										target="_blank">迫害.Persecuted/.2014</a> <span
										class="allstar20"></span>4.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23467.html" title="再见，在也不见.Distance"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/zai.jpg"
										alt="再见，在也不见.Distance/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23467.html" title="再见，在也不见.Distance"
										target="_blank">再见，在也不见.Distance/.2017</a> <span
										class="allstar25"></span>5.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23466.html" title="真实.Real" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/zhenshi.jpg"
										alt="真实.Real/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23466.html" title="真实.Real" target="_blank">真实.Real/.2017</a>
									<span class="allstar30"></span>6.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23465.html" title="借眼.Through.The.Eye"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/jieyan.jpg"
										alt="借眼.Through.The.Eye/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23465.html" title="借眼.Through.The.Eye"
										target="_blank">借眼.Through.The.Eye/.2017</a> <span
										class="allstar20"></span>4.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23464.html" title="死而复生.Simple.Creature"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/sier.jpg"
										alt="死而复生.Simple.Creature/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23464.html" title="死而复生.Simple.Creature"
										target="_blank">死而复生.Simple.Creature/.2017</a> <span
										class="allstar20"></span>4.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23463.html" title="破碎我心.You.Get.Me"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/posui.jpg"
										alt="破碎我心.You.Get.Me/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23463.html" title="破碎我心.You.Get.Me"
										target="_blank">破碎我心.You.Get.Me/.2016</a> <span
										class="allstar20"></span>4.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23462.html"
										title="它住在阁楼上.It.Lives.in.the.Attic" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/tazhu.jpg"
										alt="它住在阁楼上.It.Lives.in.the.Attic/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23462.html"
										title="它住在阁楼上.It.Lives.in.the.Attic" target="_blank">它住在阁楼上.It.Lives.in.the.Attic/.2016</a>
									<span class="allstar15"></span>3.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23461.html" title="她唇之下.Below.Her.Mouth"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/tachun.jpg"
										alt="她唇之下.Below.Her.Mouth/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23461.html" title="她唇之下.Below.Her.Mouth"
										target="_blank">她唇之下.Below.Her.Mouth/.2016</a> <span
										class="allstar25"></span>5.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23460.html" title="德惠翁主.The.Last.Princess"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/dehui.jpg"
										alt="德惠翁主.The.Last.Princess/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23460.html" title="德惠翁主.The.Last.Princess"
										target="_blank">德惠翁主.The.Last.Princess/.2016</a> <span
										class="allstar35"></span>7.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23459.html" title="八月的雾.Nebel.im.Audehuist"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/bayue.jpg"
										alt="八月的雾.Nebel.im.Audehuist/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23459.html" title="八月的雾.Nebel.im.Audehuist"
										target="_blank">八月的雾.Nebel.im.Audehuist/.2016</a> <span
										class="allstar35"></span>7.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23446.html"
										title="权力的游戏.第七季第2集.Game.of.Thrones" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/quan.jpg"
										alt="权力的游戏.第七季第2集.Game.of.Thrones/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23446.html"
										title="权力的游戏.第七季第2集.Game.of.Thrones" target="_blank">权力的游戏.第七季第2集.Game.of.Thrones/.2017</a>
									<span class="allstar45"></span>9.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23458.html"
										title="生化危机：复仇.Resident.Evil.Vendetta" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/sh.jpg"
										alt="生化危机：复仇.Resident.Evil.Vendetta/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23458.html"
										title="生化危机：复仇.Resident.Evil.Vendetta" target="_blank">生化危机：复仇.Resident.Evil.Vendetta/.2017</a>
									<span class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23457.html" title="侠探西蒙.The.Saint"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/xia.jpg"
										alt="侠探西蒙.The.Saint/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23457.html" title="侠探西蒙.The.Saint"
										target="_blank">侠探西蒙.The.Saint/.2017</a> <span
										class="allstar30"></span>6.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23456.html" title="骨瘦如柴.To.the.Bone"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/gu.jpg"
										alt="骨瘦如柴.To.the.Bone/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23456.html" title="骨瘦如柴.To.the.Bone"
										target="_blank">骨瘦如柴.To.the.Bone/.2017</a> <span
										class="allstar30"></span>6.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23455.html" title="忠爱无言.Love.Without.Word"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/zhong.jpg"
										alt="忠爱无言.Love.Without.Word/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23455.html" title="忠爱无言.Love.Without.Word"
										target="_blank">忠爱无言.Love.Without.Word/.2017</a> <span
										class="allstar35"></span>7.3
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23454.html" title="世界之外.The.Space.Between.Us"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/shijie.jpg"
										alt="世界之外.The.Space.Between.Us/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23454.html" title="世界之外.The.Space.Between.Us"
										target="_blank">世界之外.The.Space.Between.Us/.2017</a> <span
										class="allstar30"></span>6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23453.html" title="复生实验.Realive"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/fusheng.jpg"
										alt="复生实验.Realive/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23453.html" title="复生实验.Realive"
										target="_blank">复生实验.Realive/.2016</a> <span class="allstar25"></span>5.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23452.html" title="仙球大战.Soccer Killer"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/xianqiu.jpg"
										alt="仙球大战.Soccer Killer/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23452.html" title="仙球大战.Soccer Killer"
										target="_blank">仙球大战.Soccer Killer/.2017</a> <span
										class="allstar10"></span>2.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23451.html"
										title="功夫小兔侠.Kungfu.Little.Rabbit" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/gongfu.jpg"
										alt="功夫小兔侠.Kungfu.Little.Rabbit/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23451.html"
										title="功夫小兔侠.Kungfu.Little.Rabbit" target="_blank">功夫小兔侠.Kungfu.Little.Rabbit/.2017</a>
									<span class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23450.html" title="长城.The.Great.Wall"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/chang.jpg"
										alt="长城.The.Great.Wall/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23450.html" title="长城.The.Great.Wall"
										target="_blank">长城.The.Great.Wall/.2016</a> <span
										class="allstar20"></span>4.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23449.html" title="生活天平.The.Levelling"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/sheng.jpg"
										alt="生活天平.The.Levelling/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23449.html" title="生活天平.The.Levelling"
										target="_blank">生活天平.The.Levelling/.2017</a> <span
										class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23448.html" title="我的名字是连尼.My.Name.Is.Lenny"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/wo.jpg"
										alt="我的名字是连尼.My.Name.Is.Lenny/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23448.html" title="我的名字是连尼.My.Name.Is.Lenny"
										target="_blank">我的名字是连尼.My.Name.Is.Lenny/.2017</a> <span
										class="allstar35"></span>7.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23447.html" title="解冻.Bluebeard"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/jie.jpg"
										alt="解冻.Bluebeard/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23447.html" title="解冻.Bluebeard"
										target="_blank">解冻.Bluebeard/.2017</a> <span class="allstar30"></span>6.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23445.html"
										title="美女与野兽.Beauty.and.the.Beast" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/mei.jpg"
										alt="美女与野兽.Beauty.and.the.Beast/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23445.html"
										title="美女与野兽.Beauty.and.the.Beast" target="_blank">美女与野兽.Beauty.and.the.Beast/.2017</a>
									<span class="allstar35"></span>7.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23444.html" title="捕食.Downhill"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/bushi.jpg"
										alt="捕食.Downhill/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23444.html" title="捕食.Downhill"
										target="_blank">捕食.Downhill/.2016</a> <span class="allstar15"></span>3.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23443.html" title="清醒的时刻.Moments.of.Clarity"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/qing.jpg"
										alt="清醒的时刻.Moments.of.Clarity/.2015"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23443.html" title="清醒的时刻.Moments.of.Clarity"
										target="_blank">清醒的时刻.Moments.of.Clarity/.2015</a> <span
										class="allstar30"></span>6.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23442.html" title="爱爱囧事2.Love embarrassed"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/aiai.jpg"
										alt="爱爱囧事2.Love embarrassed/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23442.html" title="爱爱囧事2.Love embarrassed"
										target="_blank">爱爱囧事2.Love embarrassed/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23441.html" title="铁甲战神.Revolt"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/tie.jpg"
										alt="铁甲战神.Revolt/.2013"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23441.html" title="铁甲战神.Revolt"
										target="_blank">铁甲战神.Revolt/.2013</a> <span class="allstar25"></span>5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23440.html" title="逃出绝命镇.Get.Out"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/tao.jpg"
										alt="逃出绝命镇.Get.Out/."
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23440.html" title="逃出绝命镇.Get.Out"
										target="_blank">逃出绝命镇.Get.Out/.</a> <span class="allstar35"></span>7.5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23439.html" title="新娘.NevesTa"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/xin.jpg"
										alt="新娘.NevesTa/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23439.html" title="新娘.NevesTa"
										target="_blank">新娘.NevesTa/.2017</a> <span class="allstar20"></span>4.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23438.html" title="五月一号.First.of.May"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/51.jpg"
										alt="五月一号.First.of.May/.2015"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23438.html" title="五月一号.First.of.May"
										target="_blank">五月一号.First.of.May/.2015</a> <span
										class="allstar30"></span>6.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23437.html" title="王者.The.King"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/wangzhe.jpg"
										alt="王者.The.King/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23437.html" title="王者.The.King"
										target="_blank">王者.The.King/.2017</a> <span class="allstar35"></span>7.4
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23436.html" title="寻找奥斯丁.Austin.Found"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/xunzhaoa.jpg"
										alt="寻找奥斯丁.Austin.Found/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23436.html" title="寻找奥斯丁.Austin.Found"
										target="_blank">寻找奥斯丁.Austin.Found/.2017</a> <span
										class="allstar25"></span>5.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23435.html" title="荣誉传承.Tommys.Honour"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/rongyu.jpg"
										alt="荣誉传承.Tommys.Honour/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23435.html" title="荣誉传承.Tommys.Honour"
										target="_blank">荣誉传承.Tommys.Honour/.2016</a> <span
										class="allstar25"></span>5.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23434.html" title="梦幻佳期.Dream.Holiday"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/T3/menghuan.jpg"
										alt="梦幻佳期.Dream.Holiday/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23434.html" title="梦幻佳期.Dream.Holiday"
										target="_blank">梦幻佳期.Dream.Holiday/.2017</a> <span
										class="allstar15"></span>3.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23433.html" title="伯斯特的心.Busters.Mal.Heart"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/bosite.jpg"
										alt="伯斯特的心.Busters.Mal.Heart/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23433.html" title="伯斯特的心.Busters.Mal.Heart"
										target="_blank">伯斯特的心.Busters.Mal.Heart/.2016</a> <span
										class="allstar20"></span>4.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23432.html" title="希科克.Hickok"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/xikeke.jpg"
										alt="希科克.Hickok/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23432.html" title="希科克.Hickok"
										target="_blank">希科克.Hickok/.2017</a> <span class="allstar25"></span>5.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23431.html" title="玉子.Okja" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/yuzi.jpg"
										alt="玉子.Okja/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23431.html" title="玉子.Okja" target="_blank">玉子.Okja/.2017</a>
									<span class="allstar30"></span>6.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23430.html" title="吃吃的爱.Didis.Dream"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/chi1.jpg"
										alt="吃吃的爱.Didis.Dream/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23430.html" title="吃吃的爱.Didis.Dream"
										target="_blank">吃吃的爱.Didis.Dream/.2017</a> <span
										class="allstar30"></span>6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23421.html" title="新木乃伊.The.Mummy"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/xinmu.jpg"
										alt="新木乃伊.The.Mummy/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23421.html" title="新木乃伊.The.Mummy"
										target="_blank">新木乃伊.The.Mummy/.2017</a> <span
										class="allstar20"></span>4.8
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23429.html" title="斗牛犬之女.Pitbull.Tough.Women"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/douniu.jpg"
										alt="斗牛犬之女.Pitbull.Tough.Women/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23429.html" title="斗牛犬之女.Pitbull.Tough.Women"
										target="_blank">斗牛犬之女.Pitbull.Tough.Women/.2016</a> <span
										class="allstar30"></span>6.6
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23428.html" title="承诺.The.Promise"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/chengnuo.jpg"
										alt="承诺.The.Promise/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23428.html" title="承诺.The.Promise"
										target="_blank">承诺.The.Promise/.2016</a> <span
										class="allstar30"></span>6.2
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23427.html" title="邪.Another.Evil"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/xie.jpg"
										alt="邪.Another.Evil/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23427.html" title="邪.Another.Evil"
										target="_blank">邪.Another.Evil/.2016</a> <span
										class="allstar25"></span>5.7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23426.html"
										title="碟仙之毕业照.The.Haunted.Graduation.Photo" target="_blank"><img
										width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/diebi.jpg"
										alt="碟仙之毕业照.The.Haunted.Graduation.Photo/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23426.html"
										title="碟仙之毕业照.The.Haunted.Graduation.Photo" target="_blank">碟仙之毕业照.The.Haunted.Graduation.Photo/.2017</a>
									<span class="allstar10"></span>2.1
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23425.html" title="圆圈.The.Circle"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/yuanquan.jpg"
										alt="圆圈.The.Circle/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23425.html" title="圆圈.The.Circle"
										target="_blank">圆圈.The.Circle/.2017</a> <span
										class="allstar25"></span>5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23424.html" title="假小子.The.Assignment"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/jiaxiao.jpg"
										alt="假小子.The.Assignment/.2016"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23424.html" title="假小子.The.Assignment"
										target="_blank">假小子.The.Assignment/.2016</a> <span
										class="allstar20"></span>4.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23423.html" title="美好的意外.Youth.Dinner"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/meihaoy.jpg"
										alt="美好的意外.Youth.Dinner/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23423.html" title="美好的意外.Youth.Dinner"
										target="_blank">美好的意外.Youth.Dinner/.2017</a> <span
										class="allstar25"></span>5.5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23422.html" title="水神娃.Shui.Shen.Wa"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/shuiwa.jpg"
										alt="水神娃.Shui.Shen.Wa/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23422.html" title="水神娃.Shui.Shen.Wa"
										target="_blank">水神娃.Shui.Shen.Wa/.2017</a> <span
										class="allstar05"></span>0
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23411.html" title="悟空传.Wukong"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/wukong.jpg"
										alt="悟空传.Wukong/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23411.html" title="悟空传.Wukong"
										target="_blank">悟空传.Wukong/.2017</a> <span class="allstar25"></span>5.5
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23420.html" title="前爱国者.ExPatriot"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/qianai.jpg"
										alt="前爱国者.ExPatriot/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23420.html" title="前爱国者.ExPatriot"
										target="_blank">前爱国者.ExPatriot/.2017</a> <span
										class="allstar20"></span>4.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23419.html" title="末世肉体.We.Are.the.Flesh"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/morou.jpg"
										alt="末世肉体.We.Are.the.Flesh/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23419.html" title="末世肉体.We.Are.the.Flesh"
										target="_blank">末世肉体.We.Are.the.Flesh/.2017</a> <span
										class="allstar20"></span>4.9
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23418.html" title="不择手段.By.Any.Means"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/buze.jpg"
										alt="不择手段.By.Any.Means/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23418.html" title="不择手段.By.Any.Means"
										target="_blank">不择手段.By.Any.Means/.2017</a> <span
										class="allstar35"></span>7
								</div>
							</li>
							<li>
								<div class="img">
									<a href="/subject/23417.html" title="六人晚餐.Youth.Dinner"
										target="_blank"><img width="30" height="45"
										src="http://111.73.45.49/RARBT/t2/liuren.jpg"
										alt="六人晚餐.Youth.Dinner/.2017"
										onerror="this.onerror=null;this.src='/Public/Home/images/no_litpic.gif'" /></a>
								</div>
								<div class="tit">
									<a href="/subject/23417.html" title="六人晚餐.Youth.Dinner"
										target="_blank">六人晚餐.Youth.Dinner/.2017</a> <span
										class="allstar25"></span>5.6
								</div>
							</li>
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
</body>
<script src="http://www.rarbt.com/js/foot.js"></script>
</html>
