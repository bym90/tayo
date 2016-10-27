package com.tayo.www.login;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.MemberDAO;

public class AddInfoProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		System.out.println("AddInfoProc.java: Entered ");
		//폼의 정보들을 받아 온다. 받아짐 확인 됨.
		HttpSession session = req.getSession();
		String email 		= (String) session.getAttribute("ID");
		System.out.println("사용자ID: "+email);
		String userName		= req.getParameter("userName");
		String birth 		= req.getParameter("pickDate");
		String cellPhone 	= req.getParameter("cellPhone");
		String capchaInput  = req.getParameter("capchaInput");
		String zip1 		= req.getParameter("zip1");
		String zip2 		= req.getParameter("zip2");
		String addr 		= req.getParameter("addr");
		String addrSub  	= req.getParameter("addrSub");

		String addrTotal = "(우)"+zip1+"-"+zip2+" "+addr+" "+addrSub;
		System.out.println("AddInfoProc.java: 전체주소: "+addrTotal);

		String rentPW = req.getParameter("rentPW");

		String temp = req.getParameter("infoAgree");


		// 치현: 이 부분은 추후에 지워도 될 듯 하다.
		boolean infoAgree = false;

		if(temp == null || temp.length()==0){
			infoAgree = false; //개인정보 동의 안 함.
		}else{
			infoAgree = true; //개인정보 동의
		}

		//자료 콩껍질에 넣는다.
		UserData data = new UserData();
		data.setEmail(email);
		data.setUserName(userName);
		data.setBirth(birth);
		data.setCellPhone(cellPhone);
		data.setCapchaInput(capchaInput);
		data.setAddr(addrTotal);
		data.setPw(rentPW);
		data.setAgree(infoAgree);

		//dao를 이용해서 실행한다.
		MemberDAO dao = new MemberDAO();
		dao.insertInfo(data);
		
		ResultSet rs = dao.selectUserInfo(email);

		
		try {
			if(rs.next()){
				data.setUserName(rs.getString("NAME"));
				data.setCellPhone(rs.getString("TEL"));
				data.setAddr(rs.getString("ADDR"));
				data.setPw(rs.getString("PW"));
				data.setRank(rs.getString("RANK"));
				data.setStatus(rs.getInt("STATUS"));
		}
				dao.updateLogin(email);
		} catch (Exception e) {
			System.out.println("사용자정보 요청 오류:"+e);
		}finally{
			dao.close();
		}
		
		
		session.setMaxInactiveInterval(10800);
		System.out.println("세션유지시간: "+session.getMaxInactiveInterval()/60+"분");
		
		/*DB계정 정보*/
		session.setAttribute("NAME", data.getUserName());
		session.setAttribute("TEL", data.getCellPhone());
		session.setAttribute("ADDR", data.getAddr());
		session.setAttribute("PW", data.getPw());
		session.setAttribute("RANK", data.getRank());
		session.setAttribute("STATUS", data.getStatus());
		

		req.setAttribute("data", data);
		return "../login/AddInfoProc.jsp";
	}

}