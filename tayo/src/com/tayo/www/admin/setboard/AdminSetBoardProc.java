package com.tayo.www.admin.setboard;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.AdminDAO;

public class AdminSetBoardProc implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.getColRow();
		int tempRow = 0;
		int tempCol = 0;
		
		try {
			rs.next();
			tempRow = rs.getInt("srow");
			tempCol = rs.getInt("scol");
		} catch (Exception e) {}
		
		String strCol = req.getParameter("set1");
		int col = Integer.parseInt(strCol);
		String strRow = req.getParameter("set2");
		int row = Integer.parseInt(strRow);
		
				
		if(col == 0){
			col = tempCol;
		}
		if(row == 0){
			row = tempRow;
		}
		
		System.out.println(col);
		System.out.println(row);
		
		dao.setColRow(col, row);
		dao.close();
		
		return "../admin/setboard/AdminSetBoard.jsp";
	}
}

