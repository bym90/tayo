package com.tayo.www.admin.userlist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.AdminDAO;

public class AdminUserStatusProc implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String strPage = req.getParameter("nowPage");
		int nowPage = Integer.parseInt(strPage);
		String strRank = req.getParameter("rank");
		int rank = Integer.parseInt(strRank);
		String[] check = req.getParameterValues("check");

		AdminDAO dao = new AdminDAO();
		dao.updateRank(check, rank);
		dao.close();

		req.setAttribute("NOWPAGE", nowPage);

		return "../admin/userlist/AdminUserStatusProc.jsp";
	}
}
