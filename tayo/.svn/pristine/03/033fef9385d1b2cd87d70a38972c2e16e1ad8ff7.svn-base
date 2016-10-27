package com.tayo.www.admin.bicycle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.AdminDAO;

public class AdminBicycleDeleteProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String[] checked = req.getParameterValues("check");
		String strPage = req.getParameter("nowPage");
		int nowPage = Integer.parseInt(strPage);


		AdminDAO dao = new AdminDAO();
		dao.deleteBicycle(checked);
		dao.close();

		req.setAttribute("NOWPAGE", nowPage);

		return "../admin/bicycle/AdminBicycleDeleteProc.jsp";
	}
}
