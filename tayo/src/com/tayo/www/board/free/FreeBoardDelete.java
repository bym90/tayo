package com.tayo.www.board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardDelete implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strNo = request.getParameter("no"); //게시판 번호
		int no = 0;

		try {
			no = Integer.parseInt(strNo);
		} catch (Exception e) {
			try {
				response.sendRedirect("/");
			} catch (Exception e2) {
				System.out.println("리다이렉트 오류");
			}
		}

		UserBoardDAO dao = new UserBoardDAO();
		dao.freeBoardDeleteProc(no);
		dao.close();


		return "../freeboard/FreeBoardDelete.jsp";
	}
}