<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타요! 타요!</title>
</head>
<body>
	<c:redirect url="./FreeBoardList.do">
		<c:param name="page" value="${PAGE }"></c:param>
	</c:redirect>
</body>
</html>