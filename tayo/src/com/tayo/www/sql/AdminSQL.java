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
public class AdminSQL {
	
	
	//자전거 현황 
	public static final int GET_TOTALBICICLE = 0000;
	public static final int SELECT_LIST = 0001;
	public static final int GET_BICYCLESTATUS = 9001;
	public static final int GET_LOCATION = 9002;
	public static final int GET_DONG = 9003;
	public static final int GET_JIJEOM = 9004;
	public static final int INSERT_BICYCLE = 9005;
	public static final int GET_SEARCH = 9006;
	public static final int DELETE_BICYCLE = 9007;
	public static final int UPDATE_STATUS = 9008;
	public static final int GET_JIJEOMSTATE = 9009;
	
	//유저 현황
	public static final int GET_TOTALUSER = 9100;
	public static final int GET_USERLIST = 9101;
	public static final int UPDATE_LANK = 9102;
	public static final int GET_USERSEARCH = 9103;
	
	//환경설정
	public static final int GET_COLROW = 9201;
	public static final int SET_COLROW = 9202;
	
	public static String getSQL(int code){
		StringBuffer buff = new StringBuffer();
	
		switch(code){
		
		//게시판 col, row 구하기
		case GET_COLROW : 
			buff.append("select ");
			buff.append("	srow,scol ");
			buff.append("from ");
			buff.append("	setting ");
			break;
			
		//게시판 col, row 값 변경
		case SET_COLROW :
			buff.append("update ");
			buff.append("	setting ");
			buff.append("set ");
			buff.append("	scol = ?, srow = ? ");
			break;
		
		//유저 검색
		case GET_USERSEARCH :
			buff.append("select 		");
			buff.append("	*			");
			buff.append("from			");
			buff.append("	userinfo	");
			buff.append("where			");
			buff.append("	#			");
			break;
					
		//유저 랭크 변경
		case UPDATE_LANK :
			buff.append("update 	 ");
			buff.append("	userinfo ");
			buff.append("set 		 ");
			buff.append("	rank = ? ");
			buff.append("where		 ");
			buff.append("	id  	 ");
			buff.append("	# 		 ");
			break;
		//유저 리스트
		case GET_USERLIST :
			buff.append("select ");
			buff.append("	* ");
			buff.append("from ");
			buff.append("	(select ");
			buff.append("		rownum as rno, ");
			buff.append("		id, ");
			buff.append(" 		tel, ");
			buff.append("		name, ");
			buff.append(" 		rank, ");
			buff.append(" 		jdate, ");
			buff.append(" 		ldate ");
			buff.append("	 from ");
			buff.append("		(select rownum, ");
			buff.append("	   	 id,name,rank,tel,jdate,ldate ");
			buff.append("		from ");
			buff.append("		 	userinfo))  ");
			buff.append("where ");
			buff.append("	rno between ? and ? ");
			buff.append("order by");
			buff.append("	rank asc ");
			break;
			
		//총 유저 정보 
		case GET_TOTALUSER :
			buff.append("select ");
			buff.append("	count(*) as total ");    
			buff.append("from ");
			buff.append("	userinfo ");
			break;
		
		//지점별 자전거 현황
		case GET_JIJEOMSTATE :
			buff.append("select ");
			buff.append("	count(*) as total ");
			buff.append("from  ");
			buff.append("	bicycleinfo ");
			buff.append("where ");
			buff.append(" 	jijeom = ? and bstatus = ? ");
			break;
			
			
		//자전거 상태 변경
		case UPDATE_STATUS :
			buff.append("update ");
			buff.append("	BICYCLEINFO ");
			buff.append("set ");
			buff.append("	BSTATUS = ? ");
			buff.append("where ");
			buff.append("	byno  ");
			buff.append("	# ");
			break;
			
		//자전거 삭제
		case DELETE_BICYCLE :
			buff.append("delete ");
			buff.append("from ");
			buff.append("	BICYCLEINFO ");
			buff.append("where 			");
			buff.append("	byno 		");
			buff.append("	 #	  		");
			break;
	
		//자전거 검색
		case GET_SEARCH :
			buff.append("select ");
			buff.append("	b.byno,b.BSTATUS,b.JIJEOM,r.rday,r.rstime,r.retime,r.id ");
			buff.append("from ");
			buff.append("	bicycleinfo b left outer join reserve r ");
			buff.append("on ");
			buff.append("	b.byno = r.byno ");	
			buff.append("where ");
			buff.append("	b.byno = ? ");
			break;
		
		case GET_DONG : 
			buff.append("select distinct dong from station where gu = ? ");
			break;	
			
		case GET_JIJEOM : 
			buff.append("select JIJEOM from station where dong = ? ");
			break;	
				
		case GET_BICYCLESTATUS :		
			buff.append("select			");
			buff.append("* 	   			");
			buff.append("from 			");
			buff.append("	BICYCLEINFO ");
			break;
		case GET_LOCATION :
			buff.append("select 			");
			buff.append("   distinct gu     ");
			buff.append("from				");
			buff.append("	STATION			");
			break;
	
		case INSERT_BICYCLE :
			buff.append("insert 		 ");
			buff.append("into			 ");
			buff.append("	BICYCLEINFO  ");
			buff.append("values(?,'1',?)   ");
			break;
			
		case GET_TOTALBICICLE :
			buff.append("select ");
			buff.append("	count(*) as total ");    
			buff.append("from ");
			buff.append("	BICYCLEINFO ");
			buff.append(" # ");
			break;
			
		case SELECT_LIST : 
			buff.append("select ");
			buff.append("	* ");
			buff.append("from ");
			buff.append("	(select ");
			buff.append("		rownum as rno, ");
			buff.append("		byno, ");
			buff.append("		jijeom, ");
			buff.append(" 		bstatus, ");
			buff.append("		rstime, ");
			buff.append("		retime, ");
			buff.append("		rday, ");
			buff.append("		id ");
			buff.append("	 from ");
			buff.append("		(select rownum, ");
			buff.append("	   	 b.byno as byno, ");
			buff.append("		 b.jijeom as jijeom, ");
			buff.append("		 b.bstatus as bstatus, ");
			buff.append("		 r.rday as rday, ");
			buff.append("		 r.rstime as rstime, ");
			buff.append("		 r.retime as retime, ");
			buff.append("		 r.id as id ");
			buff.append("		from ");
			buff.append("		 	bicycleinfo b LEFT OUTER JOIN reserve r  ");
			buff.append("		on  ");
			buff.append("			b.byno = r.byno  ");
			buff.append("			#  order by b.byno asc )) ");
			buff.append("where ");
			buff.append("  rno between ? and ? ");
			buff.append("order by ");
			buff.append("byno asc ");
			break;

		}
		return buff.toString(); 
	}
}
