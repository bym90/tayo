package com.tayo.www.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.tayo.www.data.BoardData;

import SQL.MyDBCP;

public class UserBoardDAO {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	public MyDBCP db;
	int result;
	// 생성자 함수에서 커넥션 풀에 있는 커넥션을 받아놓자.
	public UserBoardDAO(){
		db = new MyDBCP();
		con = db.getCON();
	}
	
	public int getTotals(){
		stmt = db.getSTMT(con);
		String sql = UserBoardSQL.getSQL(UserBoardSQL.GET_BOARD_TOTAL); 
		int total = 0;
		try{
			//결과 알아내서 알려준다.
			rs = stmt.executeQuery(sql);
			rs.next();
			total = rs.getInt("TOTAL");
			rs.close();
		}catch(Exception e){
			System.out.println("페이지오류: "+e);
		}
		return total;
	}
	
	
	/*2016.08.08 재용*/
	/* 자유게시판-> 리스트 총개수 구하기 */
	public int getTotal(){
		int total = 0;
		stmt = db.getSTMT(con);
		String sql = UserBoardSQL.getSQL(UserBoardSQL.GET_BOARD_TOTAL);
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			total = rs.getInt("TOTAL");
		} catch (Exception e) {
			System.out.println("리스트 개수 가져오기 오류:"+e);
		}finally{
			try {
				rs.close();
			} catch (Exception e2) {
				System.out.println("닫기오류:"+e2);
			}
		}
		return total;
	}
	
	
	
	/*2016.08.09 재용*/
	/* 자유게시판-> 페이지 원하는 개수만큼만 가져오기(미사용) */
	public ResultSet getList(int start, int end){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.GET_BOATD_LIST);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("자유게시판 게시판 개수가져오기 오류:"+e);
		}
		return rs;
	}
	
	/*2016.08.09 재용*/
	/* 자유게시판-> 페이지 원하는 개수만큼만 가져오기(사용) */
	/*위와 동일*/
	public ResultSet getLists(){
		//할일
		//	1.Statement 만들고
		stmt = db.getSTMT(con);
		//	2. 질의 명령 만들어서
		String sql = UserBoardSQL.getSQL(UserBoardSQL.GET_BOATD_LISTS);
		//	3. 질의 실행하고
		try {
			rs = stmt.executeQuery(sql);	
		} catch (Exception e) {
			System.out.println(e);
		}
		//	4. 그 결과를 알려준다.
		return rs;
	}
	/*2016.08.09 재용*/
	/*자유게시판 게시글 등록*/
	public int freeBoardInsert(BoardData data){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_INSERT);
		int isResult=0;
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getId());
			pstmt.setString(2, data.getWriter());
			pstmt.setString(3, data.getTitle());
			pstmt.setString(4, data.getContent());
			pstmt.setString(5, data.getIp());
			isResult = pstmt.executeUpdate();
			System.out.println("쿼리실행결과: "+isResult);
		} catch (Exception e) {
			System.out.println("자유게시판 등록 오류:"+e);
		}
		return isResult;
	}
	/*2016.08.09 재용*/
	/*자유게시판 조회수 증가(세션처리)*/
	public int freeBoardUpdateHit(int rbno) {
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_UPDATE_HIT);
		int  isResult=0;
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, rbno);
			isResult = pstmt.executeUpdate();
			System.out.println("조회수 증가:"+ isResult);
		} catch (Exception e) {
			System.out.println("조회수증가 오류:"+e);
		}
		return isResult;
	}
	/*2016.08.09 재용*/
	/*자유게시판 상세보기 */
	public ResultSet freeBoardView(int no){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_VIEW);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("자유게시판 상세보기 오류:"+e);
		}
		return rs;
	}
	
	/*2016.08.09 재용*/
	/*자유게시판 수정폼 자료가져오기 */
	public ResultSet freeBoardModify(int no){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_MODIFY);
		pstmt = db.getPSTMT(sql, con);
		try {
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("자유게시판 수정폼 자료 가져오기 오류:"+e);
		}
		return rs;
	}
	
	/*2016.08.09 재용*/
	/*자유게시판 수정처리*/
	public void freeBoardUpdate(BoardData data){
		// 질의
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_UPDATE);
		pstmt = db.getPSTMT(sql, con);
		
		try {
			// 실행
			pstmt.setString(1, data.getTitle());
			pstmt.setString(2, data.getContent());
			pstmt.setInt(3, data.getNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("자유게시판 게시판 수정오류: "+e);
		}
	}
	
	/*2016.08.09 재용*/
	/*자유게시판 삭제처리*/
	public int freeBoardDeleteProc(int no){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_DELETE_PROC);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			System.out.println("삭제결과: "+result);
		} catch (Exception e) {
			System.out.println("자유게시판 삭제 요청 오류:"+e);
		}
		return result;
	}
	
	
	/*2016.08.09 재용*/
	/*자유게시판 좋아요 처리(세션을 이용)*/	
	public void freeBoardUpdateGood(int no){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_UPDATE_GOOD);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, no);
			pstmt.execute();
		} catch (Exception e) {
			System.out.println("자유게시판 추천오류:"+e);
		}
	}
	
	/*2016.08.10 재용*/
	/*자유게시판 구려요 처리(세션을 이용)*/	
	public void freeBoardUpdateBad(int no){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_UPDATE_BAD);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, no);
			pstmt.execute();
		} catch (Exception e) {
			System.out.println("자유게시판 추천오류:"+e);
		}
	}
	
	/*2016.08.10 재용*/
	/* 자유게시판: 검색 요청 처리 함수*/
	public ResultSet selectSearch(int key, String search){
//		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_SELECT_SEARCH);
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_SELECT_SEARCH);
		switch(key){
		case 1:
			sql = sql.replaceAll("#", "FWRITER = ? ");
			System.out.println("1번::"+sql);
			break;
		case 2:
			sql = sql.replaceAll("#", "FTITLE like ? ");
			System.out.println("2번::"+sql);
			break;
		case 3:
			sql = sql.replaceAll("#", "FBODY like ?");
			System.out.println("3번::"+sql);
			break;
		case 4:
			sql = sql.replaceAll("#", "(FTITLE like ? OR FBODY like ?)");
			System.out.println("4번::"+sql);
			break;
		}
		
		pstmt = db.getPSTMT(sql, con);
		
		String temp = "%"+ search + "%";
		
		try {
			if(key == 1){
				pstmt.setString(1, search);
			}else if(key == 2 || key == 3){
				pstmt.setString(1, temp);
			}else{
				pstmt.setString(1, temp);
				pstmt.setString(2, temp);
			}
			
			rs = pstmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("자유게시판 search 쿼리 오류:"+e);
		}
		
		return rs;
	}
	
	/*2016.08.10 재용*/
	/*자유게시판 댓글 게시판*/
	public int freeBoardRepleWrite(BoardData data){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_REPLE_WRITE);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, data.getNo());
			pstmt.setString(2, data.getId());
			pstmt.setString(3, data.getWriter());
			pstmt.setString(4, data.getTitle());
			pstmt.setString(5, data.getContent());
			pstmt.setString(6, data.getIp());
			pstmt.setInt(7, data.getCategory());
			System.out.println("1 :"+data.getNo());
			System.out.println("2 :"+data.getId());
			System.out.println("3 :"+data.getWriter());
			System.out.println("4 :"+data.getTitle());
			System.out.println("5 :"+data.getContent());
			System.out.println("6 :"+data.getIp());
			System.out.println("7 :"+data.getCategory());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("자유게시판 댓글입력 쿼리 오류:"+e);
		}
		return result;
	}
	
	/*2016.08.11 재용*/
	/*메인페이지 자유게시판 리스트*/
	public ResultSet mainFreeBoardSelect(){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.MAIN_FREE_BOARD_SELECT);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("메인페이지 자유게시판 가져오기오류:"+e);
		}
		return rs;
	}
	
	
	/*2016.08.11 재용*/
	/*자유게시판 댓글 수정*/
	public int freeBoardRepleModify(BoardData data){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_REPLE_MODIFY);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getTitle());
			pstmt.setString(2, data.getContent());
			pstmt.setInt(3, data.getNo());
			pstmt.setInt(4, data.getCategory());
			result = pstmt.executeUpdate();
			System.out.println(result);
			System.out.println(sql);
			System.out.println("게시글번호"+data.getNo());
			System.out.println("카테고리"+data.getCategory());
		} catch (Exception e) {
			System.out.println("댓글수정 쿼리 오류:"+e);
		}
		return result;
	}
	
	/*2016.08.11 재용*/
	/*자유게시판 댓글 삭제*/
	public int freeBoardRepleDelete(int no, int category){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_REPLE_DELETE);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, no);
			pstmt.setInt(2, category);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("댓글삭제 쿼리 오류:"+e);
		}
		return result;
	}
	
	/*2016.08.11 재용*/
	/*자유게시판 댓글 리스트 가져오기*/
	public ResultSet freeBoardRepleList(int no){
		String sql = UserBoardSQL.getSQL(UserBoardSQL.FREE_BOARD_REPLE_LIST);
		
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("자유게시판 댓글 리스트 쿼리 오류:"+e);
		}
		return rs;
	}
	
	//마무리 재용
	public void close(){
		db.close(rs);
		db.close(stmt);
		db.close(pstmt);
		db.close(con);
	}
}
