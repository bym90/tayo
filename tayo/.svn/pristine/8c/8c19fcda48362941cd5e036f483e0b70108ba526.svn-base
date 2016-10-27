package com.tayo.www.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.MemberDAO;

public class ChangePWProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("ChangePWProc.java: Entered.");

		HttpSession session = req.getSession();
		String ID = (String) session.getAttribute("ID");
		String newPW = req.getParameter("newPW");

		System.out.println("ID: "+ID);

		UserData data = new UserData();
		data.setEmail(ID);
		data.setPw(newPW);

		MemberDAO dao = new MemberDAO();
		dao.changeUserInfo(data);

		req.setAttribute("ID", ID);
		return "../mypage/ChangePWProc.jsp";
	}
}
