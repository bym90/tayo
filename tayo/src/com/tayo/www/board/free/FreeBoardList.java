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

public class FreeBoardList implements TayoMain {
	public String Exe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String strPage = request.getParameter("page");

		int page = 0;
		if(strPage == null || strPage.length()==0){
			page = 1;
		}else{
			try {
				page = Integer.parseInt(strPage);
			} catch (Exception e) {
				page = 1;
			}
		}
		
		AdminDAO pageDao = new AdminDAO();
		ResultSet rs = pageDao.getColRow();
		int col = 0;
		int row = 0;
		try {
			rs.next();
			col = rs.getInt("srow");
			row = rs.getInt("scol");
		} catch (Exception e) {
			
		}finally{
			try {
				pageDao.close();
			} catch (Exception e2) {
				System.out.println("닫기오류:"+e2);
			}
		}	

		UserBoardDAO dao = new UserBoardDAO();
		int total = dao.getTotal();
		

		PageInfo pINFO = new PageInfo(page, total,col,row);

		// 3.데이터베이스에서 목록 가지고 오기
		//	1) 현재 페이지에서 보여줄 내용이 몇번부터 몇번까지인지를 알아야한다.

		//									시작페이지 공식	 		끝페이지 공식
		//		1페이지(그룹)이면 1 ~ 5		(pno -1) * 5 + 1
		//									( 1 - 1) * 5 + 1 =>1	1  + 5 - 1 => 5
		//		2페이지(그룹)이면 6 ~ 10	( 2 - 1) * 5 + 1 =>2	6  + 5 - 1 => 10
		//		3페이지(그룹)이면 11~ 15	( 3 - 1) * 5 + 1 =>3	11 + 5 - 1 => 15

		int	start = (pINFO.getNowPage() - 1) * pINFO.getPageList() + 1; //시작 페이지 구하기
		int	end = start + pINFO.getPageList() - 1;						//끝 페이지 구하기 공식

		rs = dao.getList(start, end);

		//모델 -> data
		ArrayList<BoardData> list = new ArrayList<BoardData>();
		try {
			while(rs.next()){
				BoardData data = new BoardData();
				data.setNo(rs.getInt("NO"));
				data.setWriter(rs.getString("FWRITER"));
				data.setTitle(rs.getString("FTITLE"));
				data.setDate(rs.getDate("FDATE"));
				data.setHit(rs.getInt("FHIT"));
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println("데이터 가져오기 오류:"+e);
		}finally{
			dao.close();
		}

/*
		//게시물 ALL
		ResultSet rs = dao.getLists();
		ArrayList<BoardData> list = new ArrayList<BoardData>();
		for(int i =0; i < (pINFO.getNowPage()-1)* pINFO.getPageList(); i++){
			try{
				rs.next();
			}catch(Exception e){
				System.out.println("페이지꺼내기:"+e);
			}
		}
		try{
//			while(rs.next()){
			for(int i=0; i< pINFO.getPageList() && rs.next(); i++){
				//한줄씩 꺼낸 데이터를 한번에 묶어야 한다.
				//데이터를 묶을 데이터 빈 클래스가 필요하겠다.
				BoardData data = new BoardData();
				data.setNo(rs.getInt("NO"));
				data.setTitle(rs.getString("FTITLE"));
				data.setWriter(rs.getString("FWRITER"));
				data.setDate(rs.getDate("FDATE"));
				data.setHit(rs.getInt("FHIT"));
				list.add(data);
			}
		}catch(Exception e){
			System.out.println("게시물 가져오기 오류:"+e);
		}finally{
			dao.close();
		}
*/

		request.setAttribute("LIST", list);
		request.setAttribute("PINFO", pINFO);

		return "../freeboard/FreeBoardList.jsp";
	}
}