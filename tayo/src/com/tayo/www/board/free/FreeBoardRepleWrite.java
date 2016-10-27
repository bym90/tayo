package com.tayo.www.board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardRepleWrite implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response)
		throws IOException,ServletException{
		
		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);
		
		String strPage = request.getParameter("page");
		int page = Integer.parseInt(strPage);
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("ID");
		String ip = request.getRemoteAddr();
		
		BoardData data = new BoardData();
		data.setNo(no);
		data.setId(id);
		data.setWriter(writer);
		data.setTitle(title);
		data.setContent(content);
		data.setIp(ip);
		data.setCategory(1);
		
		
		UserBoardDAO dao = new UserBoardDAO();
		dao.freeBoardRepleWrite(data);
		dao.close();
		
		
		
		request.setAttribute("PAGE", page);
		request.setAttribute("NO", no);
		
		return "../freeboard/FreeBoardRepleWrite.jsp";

		
	}
}
