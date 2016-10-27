package com.tayo.www.sql;

public class ReserveSQL {
	public static final int SELECT_ADDINFO = 1101;
	public static final int SELECT_GU = 2101;
	public static final int SELECT_DONG = 2201;
	public static final int SELECT_JIJEOM = 2301;
	public static final int SELECT_LOCATION = 2401;
	public static final int CONFIRM_PW = 2501;
	public static final int RESERVE_PROC = 2601;
	public static final int SELECT_BYINFO = 2701;
	public static final int UPDATE_BCOUNT = 2801;
	public static final int SELECT_BCOUNT = 2901;
	public static final int UPDATE_BSTATUS = 2102;
	public static final int COUNT_TOTAL = 3001;
	public static final int GET_RESERVE_LIST = 3002;

	public static String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code){
		case GET_RESERVE_LIST:
			buff.append("SELECT ");
			buff.append("	r.resernum RESERNUM, r.rday RDAY,r.location LOCATION, s.jijeom JIJEOM, s.stel STEL, ");
			buff.append("	r.byno BYNO, r.rstime RSTIME,r.retime RETIME, r.charge CHARGE, b.bstatus BSTATUS ");
			buff.append("FROM reserve r INNER JOIN station s ");
			buff.append("ON(r.location = s.location) ");
			buff.append("INNER JOIN bicycleinfo b ");
			buff.append("ON(r.byno = b.byno) ");
			buff.append("WHERE id= ? ");
			buff.append("ORDER BY r.resernum DESC");
			break;
		//치현: 한 사람이 예약한 내역의 전체 개수 반환.
		case COUNT_TOTAL:
			buff.append("SELECT ");
			buff.append("	COUNT(*) AS TOTAL ");
			buff.append("FROM RESERVE ");
			buff.append("	WHERE ID = ? ");
			break;
		case SELECT_ADDINFO:
			buff.append("SELECT ");
			buff.append("	NAME, ");
			buff.append("	TEL, ");
			buff.append("	ADDR ");
			buff.append("FROM ");
			buff.append("	USERINFO ");
			buff.append("WHERE ");
			buff.append("	ID = ? ");
			break;
		case SELECT_GU:
			buff.append("SELECT	");
			buff.append("	DISTINCT GU ");
			buff.append("FROM ");
			buff.append("	STATION ");
			break;
		case SELECT_DONG:
			buff.append("SELECT ");
			buff.append("	DISTINCT DONG ");
			buff.append("FROM ");
			buff.append("	STATION ");
			buff.append("WHERE ");
			buff.append("	GU = ? ");
			break;
		case SELECT_JIJEOM:
			buff.append("SELECT ");
			buff.append("	DISTINCT JIJEOM ");
			buff.append("FROM ");
			buff.append("	STATION ");
			buff.append("WHERE	");
			buff.append("	DONG = ? ");
			break;
		case SELECT_LOCATION:
			buff.append("SELECT ");
			buff.append("	LOCATION, ");
			buff.append("   STEL ");
			buff.append("FROM ");
			buff.append("	STATION ");
			buff.append("WHERE ");
			buff.append("	JIJEOM = ?  ");
			break;
		case CONFIRM_PW:
			buff.append("SELECT ");
			buff.append("	COUNT(*) AS COUNT ");
			buff.append("FROM ");
			buff.append("	USERINFO ");
			buff.append("WHERE ");
			buff.append("	id = ? ");
			buff.append("and ");
			buff.append("	pw = ? ");
			break;
		case SELECT_BYINFO:
			buff.append("SELECT ");
			buff.append("	BYNO ");
			buff.append("FROM ");
			buff.append("	BICYCLEINFO ");
			buff.append("WHERE ");
			buff.append("	JIJEOM = ? ");
			buff.append("AND ");
			buff.append("	BSTATUS = 1 ");
			break;
		case RESERVE_PROC:
			buff.append("INSERT ");
			buff.append("INTO ");
			buff.append("	RESERVE ");
			buff.append("	VALUES ");
			buff.append("	((SELECT NVL(MAX(RESERNUM),0) + 1 FROM RESERVE), ?, ?, ?, ?, ?, ?, ?, ?) ");
			break;
		case UPDATE_BCOUNT:
			buff.append("UPDATE ");
			buff.append("	STATION ");
			buff.append("SET ");
			buff.append(" 	BCOUNT = BCOUNT - 1 ");
			buff.append("WHERE ");
			buff.append("	JIJEOM = ? ");
			break;
		case SELECT_BCOUNT:
			buff.append("SELECT ");
			buff.append("	count(*) AS BCOUNT ");
			buff.append("FROM ");
			buff.append("	BICYCLEINFO b ");
			buff.append("INNER JOIN ");
			buff.append("	STATION s ");
			buff.append("ON ");
			buff.append("	(b.JIJEOM=S.JIJEOM) ");
			buff.append("WHERE ");
			buff.append("	b.BSTATUS = '1' ");
			buff.append("AND ");
			buff.append("	s.JIJEOM = ? ");
			break;
		case UPDATE_BSTATUS:
			buff.append("UPDATE ");
			buff.append("	BICYCLEINFO ");
			buff.append("SET ");
			buff.append("	BSTATUS = '2' ");
			buff.append("WHERE ");
			buff.append("	BYNO = ? ");

			break;
		}
		return buff.toString();
	}

}



