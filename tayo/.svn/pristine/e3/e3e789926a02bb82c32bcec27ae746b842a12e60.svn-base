<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/inc/header.jsp" %>
<%--신고게시판 글수정 페이지 요청 뷰 --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#wBtn").click(function(){
			$("#mfrm").submit();
		});
	});
</script>
<BODY>
<c:if test="${CHECK}">

	<%--	폼 보자 --%>
	<form id="mfrm" method="POST" action="../report/ReportBoardModifyProc.do">
		<input type="hidden" name="no" value="${NO}">
		<input type="hidden" name="nowPage" value="${NOWPAGE}">
		
		<table width="800" border="1" align="center">
			<tr>
				<td>글쓴이</td>
				<td>${sessionScope.NICK}</td>
			</tr>		
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" id="title" value="${DATA.title}">
				</td>
			</tr>		
			<tr>
				<td>본문</td>
				<td>
					<textarea name="body" id="body">${DATA.body}</textarea>
				</td>
			</tr>		
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="wBtn" value="수정하기">
					<input type="button" id="rBtn" value="다시쓰기">
					<input type="button" id="lBtn" value="목록보기">
					<input type="button" id="vBtn" value="상세보기">
				</td>
			</tr>		
		</table>
	</form>
</c:if>
<c:if test="${not CHECK}">
	<%--	다른곳으로 보낼 예정이다. 
			자바 스크립트는 함수가 아니면 이 문서가 실행될 때 같이 실행된다.
	--%>
	<script>
		confirm("비밀번호가 틀려서 수정할 수 없습니다.");
		location.href = "../report/ReportBoardView.do?no=${NO}&nowPage=${NOWPAGE}";
	</script>
</c:if>



<%@ include file="/inc/bottom.jsp" %>