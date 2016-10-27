<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{"DONG" : [
<c:forEach var="data" items="${DONG}" varStatus="status">
	<c:if test="${status.last}">
		"${data.dong}"
	</c:if>
	<c:if test="${not status.last}">
		"${data.dong}",
	</c:if>
</c:forEach>

]}

