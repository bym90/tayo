package com.tayo.www.board.report;

import java.io.IOException;

import javax.servlet.ServletException;

//신고게시판 답글 쓰기 삭제 컨트롤러

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;

public class ReportReplyDelete implements TayoMain{
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		return "../report/ReportReplyDelete.jsp";
	}
}
