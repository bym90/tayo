package com.tayo.www.admin.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;

public class AdminFreeBoardGoodBad implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{


		return "../admin/freeboard/AdminFreeBoardGoodBad.jsp";
	}
}
