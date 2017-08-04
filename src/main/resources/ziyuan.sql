--用户表 
--uid
--uname
--pwd
--power
--pic
--themenum 发布主题数
--score 积分
create table mUserInfo(
       muid number(10) primary key,
       uname varchar2(20) not null,
       pwd varchar2(20) not null,
       pow number(1),
       pic varchar2(100),
      -- themenum number(10), --论坛里面
       score number(10)
);
create sequence seq_ziyuan_muserinfo_aid start with 1000;

--电影类型表
--tid
--mtype
--tname 逗号拼接

--数据字典 根据type判断是地区还是类型
create table mFilmType(
       tid number(10) primary key,
       mtype number(1) not null,
       tname varchar2(1000) not null
)
create sequence seq_ziyuan_mFilmType_tid start with 1000;

-----搜索关键词  地区 类型 年
--文件表 
--fid
--tids 
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
--intro 简介 clob图文混编
--intropic 逗号分隔的字符串存
drop table mfile
create table mfile(
       fid number(10) primary key,  --编号
       tids varchar2(200),  --逗号拼接tid 类型
       fname varchar2(100),   --电影名
       fpic varchar2(100),  --电影海报
       grade number(10,2),  --评分
       country varchar2(20),  --国家
       myear number(10),  --电影年份
       uptime Date,  --上传时间
       othername varchar2(20),  --又名
       dname varchar2(20),  --导演
       sname varchar2(20),   --编剧
       aname varchar2(20),  --主演
       imdb varchar2(20),  
       downlink varchar2(200),  --下载链接
       beizhu varchar2(100),  --备注
       intro clob  --简介      
)
create sequence seq_ziyuan_mfile_fid start with 1000;