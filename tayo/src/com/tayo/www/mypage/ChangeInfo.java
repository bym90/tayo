package com.tayo.www.mypage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.MemberDAO;

public class ChangeInfo implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ResultSet rs = null;
		HttpSession session = req.getSession();
		String ID = (String) session.getAttribute("ID");
		MemberDAO dao = new MemberDAO();
		UserData data = new UserData();
		data.setEmail(ID);
		rs = dao.getUserInfo(data);

		try {
			rs.next();
			data.setUserName(rs.getString("NAME"));
			data.setBirth(rs.getString("BIRTH"));
			data.setCellPhone(rs.getString("TEL"));
			data.setAddr(rs.getString("ADDR"));
			data.setPw(rs.getString("PW"));
		} catch (SQLException e) {
			System.out.println("ChangeInfo.java: Error.");
			e.printStackTrace();
		}

		dao.close();

		req.setAttribute("data", data);
		req.setAttribute("ID", ID);
		return "../mypage/ChangeInfo.jsp";
	}
}
