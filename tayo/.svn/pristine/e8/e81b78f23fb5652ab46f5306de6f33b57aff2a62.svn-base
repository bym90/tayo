package com.tayo.www.reserve;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.ReserveData;
import com.tayo.www.sql.ReserveDAO;

public class ReserveLocation implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jijeom = req.getParameter("jijeom");
		System.out.println(":::::"+jijeom);
		ReserveDAO dao = new ReserveDAO();
		ResultSet rs1 = dao.selectLocation(jijeom);
		ResultSet rs2 = dao.selectBcount(jijeom);

		ReserveData data = new ReserveData();
		try {
			rs1.next();
			data.setLocation(rs1.getString("LOCATION"));
			System.out.println(":::::"+rs1.getString("LOCATION"));
			data.setLotel(rs1.getString("STEL"));
			System.out.println(":::::"+rs1.getString("STEL"));
			data.setJijeom(jijeom);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			rs2.next();
			data.setBcount(rs2.getInt("BCOUNT"));
			System.out.println(":::::"+rs2.getInt("BCOUNT"));
		} catch (Exception e) {
			e.printStackTrace();
		}


		dao.close();

		req.setAttribute("LOCATION", data);
		return "../reserve/ReserveLocation.jsp";
	}

}
