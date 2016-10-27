<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{"JIJEOM" : [
<c:forEach var="data" items="${JIJEOM}" varStatus="status">
	<c:if test="${status.last}">
		"${data.jijeom}"
	</c:if>
	<c:if test="${not status.last}">
		"${data.jijeom}",
	</c:if>
</c:forEach>

]}