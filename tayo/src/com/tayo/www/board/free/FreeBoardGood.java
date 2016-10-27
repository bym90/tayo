package com.tayo.www.board.free;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardGood implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strNo = request.getParameter("no");
		int no = Integer.parseInt(strNo);

		String strPage = request.getParameter("page");
		int page = Integer.parseInt(strPage);

		boolean isGood = false;
		HttpSession session = request.getSession();
		ArrayList preList = (ArrayList) session.getAttribute("PREGOOD");

		if(preList == null || preList.size() == 0){
			isGood = false; 	//게시판에 처음 온
			ArrayList temp = new ArrayList();
			temp.add(no);
			session.setAttribute("PREGOOD", temp);

		}else{
			if(preList.contains(no)){
				isGood = true;	//이미 추천
			}else{
				isGood = false; //추천 한적 없음
				preList.add(no);
			}
		}


		if(isGood == false){
			// 2.데이터베이스에서 추천 수 증가시키자-> DAO , SQL 처리한 후
			UserBoardDAO dao = new UserBoardDAO();
			dao.freeBoardUpdateGood(no);
			dao.close();
		}


		request.setAttribute("NO", no);
		request.setAttribute("PAGE", page);

		return "../freeboard/FreeBoardGood.jsp";
	}
}
