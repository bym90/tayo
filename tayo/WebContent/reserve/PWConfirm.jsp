<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="conf" value="${PWCONFIRM}"/>
<c:if test="${conf}">
	<font color="red">비밀번호가 맞습니다.</font>
</c:if>
<c:if test="${not conf}">
	<font color="red">비밀번호가 틀렸습니다.</font>
</c:if>


