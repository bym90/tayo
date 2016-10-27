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
import com.tayo.www.sql.MemberDAO;

public class AdminBicycleAdd implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.getLocation();
		ArrayList list = new ArrayList();

		try {
			while(rs.next()){
				BicycleData data = new BicycleData();
				data.setGu(rs.getString("gu"));
				list.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		dao.close();

		req.setAttribute("LIST", list);


		return "../admin/bicycle/AdminBicycleAdd.jsp";
	}
}