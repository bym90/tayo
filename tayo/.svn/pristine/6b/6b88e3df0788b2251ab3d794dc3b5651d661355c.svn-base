package com.tayo.www.service;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.UserData;
import com.tayo.www.sql.MemberDAO;

public class loginProc implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		// 파라메터 받기
		String email = req.getParameter("email");
		String nick = req.getParameter("nick");
		String gender = req.getParameter("gender");
		String birthday = req.getParameter("birthday");
		String profile = req.getParameter("profile");

		System.out.println("email: "+email);
//		System.out.println("nick: "+nick);
//		System.out.println("gender: "+gender);
//		System.out.println("birthday: "+birthday);
//		System.out.println("profile: "+profile);

		MemberDAO dao = new MemberDAO();
		
		
		System.out.println("아이디 체크 중");
		boolean isCheck = dao.checkID(email);

		System.out.println("아이디 있냐?: "+isCheck);

		if(isCheck){
			//정보가 있으니 메인을 보여주며 회원정보를 등록하자.
			HttpSession session = req.getSession();
			ResultSet rs = dao.selectUserInfo(email);

			UserData data = new UserData();
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
			}
			finally{
				dao.close();
			}
		

			session.setMaxInactiveInterval(10800);
			System.out.println("세션유지시간: "+session.getMaxInactiveInterval()/60+"분");
			/*네이버 정보*/
			session.setAttribute("ID", email);
			session.setAttribute("NICK", nick);
			session.setAttribute("GENDER", gender);
			session.setAttribute("BIRTHDAY", birthday);
			session.setAttribute("PROFILE", profile);

			/*DB계정 정보*/
			session.setAttribute("NAME", data.getUserName());
			session.setAttribute("TEL", data.getCellPhone());
			session.setAttribute("ADDR", data.getAddr());
			session.setAttribute("PW", data.getPw());
			session.setAttribute("RANK", data.getRank());
			session.setAttribute("STATUS", data.getStatus());

		}else{
			//부가 정보를 받자.
			System.out.println("loginProc.java: 처음 방문한 회원입니다.");
			HttpSession session = req.getSession();
			session.setAttribute("ID", email);
		}
	



		req.setAttribute("RESULT", isCheck);
		return "../service/loginProc.jsp";
	}
}

