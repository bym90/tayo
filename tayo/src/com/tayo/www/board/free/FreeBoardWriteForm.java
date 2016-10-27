package com.tayo.www.board.free;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.util.Util;

public class FreeBoardWriteForm implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strPage = request.getParameter("page");
		String strNo = request.getParameter("no");

		int page = 0;
		int no= 0;
		if(Util.isNull(strPage)){
			page = 1;
		}else{
			try {
				page = Integer.parseInt(strPage);
				no = Integer.parseInt(strNo);
			} catch (Exception e) {
				page = 1;
			}
		}

		request.setAttribute("PAGE", page);

		return "../freeboard/FreeBoardWriteForm.jsp";
	}
}