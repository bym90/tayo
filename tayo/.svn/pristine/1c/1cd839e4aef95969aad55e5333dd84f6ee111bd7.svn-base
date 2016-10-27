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
 * 
 * 
 * 
 * 
 * 
 * @author nostalgia
 *
 */
public class UserBoardSQL {
	public static final int GET_BOARD_TOTAL = 1000;				/* 자유게시판-> 리스트 총개수 구하기 */
	public static final int GET_BOATD_LIST = 1001;				/* 자유게시판-> 페이지 원하는 개수만큼만 가져오기(미사용) */
	public static final int GET_BOATD_LISTS = 1002;				/* 자유게시판-> 페이지 원하는 개수만큼만 가져오기(사용) */
	public static final int FREE_BOARD_INSERT = 1003;			/*자유게시판 게시글 등록*/
	public static final int FREE_BOARD_UPDATE_HIT = 1004;		/*자유게시판 조회수 증가(세션처리)*/
	public static final int FREE_BOARD_VIEW = 1005;				/*자유게시판 상세보기 */
	public static final int FREE_BOARD_MODIFY = 1006; 			/*자유게시판 수정폼 자료가져오기 */
	public static final int FREE_BOARD_UPDATE = 1007;			/*자유게시판 수정처리*/
	public static final int FREE_BOARD_DELETE_PROC = 1008;		/*자유게시판 삭제처리*/
	public static final int FREE_BOARD_UPDATE_GOOD = 1009;		/*자유게시판 좋아요 처리*/
	public static final int FREE_BOARD_UPDATE_BAD =1010;			/*자유게시판 구려요 처리*/
	public static final int FREE_BOARD_SELECT_SEARCH = 1011;	/* 자유게시판: 검색 요청 처리 함수*/
	public static final int FREE_BOARD_REPLE_WRITE = 1012; 		/* 자유게시판: 댓글 작성*/
	public static final int MAIN_FREE_BOARD_SELECT = 1013;		/*메인페이지 자유게시판 리스트*/
	public static final int FREE_BOARD_REPLE_MODIFY = 1017;		/*자유게시판 댓글 수정*/
	public static final int FREE_BOARD_REPLE_DELETE = 1018;		/*자유게시판 댓글 삭제*/
	public static final int FREE_BOARD_REPLE_LIST =1019;			/*자유게시판 댓글 리스트 가져오기*/
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
//	public static final int
	
	
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
		case GET_BOARD_TOTAL:
			buff.append("SELECT COUNT(*) AS TOTAL FROM FREEBOARD WHERE ISSHOW = 'T' ");
			break;
		case GET_BOATD_LIST:
			buff.append("  SELECT * FROM	                                       ");
			buff.append("(SELECT row_number() OVER (ORDER BY NO  desc) RANK,	   ");
			buff.append("       NO,ID, FWRITER, FTITLE, FDATE, FHIT,FIP                   ");
			buff.append("  FROM FREEBOARD WHERE ISSHOW = 'T'	                   ");
			buff.append("  )	                                                   ");
			buff.append("  WHERE RANK BETWEEN ? AND ?	                           ");
			buff.append("  								                           ");
			break;
		case GET_BOATD_LISTS:
			buff.append("	SELECT NO, ID, FWRITER, FTITLE, FDATE, FHIT	");
			buff.append("	FROM FREEBOARD 							");
			buff.append("	WHERE ISSHOW = 'T'						");
			buff.append("	ORDER BY NO DESC						");
			break;
		case FREE_BOARD_INSERT:
			buff.append("INSERT INTO freeboard VALUES	");
			buff.append("(	(SELECT NVL(MAX(no),0) +1 FROM freeboard ), ");				
			buff.append("	?, ?, ?, ?, SYSDATE,	0, 0,0,	?,'T' ");
			buff.append(" ) ");
			break;
		case FREE_BOARD_UPDATE_HIT: //게시판 조회수 증가를 위한 처리 BoardView.java 2016.07.20
			buff.append("UPDATE                              ");
			buff.append("		freeboard                      ");
			buff.append("SET                                 ");
			buff.append("		FHIT = FHIT + 1          	");
			buff.append("WHERE                               ");
			buff.append("		NO = ?                    ");
			break;
		case FREE_BOARD_VIEW:
			buff.append("	SELECT * FROM freeboard     ");
			buff.append("		WHERE isshow ='T' 	    ");
			buff.append("	 	AND no = ?    			");
			break;
		case FREE_BOARD_MODIFY:
//			buff.append("	SELECT NO, FWRITER, FTITLE , FBODY FROM freeboard ");
			buff.append("	SELECT * FROM freeboard 	");
			buff.append("		WHERE isshow ='T' 		");
			buff.append("	 	AND no = ?    			");
			break;
		case FREE_BOARD_UPDATE:
			buff.append("UPDATE 				");
			buff.append("		freeboard 		");
			buff.append("SET 					");
			buff.append("		FTITLE = ?, 	");
			buff.append("		FBODY = ? 		");
			buff.append("WHERE 					");
			buff.append("		NO = ? 			");
			break;
		case FREE_BOARD_DELETE_PROC:
			buff.append("UPDATE freeboard		");
			buff.append("SET IsShow = 'F' 		");
			buff.append("WHERE 	NO = ?		 	");
			break;
		case FREE_BOARD_UPDATE_GOOD:
			buff.append(" UPDATE                 ");
			buff.append(" 	freeboard            ");
			buff.append(" SET                    ");
			buff.append("    FGOOD = FGOOD+1  	");
			buff.append(" WHERE                  ");
			buff.append("    no = ?            	");
			break;
		case FREE_BOARD_UPDATE_BAD:
			buff.append(" UPDATE                 ");
			buff.append(" 	freeboard            ");
			buff.append(" SET                    ");
			buff.append("    FBAD = FBAD+1  	");
			buff.append(" WHERE                  ");
			buff.append("    no = ?            	");
			break;
		case FREE_BOARD_SELECT_SEARCH:
			buff.append("	SELECT *						");				
			buff.append("	  FROM freeboard 				");			
			buff.append("	 WHERE IsShow = 'T' 			");					
			buff.append("	       AND # 					");//다이나믹 질의
			buff.append("	ORDER BY NO DESC		 		");			
			break;
		case FREE_BOARD_REPLE_WRITE:
			buff.append("INSERT INTO RBOARD VALUES (			 		 ");			
			buff.append("	(SELECT NVL(MAX(NO), 0) + 1 FROM RBOARD), 	");		 						
			buff.append("  ?, ?, ?, ?, ?, SYSDATE, ?, 'T' ,?	 		 ");			
			buff.append(" )			 						             ");
			break;
		case MAIN_FREE_BOARD_SELECT:
			buff.append("SELECT * FROM													");
			buff.append("	(SELECT ROWNUM, NO, FTITLE FROM FREEBOARD ORDER BY NO DESC)	");
			buff.append("WHERE ROWNUM <=7												");
			break;
		case FREE_BOARD_REPLE_MODIFY:
			buff.append("UPDATE rboard SET RTITLE = ?, RBODY = ? WHERE NO = ? AND CATEGORY = ? ");
			break;
		case FREE_BOARD_REPLE_DELETE:
			buff.append("UPDATE rboard SET isshow = 'F' WHERE NO = ? AND CATEGORY = ? ");
			break;
		case FREE_BOARD_REPLE_LIST:
			buff.append(" SELECT  *  FROM  rboard WHERE  reno  =  ? AND ISSHOW = 'T' AND CATEGORY = '1' ORDER BY NO DESC ");
			break;
			
			
			
			
			
			
		}
		
			
		return buff.toString(); 
	}
}

