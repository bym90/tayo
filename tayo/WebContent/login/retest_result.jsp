<%@ page contentType="text/html; charset=utf-8" language="java" import="net.tanesha.recaptcha.*" errorPage="" %><%
	String check = "Y";
	ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
	reCaptcha.setPrivateKey("6LcXPScTAAAAALD34Nhyi9Gv34lfDotJdv731C3Z");
	//reCaptcha.setPrivateKey("6LcN4yUTAAAAABt4OLJaO_-XoDg0kqqijYtF7dVn");
	
	String host 						= request.getParameter("host");
	String challenge 					= request.getParameter("challenge");
	String res 							= request.getParameter("response");
	ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(host, challenge, res);
	if (reCaptchaResponse.isValid()) {
		System.out.println("true");
		check = "Y";
	} else {
		System.out.println("false");
		check = "N";
	}
	out.print(check);
%>