package com.tayo.www.admin.QnAboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;

public class AdminQnABoardList2Write implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{

		return "../admin/qnaboard/AdminQnABoardList2Write.jsp";
	}
}
