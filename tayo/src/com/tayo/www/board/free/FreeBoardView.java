package com.tayo.www.board.free;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BoardData;
import com.tayo.www.sql.UserBoardDAO;

public class FreeBoardView implements TayoMain{
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

		//조회수 증가 세션을 이용하여 처리
		HttpSession session = request.getSession();
		boolean isShow = false;
		String preno = (String) session.getAttribute("PRENO");
		if(preno ==null || preno.length() ==0){ //세션을 발급받고 한번도 글을 보지않은 경우
			isShow = false;
			session.setAttribute("PRENO", "#"+no+"#");
		}else{ //글을 본적이 있는 사람
			int position = preno.indexOf("#"+no+"#");
			System.out.println("지금까지본글들:"+preno);
			System.out.println("[조회수증가]게시글번호있니:"+position);
			if(position == -1){
				isShow = false;
				session.setAttribute("PRENO", preno+"#"+no+"#");
				//preno+"#"+rbno 로 해주는 이유는
				// 이미 내가 본 값에 rbno값을 더 넣어주는 것이다.

			}else{
				//본적 있는디
				isShow = true;
			}
		}

		if(isShow == false){
			dao.freeBoardUpdateHit(no);
		}

		ResultSet rs = dao.freeBoardView(no);
		BoardData data = new BoardData();
		try {
			rs.next();
			data.setNo(rs.getInt("NO"));
			data.setWriter(rs.getString("FWRITER"));
			data.setId(rs.getString("ID"));
			data.setTitle(rs.getString("FTITLE"));
			data.setContent(rs.getString("FBODY"));
			data.setDate(rs.getDate("FDATE"));
			data.setHit(rs.getInt("FHIT"));
			data.setGood(rs.getInt("FGOOD"));
			data.setBad(rs.getInt("FBAD"));
			data.setIp(rs.getString("FIP"));
		} catch (Exception e) {
			System.out.println("자유게시판 상세보기 뷰 요청 오류: "+e);
		}finally{
			try {
				rs.close();
			} catch (Exception e2) {
				System.out.println("자게 상세보기 뷰 요청 닫기오류"+e2);
			}
		}

		
		

		rs = dao.freeBoardRepleList(no);

		ArrayList<BoardData> repleList = new ArrayList<BoardData>();
		try {
			while(rs.next()){
				BoardData repleData = new BoardData();
				repleData.setNo(rs.getInt("NO"));
				repleData.setReno(rs.getInt("RENO"));
				repleData.setId(rs.getString("ID"));
				repleData.setWriter(rs.getString("RWRITER"));
				repleData.setTitle(rs.getString("RTITLE"));
				repleData.setContent(rs.getString("RBODY"));
				repleData.setDate(rs.getDate("RDATE"));
				repleData.setIp(rs.getString("RIP"));
				repleData.setCategory(rs.getInt("CATEGORY"));
				repleList.add(repleData);
			}
		} catch (Exception e) {
			System.out.println("자유게시판 댓글 리스트 가져오기:"+e);
		}finally{
			dao.close();
		}


		request.setAttribute("REPLE", repleList);
		request.setAttribute("DATA", data);
		request.setAttribute("PAGE", page);

		return "../freeboard/FreeBoardView.jsp";
	}
}