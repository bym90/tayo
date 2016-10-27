package com.tayo.www.util;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class Util {

	public static String changeBR(String temp) {
		if (temp != null) {
			temp = temp.replaceAll("\r\n", "<br>");
		}
		return temp;
	}

	public static String dateForm(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String result = format.format(date.getTime());
		return result;
	}

	public static String splitString(String temp, int count) {
		if (temp != null) {
			if (temp.length() > count) {
				temp = temp.substring(0, count) + " ... ";
			}
		}
		return temp;
	}

	public static boolean isNull(String temp) {
		if (temp == null || temp.length() == 0) {
			return true;
		} else {
			return false;
		}
	}
}
