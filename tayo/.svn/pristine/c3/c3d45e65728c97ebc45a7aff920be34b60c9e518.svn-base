package com.tayo.www.admin.userlist;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.AdminDAO;

public class AdminUserSearch implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String strPage = req.getParameter("nowPage");
		int nowPage = Integer.parseInt(strPage);
		String search = req.getParameter("search");
		String strOption = req.getParameter("searchlist");
		int option = Integer.parseInt(strOption);

		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.userSearch(option, search);
		ArrayList list = new ArrayList();
		String temp = "";

		try {
			while(rs.next()){
				UserData data = new UserData();
				data.setUserName(rs.getString("name"));
				data.setEmail(rs.getString("id"));
				data.setCellPhone(rs.getString("tel"));
				data.setJdate(rs.getDate("jdate").toString());
				data.setLdate(rs.getDate("ldate").toString());
				if(rs.getInt("rank") == 1){
					temp = "관리자";
				}
				else if(rs.getInt("rank")==2){
					temp = "게시판 관리자";
				}
				else{
					temp = "일반";
				}
				data.setRank(temp);
				list.add(data);
			}
		} catch (SQLException e) {e.printStackTrace();}
		dao.close();

		req.setAttribute("LIST", list);
		req.setAttribute("NOWPAGE", nowPage);

		return "../admin/userlist/AdminUserSearch.jsp";
	}
}
