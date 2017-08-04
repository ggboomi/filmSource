create database filmSource default character set utf8 collate utf8_bin;

use filmSource;

create sequence seq_ziyuan_muserinfo_aid start with 1000;

--用户表 
--muid
--uname
--pwd
--power
--pic
--score 积分
--themenum 发布主题数 论坛里面搞
create table mUserInfo(
	muid int primary key auto_increment,
	uname varchar(100) not null unique,
	pwd varchar(100) not null,
	pow int not null,
	photo varchar(200),
    score int
)ENGINE=InnoDB default charset=utf8 collate=utf8_bin;
alter table mUserInfo auto_increment=1001;

--电影类型表
--tid
--mtype
--tname 逗号拼接

--数据字典 根据type判断是地区还是类型
create table mFilmType(
	tid int primary key auto_increment,
	mtype int not null,
	tname varchar(100)
)ENGINE=InnoDB default charset=utf8 collate=utf8_bin;
alter table mFilmType auto_increment=1;

-----搜索关键词  地区 类型 年
--文件表 
--fid
--tids 逗号拼接tid
--fname
--fpic
--grade 评分
--country 地区引用type表
--othername 别名
--year
--uptime 上传日期
--dname 导演
--sname 编剧
--aname 主演
--imdb 
--downname 
--downlink 
--beizhu 版本
--intro 简介
create table mfile(
	fid int primary key auto_increment,
	tids varchar(200),
	fname varchar(100),
	fpic varchar(100),
	grade double,
	country varchar(20),
	myear int,
	uptime date,
	othername varchar(100),
	dname varchar(100),
	sname varchar(100),
	aname varchar(100),
	limb varchar(50),
	downlink varchar(200),
	beizhu varchar(200),
	bdate date,
	intro text
)ENGINE=InnoDB default charset=utf8 collate=utf8_bin;
alter table mfile auto_increment=1001;


