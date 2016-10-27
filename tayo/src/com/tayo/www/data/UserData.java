package com.tayo.www.data;

public class UserData {
	private String email;
	private String nick;
	private String gender;
	private String birthday;
	private String profile_image;
	private String userName;
	private String birth;
	private String cellPhone;
	private String capchaInput;
	private String pw;			/*사용자 대여번호*/
	private String addr;		/*사용자 주소*/
	private String rank;			/*계정 등급*/
	private int status;			/*계정 상태*/
	private String jdate;
	private String ldate;
	private boolean agree;

	
	public String getRank() {
		return rank;
	}
	public int getStatus() {
		return status;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public boolean getAgree() {
		return agree;
	}
	public void setAgree(boolean agree) {
		this.agree = agree;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getCapchaInput() {
		return capchaInput;
	}

	public void setCapchaInput(String capchaInput) {
		this.capchaInput = capchaInput;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public String getNick() {
		return nick;
	}

	public String getGender() {
		return gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getJdate() {
		return jdate;
	}
	public void setJdate(String jdate) {
		this.jdate = jdate;
	}
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	

}