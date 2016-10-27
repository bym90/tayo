package com.tayo.www.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.corba.se.pept.transport.EventHandler;
import com.tayo.www.data.ReserveData;
import com.tayo.www.data.UserData;

import SQL.MyDBCP;

public class ReserveDAO {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	public MyDBCP db;
	// 생성자 함수에서 커넥션 풀에 있는 커넥션을 받아놓자.
	public ReserveDAO(){
		db = new MyDBCP();
		con = db.getCON();
	}

	// 예약페이지 부가정보 알아오기
	public ResultSet selectAddinfo(String id) {
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_ADDINFO);
		pstmt = db.getPSTMT(sql, con);
		try {

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 예약페이지 구 정보 알아오기
	public ResultSet selectGu() {
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_GU);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 예약페이지 동 정보 알아오기
	public ResultSet selectDong(String gu){
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_DONG);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, gu);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 예약페이지 지점 정보 알아오기
	public ResultSet selectJijeom(String dong){
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_JIJEOM);
		pstmt = db.getPSTMT(sql, con);
		try {

			pstmt.setString(1, dong);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 마이페이지의, 사용내역조회를 위한, 전체 페이지 수 계산하기. -- 치현
	public int getTotal(ReserveData data){
		int total = 0;
		String sql = ReserveSQL.getSQL(ReserveSQL.COUNT_TOTAL);
		pstmt = db.getPSTMT(sql,con);
		try {
			pstmt.setString(1, data.getId());
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt("TOTAL");
		} catch (SQLException e) {
			System.out.println("ReserveDAO.java: Error.");
			e.printStackTrace();
		}
		return total;
	}

	public ResultSet GetReserve(ReserveData data){
		String sql = ReserveSQL.getSQL(ReserveSQL.GET_RESERVE_LIST);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getId());
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("ReserveDAO.java: Error.");
			e.printStackTrace();
		}
		return rs;
	}
	// 로케이션 정보 알아오기
	public ResultSet selectLocation(String jijeom){
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_LOCATION);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, jijeom);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 비밀번호 정보 알아오기
	public boolean confirmPW(String id, String pw){
		boolean conf = false;
		String sql = ReserveSQL.getSQL(ReserveSQL.CONFIRM_PW);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			rs.next();
			int result = rs.getInt("COUNT");
			if(result == 1){
				conf = true;
			}
			else {
				conf = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conf;
	}

	// 예약 하기
	public void reserveProc(ReserveData data){
		String sql = ReserveSQL.getSQL(ReserveSQL.RESERVE_PROC);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, data.getId());
			pstmt.setString(2, data.getAddtel());
			pstmt.setString(3, data.getRday());
			pstmt.setString(4, data.getRstime());
			pstmt.setString(5, data.getRetime());
			pstmt.setString(6, data.getCharge());
			pstmt.setString(7, data.getByno());
			pstmt.setString(8, data.getLocation());
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 자전거 정보 알아오기
	public ResultSet selectByInfo(String jijeom){
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_BYINFO);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, jijeom);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 대수 카운트 하기
	public void updateBcount(String jijeom){
		String sql = ReserveSQL.getSQL(ReserveSQL.UPDATE_BCOUNT);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, jijeom);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 대수 정보 알아오기
	public ResultSet selectBcount(String jijeom){
		String sql = ReserveSQL.getSQL(ReserveSQL.SELECT_BCOUNT);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, jijeom);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 예약 상태 바꾸기
	public void updateBStatus(String byinfo){
		String sql = ReserveSQL.getSQL(ReserveSQL.UPDATE_BSTATUS);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, byinfo);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		db.close(rs);
		db.close(pstmt);
		db.close(stmt);
		db.close(con);
	}
}
