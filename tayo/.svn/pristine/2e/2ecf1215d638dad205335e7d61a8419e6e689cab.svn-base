<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/inc/header.jsp" %>
<%-- 신고게시판 글쓰기 페이지 요청 --%>
<hr>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>

	<%--글쓰기 폼 이벤트 요청하기--%>
	$(document).ready(function(){
		$("#wBtn").click(function(){
	
			<%--입력 안하면 뜸 차례대로 뜸..--%>
			var	title = $("#title").val();
			if(title == "") {
				alert("제목을 입력해 주십시오");
				return;
			}
			var	body = $("#body").val();
			if(body == "") {
				alert("본문 내용을 입력해 주십시오");
				return;
			}
			var	pw = $("#password").val();
			if(pw == "") {
				alert("비밀 번호를 입력해 주십시오");
				return;
			}
			
			<%--글쓰기 폼 요청하기--%>
			$("#wfrm").attr("action", "../report/ReportBoardWriteProc.do");
			$("#wfrm").submit();
		});
		
			<%--다시쓰기 --%>
		$("#rBtn").click(function(){
			$("#wfrm").each(function(){
				this.reset();
			});			
		});
		
		<%--목록보기 폼으로 가기--%>
		$("#lBtn").click(function(){
			$(location).attr("href", "../report/ReportBoardList.do");
		});
	});	
</script>
<BODY>

<%-- 	<c:if test="${ISLOGIN eq false}"> --%>
	 
<%--	세션이 없으면 적당한 화면으로 내보내기 바란다. --%>
<%-- 		<c:redirect url="../" /> --%>
<%-- 	</c:if> --%>
	
<%--	글쓰기 폼을 만들어 준다. --%>
	<form method="POST" id="wfrm">
		<table width="800" border="1" align="center">
			<tr>
				<td>글쓴이</td>
				<td>
					<input type="text" value="${sessionScope.NICK}" readonly>	
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" placeholder="예) 더진한 커피우유" id="title">
				</td>
			</tr>
			<tr>
				<td>본문</td>
				<td>
					<textarea name="body" placeholder="예) 하고 싶은 이야기 " id="body"></textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="password" id="password">
					삭제나 수정을 위해서 필요합니다.
				</td>
			</tr>
			
			<%--글쓰기 버튼 만들기 --%>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="wBtn" value="글쓰기">
					<input type="button" id="rBtn" value="다시쓰기">
					<input type="button" id="lBtn" value="목록보기">
				</td>
			</tr>
		</table>
	</form>


<%@ include file="/inc/bottom.jsp" %>

