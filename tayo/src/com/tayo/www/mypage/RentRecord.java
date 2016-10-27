package com.tayo.www.mypage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.ReserveData;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.ReserveDAO;

public class RentRecord implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("RentRecord.java: Entered.");
		ResultSet rs = null;

		String  strPage = req.getParameter("nowPage");
		int		nowPage = 0;
		int 	total = 0;
		if(strPage == null || strPage.length() == 0){
			nowPage = 1;
		}else{
			try {
				nowPage = Integer.parseInt(strPage);
			} catch (NumberFormatException e) {
				System.out.println("RentRecord.java: Error.");
				e.printStackTrace();
				nowPage = 1;
				System.out.println("RentRecord.java: nowPage became 1, due to error.");
			}
		}

		HttpSession session = req.getSession();
		String ID = (String) session.getAttribute("ID");

		ReserveData dataID = new ReserveData();
		dataID.setId(ID);
		System.out.println("RentRecord.java: dataID.ID: "+dataID.getId());
		ReserveDAO dao = new ReserveDAO();
		total = dao.getTotal(dataID);
		rs = dao.GetReserve(dataID);

		ArrayList list = new ArrayList();
		try {
			while(rs.next()){


				System.out.println("RESERNUM: "+rs.getInt("RESERNUM"));
				System.out.println("RDAY: "+rs.getString("RDAY"));

				ReserveData data = new ReserveData();

				data.setReserNum(rs.getInt("RESERNUM"));
				data.setRday(rs.getString("RDAY"));
				data.setLocation(rs.getString("LOCATION"));
				data.setJijeom(rs.getString("JIJEOM"));
				data.setByno(rs.getString("BYNO"));
				data.setRstime(rs.getString("RSTIME"));
				data.setRetime(rs.getString("RETIME"));
				data.setCharge(rs.getString("CHARGE"));
				data.setLotel(rs.getString("STEL"));
				
				
				int temp = rs.getInt("BSTATUS");
				switch(temp){
				case 1:
					data.setBstatus("반납");
					break;
				case 2:
					data.setBstatus("대여");
					break;
				case 3:
					data.setBstatus("연체");
					break;
				case 4:
					data.setBstatus("반납");
					break;
				case 5:
					data.setBstatus("반납");
					break;
				}
				
				list.add(data);
			}
		} catch (SQLException e) {
			System.out.println("RentRecord.java: Error.");
			e.printStackTrace();
		} finally{
			dao.close();
		}

		System.out.println("RentRecord.java: ID: "+ID);
		System.out.println("RentRecord.java: total: "+total);

		req.setAttribute("TOTAL",total);
		req.setAttribute("LIST", list);
		return "../mypage/RentRecord.jsp";
	}
}
