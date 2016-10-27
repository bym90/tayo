<%@ page language="java" contentType="text/plain; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


{"JIJEOM" : [
<c:forEach var= "data" items = "${DATA}" varStatus = "star">
	<c:if test = "${star.last}">
	"${data.jijeom}"
	</c:if>
	<c:if test = "${not star.last}">
	"${data.jijeom}",
	</c:if>
</c:forEach>
]}