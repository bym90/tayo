package com.tayo.www.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

import SQL.MyDBCP;

public class AdminDAO {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	public MyDBCP db;
	// 생성자 함수에서 커넥션 풀에 있는 커넥션을 받아놓자.
	public AdminDAO(){
		db = new MyDBCP();
		con = db.getCON();
	}
	
	//자전거 정보의 갯수
	public int getTotalBicycleInfo(int temp){
		
		String sql = AdminSQL.getSQL(AdminSQL.GET_TOTALBICICLE);
		if(temp == 0){
			sql = sql.replace("#", "");
		}
		if(temp == 1){
			sql = sql.replace("#", " where bstatus = 1 ");
		}
		if(temp == 2){
			sql = sql.replace("#", " where bstatus = 2 ");
		}
		if(temp == 3){
			sql = sql.replace("#", " where bstatus = 3 ");
		}
		if(temp == 4){
			sql = sql.replace("#", " where bstatus = 4 ");
		}
		if(temp == 5){
			sql = sql.replace("#", " where bstatus = 5 ");
		}
	
		stmt = db.getSTMT(con);
		int total = 0;
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			total = rs.getInt("TOTAL");
			rs.close();
		} catch (Exception e) {
			System.out.println("총 데이터 개수 구하기 에러 "+e);
		}
	
		return total;
	}
	
	//자전거 목록 가지고 오기 처리 함수
	public ResultSet getList(int start, int end, int sort){
		String sql = AdminSQL.getSQL(AdminSQL.SELECT_LIST);
				
		//상태별로 자전거 현황을 가져오기
		if(sort == 0){
			sql = sql.replace("#", " ");
		}
		else if(sort == 1){
			sql = sql.replace("#", " where bstatus = 1  ");
		}
		else if(sort == 2){
			sql = sql.replace("#", " where bstatus = 2  ");
		}
		else if(sort == 3){
			sql = sql.replace("#", " where bstatus = 3  ");
		}
		else if(sort == 4){
			sql = sql.replace("#", " where bstatus = 4  ");
		}
		else{
			sql = sql.replace("#", " where bstatus = 5  ");
		}
		System.out.println(sql);
		pstmt = db.getPSTMT(sql, con);		
		try{
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
		}
		catch(Exception e){
			System.out.println("목록 검색 질의 에러 "+e);
		}
		
		return rs;
	}
	
	//자전거  현황 
	public ResultSet getBicycle(){
		String sql = AdminSQL.getSQL(AdminSQL.GET_BICYCLESTATUS);
		stmt = db.getSTMT(con);
		
		try {
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("자전거 현황 가져오기 에러  = "+e);
		}
		return rs;
	}
	//자전거 추가 구/동/지점 선택
	public ResultSet getLocation(){
		String sql = AdminSQL.getSQL(AdminSQL.GET_LOCATION);
		stmt = db.getSTMT(con);
		try {
		  rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("구/동/지점 선택 에러  = "+e);
		}
		return rs;
	}
	//자전거  동 알아내기
	public ResultSet getDong(String dong){
		String sql = AdminSQL.getSQL(AdminSQL.GET_DONG);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1,dong);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("동 선택 에러  = "+e);
		}
		return rs;
	}
	
	//자전거 지점 알아내기
	public ResultSet getJijeom(String jijeom){
		String sql = AdminSQL.getSQL(AdminSQL.GET_JIJEOM);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1,jijeom);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("지점 선택 에러  = "+e);
		}
		return rs;
	}
	
	//자전거 추가
	public void insertBicycle(String jijeom, String bno){
		String sql = AdminSQL.getSQL(AdminSQL.INSERT_BICYCLE);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1,bno );
			pstmt.setString(2,jijeom );
			pstmt.execute();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("자전거 추가 에러 = "+e);
		}
		
	}
	
	
	//자전거 검색
	public ResultSet searchBicycle(String search){
		String sql = AdminSQL.getSQL(AdminSQL.GET_SEARCH);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, search.toUpperCase());
			rs = pstmt.executeQuery();
			} catch (Exception e) {
			System.out.println("자전거 검색 에러 = "+e);
		}
		return rs;
	}
	
	//자전거 삭제
	public void deleteBicycle(String[] temp){
		String sql = AdminSQL.getSQL(AdminSQL.DELETE_BICYCLE);
		stmt = db.getPSTMT(sql, con);
		String byno= "IN(";
		for(int i = 0; i < temp.length; i++){
			byno += "'"+temp[i]+"',";
		}
		byno = byno.substring(0,byno.length()-1);
		byno += ")";
		sql = sql.replace("#", byno);
		
		try {
			stmt.execute(sql);
		}catch (Exception e) {
			System.out.println("자전거 삭제 에러 = "+e);
		}
	}
	
	//자전거 상태 변경
	public void updateStatus(String[] temp, String status){
		String sql = AdminSQL.getSQL(AdminSQL.UPDATE_STATUS);
		String byno= "IN(";
		for(int i = 0; i < temp.length; i++){
			byno += "'"+temp[i]+"',";
		}
		byno = byno.substring(0,byno.length()-1);
		byno += ")";
		sql = sql.replace("#", byno);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, status);
			pstmt.execute();
		}catch (Exception e) {
			System.out.println("자전거 상태변경 에러 = "+e);
		}
	}
	
	//지점별 총자전거 , 대여중, 파손 등 수 구하기
	public ResultSet getJieom(String temp, String jijeom){
		String sql = AdminSQL.getSQL(AdminSQL.GET_JIJEOMSTATE);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setString(1, jijeom);
			pstmt.setString(2, temp);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("지점별 자전거 상태 수 구하기에러 = "+e);
		}
		return rs;
	}
	
	//모든 유저 정보
	public int getTotalUserInfo(){
		
		String sql = AdminSQL.getSQL(AdminSQL.GET_TOTALUSER);
		
		stmt = db.getSTMT(con);
		int total = 0;
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			total = rs.getInt("TOTAL");
			rs.close();
		} catch (Exception e) {
			System.out.println("총 유저 데이터 구하기 에러 = "+e);
		}
	
		return total;
	}
	
	//유저 리스트
	public ResultSet userList(int start, int end){
		String sql = AdminSQL.getSQL(AdminSQL.GET_USERLIST);
		pstmt = db.getPSTMT(sql,con);
		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("유저 리스트 뿌려주기 에러 = "+e);
		}
		return rs;
	}
	
	//유저 등급 변경
	public void updateRank(String[] temp, int list){
		String sql = AdminSQL.getSQL(AdminSQL.UPDATE_LANK);
		String check= "IN(";
		for(int i = 0; i < temp.length; i++){
			check += "'"+temp[i]+"',";
		}
		check = check.substring(0,check.length()-1);
		check += ")";
		sql = sql.replace("#", check);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, list);
			pstmt.execute();
			
		} catch (Exception e) {
			System.out.println("유저 등급 변경 에러  = "+e);
		}
	}
	
	//유저 검색
	public ResultSet userSearch(int option, String search){
		String sql = AdminSQL.getSQL(AdminSQL.GET_USERSEARCH);
		if(option == 1){
			sql = sql.replace("#", " name = ? ");
		}
		else{
			sql = sql.replace("#", " id like ? ");
		}
		String temp = "%"+search+"%";
		pstmt = db.getPSTMT(sql, con);
		
		try {
			if(option == 1){
			pstmt.setString(1, search);
			}
			else{
			pstmt.setString(1, temp);
			}
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("유저 검색 에러 = "+e);
		}
		return rs;
	}
	
	//게시판 col, row 구하기
	public ResultSet getColRow(){
		String sql = AdminSQL.getSQL(AdminSQL.GET_COLROW);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("게시판 row, col 가져오기 에러 = "+e);
		}
		
		return rs;
	}
	
	//게시판 col, row 적용
	public void setColRow(int col, int row){
		String sql = AdminSQL.getSQL(AdminSQL.SET_COLROW);
		pstmt = db.getPSTMT(sql, con);
		try {
			pstmt.setInt(1, col);
			pstmt.setInt(2, row);
			pstmt.execute();
		} catch (Exception e) {
			System.out.println("col, row 적용 에러 ");
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
