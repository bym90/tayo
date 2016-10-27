package com.tayo.www.board.free;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardModify implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strNo = request.getParameter("no"); //게시판 번호
		String strPage = request.getParameter("page");
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

		UserBoardDAO dao = new UserBoardDAO();
		ResultSet rs = dao.freeBoardModify(no);

		BoardData data = new BoardData();
		try {
			rs.next();
			data.setNo(rs.getInt("NO"));
			data.setWriter(rs.getString("FWRITER"));
			data.setTitle(rs.getString("FTITLE"));
			data.setContent(rs.getString("FBODY"));
		} catch (Exception e) {
			System.out.println("자유게시판 수정자료 뷰요청 오류:"+e);
		}finally{
			dao.close();
		}

		request.setAttribute("PAGE", page);
		request.setAttribute("NO", no);
		request.setAttribute("DATA", data);


		return "../freeboard/FreeBoardModify.jsp";
	}
}