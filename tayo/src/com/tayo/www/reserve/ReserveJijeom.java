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

public class ReserveJijeom implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String DONG = req.getParameter("dong");
		System.out.println("::::" + DONG);

		ReserveDAO dao = new ReserveDAO();

		ResultSet rs = dao.selectJijeom(DONG);

		ArrayList jijeomList = new ArrayList();

		try {
			while (rs.next()) {
				ReserveData data = new ReserveData();
				data.setJijeom(rs.getString("JIJEOM"));
				System.out.println(":::::" + rs.getString("JIJEOM"));
				jijeomList.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.close();
		}

		req.setAttribute("JIJEOM", jijeomList);

		return "../reserve/ReserveJijeom.jsp";
	}

}
