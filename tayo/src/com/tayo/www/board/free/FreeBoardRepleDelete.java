package com.tayo.www.board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.UserBoardDAO;
import com.tayo.www.util.Util;

public class FreeBoardRepleDelete implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		int reno = Integer.parseInt(request.getParameter("reno"));
		int no = Integer.parseInt(request.getParameter("no"));
		int category = Integer.parseInt(request.getParameter("category"));//자유게시판
		String strPage = request.getParameter("page");
	
		int page = 0;
		
		if(Util.isNull(strPage)){
			page = 1;
		}else{
			try {
				page = Integer.parseInt(strPage);
			} catch (Exception e) {
				page = 1;
				System.out.println("페이지오류:"+e);
			}
		}

		UserBoardDAO dao = new UserBoardDAO();

		dao.freeBoardRepleDelete(no, category);
		dao.close();
		
		request.setAttribute("RENO", reno);
		request.setAttribute("PAGE", page);
		
		
		return "../freeboard/FreeBoardRepleDelete.jsp";
	}
}