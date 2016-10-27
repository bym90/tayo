package com.tayo.www.mypage;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.MemberDAO;

public class ChangeInfoProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("ChangeInfoProc.java: Entered.");

		ResultSet rs = null;
		HttpSession session = req.getSession();
		String ID = (String) session.getAttribute("ID");
		String birth = req.getParameter("birth");
		String tel = req.getParameter("phoneNum");
		String addr = req.getParameter("addr");
		String pw = req.getParameter("PW");

		UserData data = new UserData();
		data.setEmail(ID);
		data.setBirth(birth);
		data.setCellPhone(tel);
		data.setAddr(addr);
		data.setPw(pw);

		System.out.println("tel: "+data.getCellPhone());

		MemberDAO dao = new MemberDAO();
		dao.setUserInfo(data);
		dao.close();

		req.setAttribute("ID", ID);
		return "../mypage/ChangeInfoProc.jsp";
	}

}
