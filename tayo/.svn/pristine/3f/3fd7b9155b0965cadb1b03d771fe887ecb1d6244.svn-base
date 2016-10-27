package com.tayo.www.admin.bicycle;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BicycleData;
import com.tayo.www.sql.AdminDAO;

public class AdminBicycleSearch implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String search = req.getParameter("stext");
		search.toUpperCase();
		String strNowpage = req.getParameter("nowPage");
		int nowPage = Integer.parseInt(strNowpage);

		AdminDAO dao = new AdminDAO();
		ArrayList list = new ArrayList();
		ResultSet rs = dao.searchBicycle(search);
		BicycleData data = new BicycleData();
		try {
			String temp = "";
			if(rs.next()){
			data.setBno(rs.getString("BYNO"));
			System.out.println(data.getBno());
			data.setBlocation(rs.getString("JIJEOM"));
			System.out.println(data.getJijeom());
			data.setId(rs.getString("id"));
			System.out.println(data.getId());
			data.setEtime(rs.getString("ReTIME"));
			System.out.println(data.getEtime());
			data.setStime(rs.getString("rstime"));
			System.out.println(data.getStime());
			data.setRday(rs.getString("rday"));
			System.out.println(data.getRday());
			
			if(rs.getString("BSTATUS").equals("1")){
				temp = "대기중";
			}
			else if(rs.getString("BSTATUS").equals("2")){
				temp = "대여중";
			}
			else if(rs.getString("BSTATUS").equals("3")){
				temp = "연체중";
			}
			else if(rs.getString("BSTATUS").equals("4")){
				temp = "파손";
			}
			else if(rs.getString("BSTATUS").equals("5")){
				temp = "분실";
			}
			data.setBstaus(temp);
			System.out.println(data.getBstaus());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dao.close();

		req.setAttribute("NOWPAGE", nowPage);
		req.setAttribute("DATA", data);

		return "../admin/bicycle/AdminBicycleSearch.jsp";
	}
}
