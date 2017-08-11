package com.yc.fs.util;

public class CountryToArea {
	public static String toArea(String countries) {
		if(countries==null||countries.equals("")){
			return "0";
		}
		String str = "";
		String strs[];
		if (countries.indexOf(",") != -1) {
			strs = countries.split(",");
		} else {
			strs = new String[1];
			strs[0] = countries;
		}
		for (int i = 0; i < strs.length; i++) {
			System.out.println(strs[i]);
			if (strs[i].equals("中国大陆")) {
				if (str.indexOf("1") == -1) {
					str += "1,";
				}
			} else if (strs[i].equals("台湾") || strs[i].equals("香港")) {
				if (str.indexOf("2") == -1) {
					str += "2,";
				}
			} else if (strs[i].equals("日本") || strs[i].equals("韩国")) {
				if (str.indexOf("3") == -1) {
					str += "3,";
				}
			} else {
				if (str.indexOf("4") == -1) {
					str += "4,";
				}
			}
		}
		str = str.substring(0, str.length() - 1);

		return str;
	}

	/*public static void main(String[] args) {
		String str = toArea("中国大陆,美国,台湾,香港");
		System.out.println(str);
	}*/
}
