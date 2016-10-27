package com.tayo.www.service;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.MemberDAO;

public class Logout implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		HttpSession session = req.getSession();
		session.invalidate();




		return "../service/logout.jsp";
	}
}

