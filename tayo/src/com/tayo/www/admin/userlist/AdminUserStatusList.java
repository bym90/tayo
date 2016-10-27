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
import com.tayo.www.util.PageInfo;

public class AdminUserStatusList implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String strPage = req.getParameter("nowPage");
		int nowPage = 0;

		if(strPage == null){
			nowPage = 1;
		}
		else{
			nowPage = Integer.parseInt(strPage);
		}
		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.getColRow();
		int col = 0;
		int row = 0;
		try {
			rs.next();
			col = rs.getInt("srow");
			row = rs.getInt("scol");
		} catch (Exception e) {}
		
		int total = dao.getTotalUserInfo();

		PageInfo pinfo = new PageInfo(nowPage, total, col, row);
		int start = (pinfo.getNowPage() - 1) * pinfo.getPageList() + 1;
		int end = start + pinfo.getPageList() - 1;
		rs = dao.userList(start, end);


		ArrayList list = new ArrayList();
		String temp = "";
		try {
			while(rs.next()){
				UserData data = new UserData();
				data.setEmail(rs.getString("id"));
				data.setUserName(rs.getString("name"));
				data.setCellPhone(rs.getString("tel"));
				if(rs.getInt("rank")==1){
					temp = "관리자";
				}
				else if (rs.getInt("rank")==2){
					temp = "게시판 관리자";
				}
				else if(rs.getInt("rank")==3){
					temp = "일반";
				}
				data.setRank(temp);
				data.setJdate(rs.getDate("jdate").toString());
				data.setLdate(rs.getDate("ldate").toString());
				list.add(data);
			}
		} catch (SQLException e){}
		dao.close();

		req.setAttribute("NOWPAGE", nowPage);
		req.setAttribute("PINFO", pinfo);
		req.setAttribute("LIST", list);


		return "../admin/userlist/AdminUserStatusList.jsp";
	}
}