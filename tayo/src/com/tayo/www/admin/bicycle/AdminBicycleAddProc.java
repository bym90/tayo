package com.tayo.www.admin.bicycle;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.AdminDAO;

public class AdminBicycleAddProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String jijeom = req.getParameter("j");
		String bno = req.getParameter("bno");
		AdminDAO dao = new AdminDAO();
		dao.insertBicycle(jijeom,bno);
		dao.close();
		return "../admin/bicycle/AdminBicycleAddProc.jsp";
	}
}
