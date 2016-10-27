package com.tayo.www.sql;
/**
 * 회원 관련	: 0000
 * 자유게시판	: 1000
 * 		관리자 자유게시판 : 1900
 * QNA			: 2000
 * 		관리자 QNA		  : 2900
 * 신고게시판	: 3000
 * 		관리자 신고게시판 : 3900
 * 관리자		: 9000
 * 마이페이지	: 4000
 * 
 * 
 * 
 * 
 * @author nostalgia
 *
 */
public class MemberSQL {
	public static final int CHECK_ID = 0001;				/* 로그인-> 회원 판단*/
	public static final int ADD_USERINFO = 0002;			/* 치현: 최초 로그인시 부가정보 입력*/
	public static final int UPDATE_LOGIN = 0003;			/* 최근 접속일  */
	public static final int GET_USERINFO = 4001;			/* 치현: 마이페이지: 개인정보 DB에서 가져오기*/
	public static final int SET_USERINFO = 4002;			/* 치현: 마이페이지: 개인정보 수정내용 DB에 저장하기*/
	public static final int CHANGE_USERPW = 4003;			/* 치현: 마이페이지: 비밀번호 수정내용 DB에 저장하기*/
		public static String getSQL(int code){
		StringBuffer buff = new StringBuffer();
		/*
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		buff.append("									");
		break;
		 */
		switch(code){
		case CHANGE_USERPW:
			buff.append("UPDATE	userinfo ");
			buff.append("SET ");
			buff.append("	PW = ? ");
			buff.append("WHERE ");
			buff.append("	ID= ? ");
			break;
		case SET_USERINFO:
			buff.append("UPDATE userinfo ");
			buff.append("SET ");
			buff.append("	BIRTH = ?, ");
			buff.append("	TEL = ?, ");
			buff.append("	ADDR = ?, ");
			buff.append("	PW = ? ");
			buff.append("WHERE ");
			buff.append("	ID = ?");
			break;
		case GET_USERINFO:
			buff.append("SELECT	");
			buff.append("	*	 ");
			buff.append("FROM ");
			buff.append("	USERINFO ");
			buff.append("WHERE 		");
			buff.append("	ID = ?	 ");
			break;
		/*2016.08.08 작업*/
		/* 로그인-> 회원 판단*/
		case CHECK_ID:
			buff.append("SELECT 						");
			buff.append("	COUNT(*) AS CNT 			");
			buff.append("FROM 							");
			buff.append("	USERINFO 					");
			buff.append("WHERE 							");
			buff.append("	ID = ? 						");
			break;

			
			//치현
		case ADD_USERINFO:
			buff.append("INSERT	INTO USERINFO( 				 ");
			buff.append("	id,name,birth,tel,addr,pw,agree) ");
			buff.append("VALUES( 							 ");
			buff.append("	?,?,?,?,?,?,?)		  			 ");
			break;
			
		case UPDATE_LOGIN :
			buff.append("update ");
			buff.append("	userinfo ");
			buff.append("set ");
			buff.append("	ldate = sysdate ");
			buff.append("where id = ? ");
			break;
	
		}

		return buff.toString(); 
	}
}
