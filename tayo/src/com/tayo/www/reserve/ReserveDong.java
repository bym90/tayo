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

public class ReserveDong implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String GU = req.getParameter("gu");
		System.out.println("::::" + GU);

		ReserveDAO dao = new ReserveDAO();
		ResultSet rs = dao.selectDong(GU);

		ArrayList dongList = new ArrayList();

		try {
			while (rs.next()) {
				ReserveData data = new ReserveData();
				data.setDong(rs.getString("DONG"));
				System.out.println(":::::" + rs.getString("DONG"));
				dongList.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.close();
		}

		req.setAttribute("DONG", dongList);

		return "../reserve/ReserveDong.jsp";
	}

}
