package com.tayo.www.board.report;

import java.io.IOException;

import javax.servlet.ServletException;

//신고 게시판 글쓰기 요청 폼 컨트롤러

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;

public class ReportBoardWriteProc implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		return "../report/ReportBoardWriteProc.jsp";
	}

}
