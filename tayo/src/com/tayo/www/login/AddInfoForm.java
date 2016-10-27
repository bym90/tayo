package com.tayo.www.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;

public class AddInfoForm implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("AddInfoForm.java: Entered.");
		//퍼리미터 받기


		return "../login/AddInfoForm.jsp";
	}

}
