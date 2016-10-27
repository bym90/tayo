<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:if test="${RESULT}">
 	{"result" : "success"}
 </c:if>
 <c:if test="${not RESULT}">
 	{"result" : "fail"}
 </c:if>
