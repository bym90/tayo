package com.tayo.www.reserve;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.ReserveData;
import com.tayo.www.sql.ReserveDAO;

public class ReserveProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("ID");
		String addtel = req.getParameter("addtel");
		String rday = req.getParameter("pickdate");
		String rstime = req.getParameter("stime");
		String retime = req.getParameter("etime");
		String charge = req.getParameter("charge");
		String loc = req.getParameter("loc");
		String jijeom = req.getParameter("jijeom");

		String byinfo="";
		ReserveDAO dao = new ReserveDAO();
		ResultSet rs = dao.selectByInfo(jijeom);
		ReserveData data = new ReserveData();
		try {
			// 자전거 번호 부여
			rs.next();
			byinfo = rs.getString("BYNO");
		} catch (Exception e) {
			e.printStackTrace();
		}

		ReserveData data2= new ReserveData();
		// 예약 정보 입력
		data2.setId(id);
		data2.setAddtel(addtel);
		data2.setRday(rday);
		data2.setRstime(rstime);
		data2.setRetime(retime);
		data2.setCharge(charge);
		data2.setLocation(loc);
		data2.setByno(byinfo);

		dao.reserveProc(data2);

		// 대수 업데이트
		dao.updateBcount(jijeom);

		// 예약 상태 업데이트
		dao.updateBStatus(byinfo);

		dao.close();

		return "../reserve/ReserveProc.jsp";
	}

}


