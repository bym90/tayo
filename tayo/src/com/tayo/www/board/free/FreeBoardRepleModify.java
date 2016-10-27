package com.tayo.www.board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;
import com.tayo.www.util.Util;

public class FreeBoardRepleModify implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int reno = Integer.parseInt(request.getParameter("reno"));
		int no = Integer.parseInt(request.getParameter("no"));
		int category = Integer.parseInt(request.getParameter("category"));//자유게시판
		
		String strPage = request.getParameter("page");
		String title = request.getParameter("title");
		String content = request.getParameter("ir1");
		
		System.out.println("reno:"+reno+" :: no"+no+" :: category"+category+" :: 페이지"+strPage+" :: 타이틀"+title+" :: 본문"+content);
		
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
		
		
		
		BoardData data = new BoardData();
		UserBoardDAO dao = new UserBoardDAO();
		
		data.setTitle(title);
		data.setContent(content);
		data.setNo(reno);
		data.setCategory(category);
		
		dao.freeBoardRepleModify(data);
		dao.close();
		
		request.setAttribute("NO", no);
		request.setAttribute("PAGE", page);
		
		return "../freeboard/FreeBoardRepleModify.jsp";
	}
}
