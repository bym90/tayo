package com.tayo.www.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.tayo.www.data.UserData;

import SQL.MyDBCP;

public class MemberDAO {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	public MyDBCP db;
	// 생성자 함수에서 커넥션 풀에 있는 커넥션을 받아놓자.
	public MemberDAO(){
		db = new MyDBCP();
		con = db.getCON();
	}
	
	/*2016.08.08 작업*/
	/* 로그인-> 회원 판단*/
	public boolean checkID(String email){
		String sql = MemberSQL.getSQL(MemberSQL.CHECK_ID);
		pstmt = db.getPSTMT(sql, con);
		boolean isCheck = false;
		try{
			//실행
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			
			int result = rs.getInt("CNT");
			if(result == 1){
				isCheck = true;
			}else{
				isCheck = false;
			}
		}catch(Exception e){
			System.out.println("회원 판단 오류:"+e);
		}finally{
			try {
				rs.close();
			} catch (Exception e2) {
				System.out.println("닫기오류:"+e2);
			}
		}
		return isCheck;
	}
	
	/*2016.08.08 치현 */
	/*최초 로그인 -> 부가정보 입력*/
	public void insertInfo(UserData data){
		String sql = MemberSQL.getSQL(MemberSQL.ADD_USERINFO);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getEmail());
			pstmt.setString(2, data.getUserName());
			pstmt.setString(3, data.getBirth());
			pstmt.setString(4, data.getCellPhone());
			pstmt.setString(5, data.getAddr());
			pstmt.setString(6, data.getPw());
			pstmt.setBoolean(7, data.getAgree());
			pstmt.execute();  //executequery로 되어 있어서 바꿈. 치현. 0809 19:20
		} catch (Exception e) {
			System.out.println("MemberDAO.java: Error.");
			e.printStackTrace();
		}
	}
	
	/*2016.08.09 치현 */
	/*마이페이지 -> 개인정보수정 -> 기존정보 불러오기*/
	public ResultSet getUserInfo(UserData data){
		String sql = MemberSQL.getSQL(MemberSQL.GET_USERINFO);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getEmail());
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("MemberDAO.java: Error.");
			e.printStackTrace();
		}
		
		return rs;
	}
	
	/*2016.08.10 치현 */
	/*마이페이지 -> 개인정보수정 -> 수정된 정보 저장하기*/
	public void setUserInfo(UserData data){
		String sql = MemberSQL.getSQL(MemberSQL.SET_USERINFO);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getBirth());
			pstmt.setString(2, data.getCellPhone());
			pstmt.setString(3, data.getAddr());
			pstmt.setString(4, data.getPw());
			pstmt.setString(5, data.getEmail());
			pstmt.execute();
		} catch (SQLException e) {
			System.out.println("MemberDAO.java: Error.");
			e.printStackTrace();
		}
	}
	
	/*2016.08.10 치현 */
	/*마이페이지 -> 개인정보수정 -> 수정된 정보 저장하기*/
	public void changeUserInfo(UserData data){
		String sql = MemberSQL.getSQL(MemberSQL.CHANGE_USERPW);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getPw());
			pstmt.setString(2, data.getEmail());
			pstmt.execute();
		} catch (SQLException e) {
			System.out.println("MemberDAO.java: Error.");
			e.printStackTrace();
		}
	}
	
	/*2016.08.09 재용 */
	/*네이버 로그인 처리시 세션처리값 적용*/
	public ResultSet selectUserInfo(String email){
		String sql = MemberSQL.getSQL(MemberSQL.GET_USERINFO);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
		}catch(Exception e){
			System.out.println("유저정보 가져오기 오류:"+e);
		}
		return rs;
	}
	
	/*2016.08.11 규영*/
	/*최근 접속일 */
	public void updateLogin(String email){
		String sql = MemberSQL.getSQL(MemberSQL.UPDATE_LOGIN);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1,email);
			pstmt.execute();
		} catch (Exception e) {
			System.out.println("최근 접속일 업데이트 에러 = "+e);
		}
	}
	
	
	//마무리 작업
	public void close(){
		db.close(rs);
		db.close(stmt);
		db.close(pstmt);
		db.close(con);
	}
}
