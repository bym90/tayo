package com.tayo.www.reserve;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.ReserveDAO;

public class PWConfirm implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("ID");
		System.out.println("::::###"+id);
		String pw = req.getParameter("pw");
		System.out.println("::::###"+pw);

		ReserveDAO dao = new ReserveDAO();
		boolean conf = dao.confirmPW(id, pw);
		dao.close();
		System.out.println("::::###"+conf);

		req.setAttribute("PWCONFIRM", conf);
		return "../reserve/PWConfirm.jsp";
	}

}
