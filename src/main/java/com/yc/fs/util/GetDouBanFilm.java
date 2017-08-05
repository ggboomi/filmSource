package com.yc.fs.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yc.fs.bean.DoubanInfo;

public class GetDouBanFilm {
	private String resp = "";

	public String getResp() {
		return resp;
	}

	/**
	 * 获取豆瓣信息
	 * 
	 * @param iid
	 *            豆瓣id
	 * @param path
	 *            豆瓣地址
	 * @return
	 */
	public DoubanInfo getDouBanFilm(String iid, String path) {
		DoubanInfo doubanInfo = null;
		String url = "http://api.douban.com/v2/movie/subject/";
		url += iid;
		BufferedReader read = null;// 读取访问结果

		try {
			URL realurl = new URL(url);
			URLConnection connection = realurl.openConnection();
			connection.connect();
			// 获取所有响应头字段
			Map<String, List<String>> map = connection.getHeaderFields();
			// 遍历所有的响应头字段，获取到cookies等
			List<String> http = null;
			for (String key : map.keySet()) {
				if (key == null) {
					http = map.get(key);
					break;
				}
			}
			String status = http.get(0).split(" ")[1];
			System.out.println(status);

			if (status.equals("200")) {
				// 定义 BufferedReader输入流来读取URL的响应
				read = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
				String line;// 循环读取
				while ((line = read.readLine()) != null) {
					resp += line;
				}

				Gson gson = new GsonBuilder().create();
				doubanInfo = gson.fromJson(resp, DoubanInfo.class);

				@SuppressWarnings("unchecked")
				Map<String, Object> maps = (Map<String, Object>) doubanInfo.getRating();
				doubanInfo.setAverage(maps.get("average").toString());

				// 对电影海报的处理
				@SuppressWarnings("unchecked")
				Map<String, Object> mapb = (Map<String, Object>) doubanInfo.getImages();
				doubanInfo.setbImg(mapb.get("large").toString());
				doubanInfo.setsImg(mapb.get("small").toString());

				// 对演员的处理
				List<Object> list = doubanInfo.getCasts();
				List<String> li = new ArrayList<String>();
				for (Object obj : list) {
					@SuppressWarnings("unchecked")
					Map<String, Object> map1 = (Map<String, Object>) obj;
					li.add(map1.get("name").toString());
				}
				doubanInfo.setCast(li);

				// 对导演的处理
				List<Object> list2 = doubanInfo.getDirectors();
				List<String> li2 = new ArrayList<String>();
				for (Object obj : list2) {
					@SuppressWarnings("unchecked")
					Map<String, Object> map1 = (Map<String, Object>) obj;
					li2.add(map1.get("name").toString());
				}
				doubanInfo.setDire(li2);

				String src = doubanInfo.getbImg();
				String imageName = null;
				try {
					URL uri = new URL(src);

					path = path.substring(0, path.lastIndexOf("\\")) + "\\filmSourceImages\\";
					imageName = path + src.substring(src.lastIndexOf("/") + 1, src.length());
					InputStream in = uri.openStream();
					FileOutputStream fo = new FileOutputStream(new File(imageName));
					byte[] buf = new byte[1024];
					int length = 0;
					while ((length = in.read(buf, 0, buf.length)) != -1) {
						fo.write(buf, 0, length);
					}
					in.close();
					fo.close();
				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					System.out.println(imageName + "下载完成");
				}

			} else if (status.equals("404")) {
				System.out.println("404错误");
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return doubanInfo;

	}
}
