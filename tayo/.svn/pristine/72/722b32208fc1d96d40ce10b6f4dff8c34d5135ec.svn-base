package com.tayo.www.reserve;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.ReserveData;
import com.tayo.www.sql.ReserveDAO;

public class ReservePage implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("ID");

		ReserveDAO dao = new ReserveDAO();
		ResultSet rs1 = dao.selectAddinfo(id);
		ResultSet rs2 = dao.selectGu();
		ReserveData data = new ReserveData();
		ArrayList list = new ArrayList();

		try {
			rs1.next();
			data.setName(rs1.getString("NAME"));
			data.setTel(rs1.getString("TEL"));
			data.setAddr(rs1.getString("ADDR"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			while(rs2.next()){
				ReserveData rdata = new ReserveData();
				rdata.setGu(rs2.getString("GU"));

				list.add(rdata);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.close();
		}


		req.setAttribute("GU", list);
		req.setAttribute("DATA", data);
		return "../reserve/ReservePage.jsp";

	}
}

