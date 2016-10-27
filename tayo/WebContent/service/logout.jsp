<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
</head>
<body>
		<!-- 네이버 로그아웃 -->
<%-- 	<c:redirect url="http://nid.naver.com/nidlogin.logout?returl=http://www.naver.com"></c:redirect> --%>

		<!-- 프로젝트 세션 로그아웃 -->
	 	<c:redirect url="/"></c:redirect>
</body>
</html>