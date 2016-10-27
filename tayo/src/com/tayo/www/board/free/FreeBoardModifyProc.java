package com.tayo.www.board.free;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardModifyProc implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String strNo = request.getParameter("no"); //게시판 번호
		String strPage = request.getParameter("page");
		String title = request.getParameter("title");
		String content = request.getParameter("ir1");


		System.out.println(strNo+"::"+strPage+"::"+title+"::"+content);
		int no = 0;
		int page = 0;

		try {
			no = Integer.parseInt(strNo);
			page = Integer.parseInt(strPage);
		} catch (Exception e) {
			try {
				response.sendRedirect("/");
			} catch (Exception e2) {
				page = 1;
				System.out.println("리다이렉트 오류");
			}
		}


		BoardData data = new BoardData();
		data.setNo(no);
		data.setTitle(title);
		data.setContent(content);

		UserBoardDAO dao = new UserBoardDAO();
		dao.freeBoardUpdate(data);
		dao.close();

		request.setAttribute("NO", no);
		request.setAttribute("PAGE", page);

		return "../freeboard/FreeBoardModifyProc.jsp";
	}
}