<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/inc/header.jsp" %>

<%--신고게시판 상세보기 요청 뷰--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	<%--목록보기 기능 만들기--%>
	$(document).ready(function(){
		$("#lBtn").click(function(){
			
			<c:if test="${TARGET eq 'list'}">
				$(location).attr("href", "../report/ReportBoardList.do?nowPage=${NOWPAGE}");
			</c:if>
// 			<c:if test="${TARGET eq 'search'}">
// 				$(location).attr("href", "../AnBoard/BoardSearch.bmw?nowPage=${NOWPAGE}&key=${KEY}&text=${TEXT}");
// 			</c:if>
// 		});
		
// 		$("#gBtn").click(function(){
// 			$(location).attr("href", "../report/GoodBadProc.bmw?no=${DATA.no}&nowPage=${NOWPAGE}&flag=1");
// 		});
		
// 		$("#bBtn").click(function(){
// 			$(location).attr("href", "../report/GoodBadProc.bmw?no=${DATA.no}&nowPage=${NOWPAGE}&flag=2");
// 		});
 		<%--게시물 삭제하기 기능 만들기  --%>
// 		$("#dBtn").click(function(){
// 			$pw = prompt("비밀번호를 입력해주세여", "");
// 			$("#password").val($pw);
			
// 			$("#imsifrm").attr("action", "../report/DeleteProc.bmw");
// 			$("#imsifrm").submit();
// 		});
	<%--답글달기 기능 만들기--%>
		$("#aBtn").click(function(){
			$(location).attr("href", "../report/ReportBoardWriteForm.do?no=${DATA.no}&nowPage=${NOWPAGE}");
		});
		
	<%--수정하기 기능 만들기 --%>
		$("#mBtn").click(function(){
			var	pw = prompt("비밀번호를 입력해 주세요", "비밀번호");
			$("#password").val(pw);
			$("#imsifrm").attr("method", "POST").attr("action", "../report/ReportBoardModifyForm.do").submit();
			});
	
</script>
<BODY>
<%--	상세보기 보여주고 --%>
	<table width="800" border="1" align="center">
		<tr>
			<td>번호</td>
			<td>${DATA.no}</td>
			<td>조회수</td>
			<td>${DATA.hit}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${DATA.writer}</td>
			<td>작성날짜</td>
			<td>${DATA.date}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${DATA.title}</td>
		</tr>
		<tr>
			<td>본문</td>
			<td colspan="3">${DATA.body}</td>
		</tr>
	</table>
<%-- <%--	기타 기능 만들고 --%> --%>
	<table width="800" border="1" align="center">
		<tr>
			<td align="center">
<%-- 				<input type="button" id="gBtn" value="좋아요 ( ${DATA.good} ) "> --%>
<%-- 				<input type="button" id="bBtn" value="나빠요 ( ${DATA.bad} ) "> --%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" id="lBtn" value="목록보기">
<c:if test="${sessionScope.ID eq DATA.writer}">				
				<input type="button" id="mBtn" value="수정하기">
				<input type="button" id="dBtn" value="삭제하기">
</c:if>				
				<input type="button" id="aBtn" value="답글달기">
			</td>
		</tr>
	</table>
	
<%--	임시로 사용할 폼을 만든다. --%>	
	<form id="imsifrm">
	
<%--	이 안에 필요한 모든 데이터를 숨겨 놓는다. --%>
		<input type="hidden" name="no" id="no" value="${DATA.no}">
		<input type="hidden" name="nowPage" id="nowPage" value="${NOWPAGE}">
		<input type="hidden" name="password" id="password">
	</form>


<%@ include file="/inc/bottom.jsp" %>