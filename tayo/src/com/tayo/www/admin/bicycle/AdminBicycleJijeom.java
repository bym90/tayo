package com.tayo.www.admin.bicycle;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BicycleData;
import com.tayo.www.sql.AdminDAO;

public class AdminBicycleJijeom implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String jijeom = req.getParameter("jijeom");
		System.out.println(jijeom);

		AdminDAO dao = new AdminDAO();
		BicycleData data = new BicycleData();
		ResultSet rs = null;
		String temp = "";
		//지점별 총자전거, 대기중, 대여중 .... 수 구하기
		try{
		for(int i = 0 ; i < 5; i++){
			if(i == 0){
				temp = " 1 ";
				rs = dao.getJieom(temp, jijeom);
				rs.next();
				data.setWait(rs.getInt("total"));

			}
			else if(i == 1){
				temp = " 2 ";
				rs = dao.getJieom(temp, jijeom);
				rs.next();
				data.setRent(rs.getInt("total"));

			}
			else if(i == 2){
				temp = " 3 ";
				rs = dao.getJieom(temp, jijeom);
				rs.next();
				data.setOver(rs.getInt("total"));

			}
			else if(i == 3){
				temp = " 4 ";
				rs = dao.getJieom(temp, jijeom);
				rs.next();
				data.setBroken(rs.getInt("total"));

			}
			else if(i == 4){
				temp = " 5 ";
				rs = dao.getJieom(temp, jijeom);
				rs.next();
				data.setLost(rs.getInt("total"));
				dao.close();
			}
		}
		}
		catch(Exception e){
		}
		dao.close();
		int total = data.getWait()+data.getRent()+data.getOver()+data.getBroken()+data.getLost();
		data.setTotal(total);

		System.out.println(total);
		req.setAttribute("DATA", data);

		return "../admin/bicycle/AdminBicycleJijeom.jsp";
	}
}
