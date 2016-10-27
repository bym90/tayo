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

public class AdminBicycleLocation2 implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String jijeom = req.getParameter("jijeom");
		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.getJijeom(jijeom);
		ArrayList list = new ArrayList();
		try {
			while(rs.next()){
				BicycleData data = new BicycleData();
				data.setJijeom(rs.getString("jijeom"));
				list.add(data);
			}
		} catch (SQLException e) {}
		dao.close();

		req.setAttribute("DATA", list);

		return "../admin/bicycle/AdminBicycleLocation2.jsp";

	}
}
