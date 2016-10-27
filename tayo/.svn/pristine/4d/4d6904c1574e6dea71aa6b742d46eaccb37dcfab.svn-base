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

public class AdminBicycleLocation implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String dong = req.getParameter("dong");
		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.getDong(dong);
		ArrayList list = new ArrayList();
		try {
			while(rs.next()){
				BicycleData data = new BicycleData();
				data.setDong(rs.getString("dong"));
				list.add(data);
			}
		} catch (SQLException e) {}
		dao.close();

		req.setAttribute("DATA", list);

		return "../admin/bicycle/AdminBicycleLocation.jsp";
	}
}
