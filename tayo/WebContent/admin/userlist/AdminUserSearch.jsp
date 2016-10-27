<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/adminHeader.jsp" %>
<link href="/tayo/admin/css/bicycle.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function(){
		$("#list").click(function(){
			$("#search").attr("action","../admin/AdminUserStatusList.do?nowPage=${NOWPAGE}");
			$("#search").submit();
		});
	});
</script>
<br><br>
<form id = "search" method = "post">
	<table class="statusT">

		<tr>
			<th><input type="checkbox" name="check_all" id="check_all" /></th>
			<td>아이디</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>가입일</td>
			<td>등급</td>
			<td>최근 접속일</td>
		</tr>
		<tr>
			<td colspan="7"><hr></td>
		</tr>
		<c:forEach var="data" items="${LIST}">
			<tr>
				<td><input type="checkbox" name="check" id="check" value="${data.email}" /></td>
				<td>${data.email}</td>
				<td>${data.userName}</td>
				<td>${data.cellPhone}</td>
				<td>${data.jdate}</td>
				<td>${data.rank}</td>
				<td>${data.ldate}</td>
			</tr>

			<tr>
				<td colspan="7"><hr></td>
			</tr>
		</c:forEach>
	</table>
	<table class="statusT">
		<tr>
			<td><input type="button" id="list" value="목록보기"></td>
			<td align = "right"><select name="rank" id="rank">
					<option value="1">관리자</option>
					<option value="2">게시판 관리자</option>
					<option value="3">일반</option>
			</select> <input type="button" id="abtn" value="적용하기"></td>
		</tr>
	</table>
	<input type = "hidden" name ="nowPage" value = "${PINFO.nowPage}">
</form>
<%@ include file="/inc/bottom.jsp" %>