package com.tayo.www;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;

public class Index implements TayoMain {
	public String Exe(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{


		UserBoardDAO dao = new UserBoardDAO();
		ResultSet rs = dao.mainFreeBoardSelect();
		ArrayList freeList = new ArrayList();
//		ArrayList<BoardData> reportList = new ArrayList();
//		ArrayList<BoardData> qnaList = new ArrayList();

		try {
			while(rs.next()){
				BoardData freeData = new BoardData();
				freeData.setNo(rs.getInt("NO"));
				freeData.setTitle(rs.getString("FTITLE"));
				freeList.add(freeData);
			}
		} catch (Exception e) {
			System.out.println("자유게시판 가져오기 뷰요청 오류:"+e);
		}finally{
			try {
				dao.close();
			} catch (Exception e2) {
				System.out.println("메인자유게시판 가져오기 닫기오류:"+e2);
			}
		}


		request.setAttribute("FLIST", freeList);

		return "./welcome.jsp";
	}
}