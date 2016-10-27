package com.tayo.www.board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardWriteProc implements TayoMain {
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strPage = request.getParameter("page");
		int page = 0;
		if(strPage == null || strPage.length()==0){
			page = 1;
		}else{
			try {
				page = Integer.parseInt(strPage);
			} catch (Exception e) {
				page = 1;
			}
		}

		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("ir1");
		String ip = request.getRemoteAddr();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("ID");


		BoardData data = new BoardData();
		data.setId(id);
		data.setWriter(writer);
		data.setTitle(title);
		data.setContent(content);
		data.setIp(ip);

		UserBoardDAO dao = new UserBoardDAO();
		dao.freeBoardInsert(data);
		dao.close();

		request.setAttribute("PAGE", page);

		return "../freeboard/FreeBoardWriteProc.jsp";
	}
}