package com.tayo.www.board.free;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.AdminDAO;
import com.tayo.www.sql.UserBoardDAO;
import com.tayo.www.util.PageInfo;
import com.tayo.www.util.Util;

public class FreeBoardSearch implements TayoMain{
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strPage = request.getParameter("page");

		int page = 0;
		if(Util.isNull(strPage)){
			page = 1;
		}else{
			page = Integer.parseInt(strPage);
		}


		String strKey = request.getParameter("key");
		int key = Integer.parseInt(strKey);
		String search = request.getParameter("search");

		System.out.println("키:"+key+""+"검색값:"+search);

		AdminDAO pageDao = new AdminDAO();
		ResultSet rs = pageDao.getColRow();
		int col = 0;
		int row = 0;
		try {
			rs.next();
			col = rs.getInt("srow");
			row = rs.getInt("scol");
		} catch (Exception e) {}
		finally{
			pageDao.close();
		}
		UserBoardDAO dao = new UserBoardDAO();
		rs = dao.selectSearch(key, search);


		//페이지 처리
		int total = 0;
		try {
			rs.last();
			total = rs.getRow();
			System.out.println("검색 개수:"+total);
			rs.beforeFirst();
		} catch (Exception e) {
			System.out.println("자유게시판 검색 데이터개수 조회 오류:"+e);
		}

		PageInfo pInfo = new PageInfo(page, total,col,row);



		ArrayList list = new ArrayList();
		try {
			for(int i = 0; i < (pInfo.getNowPage() - 1) * pInfo.getPageList(); i++) {
				rs.next();
			}

			for(int i = 0; i < pInfo.getPageList() && rs.next(); i++ ) {
				BoardData data = new BoardData();
				data.setNo(rs.getInt("NO"));
				data.setId(rs.getString("ID"));
				data.setWriter(rs.getString("FWRITER"));
				data.setTitle(rs.getString("FTITLE"));
				System.out.println(rs.getString("FTITLE"));
				System.out.println(rs.getString("FWRITER"));
				data.setDate(rs.getDate("FDATE"));
				data.setHit(rs.getInt("FHIT"));
				data.setIp(rs.getString("FIP"));
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println("검색 값 가져오기 오류:"+e);
		}finally{
			dao.close();
		}

		//모델로 전송
		request.setAttribute("LIST", list);
		request.setAttribute("PINFO", pInfo);
		request.setAttribute("KEY", key);
		request.setAttribute("SEARCH", search);

		return "../freeboard/FreeBoardList.jsp";

	}
}
