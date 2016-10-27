package com.tayo.www.data;

public class ReserveData { // 수정: 치현 0809 15:26
	private int 	reserNum; // 예약번호
	private String 	rday; // 예약일자
	private String 	rstime; // 예약시작시간
	private String 	retime; // 예약종료시간
	private String 	charge; // 청구요금
	private String 	byno; // 자전거번호
	private String 	id;
	private String 	name;
	private String 	tel;
	private String 	addtel;
	private String 	rstatus; // 예약상태.
	private String 	addr;
	private String 	gu;
	private String 	dong;
	private String 	jijeom;
	private String 	location;
	private String 	lotel;
	private String 	bstatus; // 자전거 상태.
	
	public String getBstatus() {
		return bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}

	public String getAddtel() {
		return addtel;
	}

	public void setAddtel(String addtel) {
		this.addtel = addtel;
	}

	public String getByno() {
		return byno;
	}

	public void setByno(String byno) {
		this.byno = byno;
	}

	public String getLotel() {
		return lotel;
	}

	public void setLotel(String lotel) {
		this.lotel = lotel;
	}

	private int bcount;

	public String getRstatus() {
		return rstatus;
	}

	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}

	public int getReserNum() {
		return reserNum;
	}

	public void setReserNum(int reserNum) {
		this.reserNum = reserNum;
	}

	public String getRday() {
		return rday;
	}

	public void setRday(String rday) {
		this.rday = rday;
	}

	public String getRstime() {
		return rstime;
	}

	public void setRstime(String rstime) {
		this.rstime = rstime;
	}

	public String getRetime() {
		return retime;
	}

	public void setRetime(String retime) {
		this.retime = retime;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getId() {
		return id;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getJijeom() {
		return jijeom;
	}

	public void setJijeom(String jijeom) {
		this.jijeom = jijeom;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
}
