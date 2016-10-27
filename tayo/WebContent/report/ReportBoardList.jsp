<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/inc/header.jsp" %>
	
	<!-- 신고게시판 목록 보기 -->
	
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board<small> 신고게시판</small>
	        </h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a></li>
	            <li><a href="/tayo/free/FreeBoardList.do">게시판 </a></li>
	            <li class="active">신고게시판2</li>
	        </ol>
	    </div>
	</div>
	
	<!-- 여기서 부터 이제 바디에 들어갈 목록들 작성 -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<script>
<%-- 글쓰기 기능 넣기--%>
	$(document).ready(function(){
		$("#wBtn").click(function() {
			$(location).attr("href", "../report/ReportBoardWriteForm.do");
		});
	});
<%-- 검색기능 넣기.. --%>
	$(document).ready(function() {
		$("#sBtn").click(function() {
			$("#sfrm").attr("action", "../report/ReportBoardList.do");
			$("#sfrm").submit();
		});
	});
</script>
 
<BODY>

	<%--목록 보기 --%>
	<table border="1" width="1000" align="center">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>작성날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="data" items="${LIST}">
			<tr>
				<td>${data.no}</td>
				
				<td>
				
<%--답글 달기 --%>
<c:if test="${data.step ne 0}">
	<c:forEach var="step" begin="1" end="${data.step}">
       &nbsp;&nbsp;&nbsp;
	</c:forEach>
	==>
</c:if>
				</td>
				<td>${data.writer}</td>
				<td>${data.date}</td>
				<td>${data.hit}</td>
			</tr>		
		</c:forEach>
	</table>
	
<%--	페이지 나눔 기능 만들고 --%>
	<table border="1" width="1000" align="center">
		<tr>
			<td align="center">
			
	<%--	[이전] [1][2][3][4][5] [다음] --%>
				<c:if test="${PINFO.startPage eq 1}">
					[이전]
				</c:if>
				<c:if test="${PINFO.startPage ne 1}">
					<a href="../report/ReportBoardList.do?nowPage=${PINFO.startPage - 1}">[이전]</a>
				</c:if>
				<c:forEach var="page" begin="${PINFO.startPage}" end="${PINFO.endPage}">
					<c:if test="${page eq PINFO.nowPage}">
						[${page}]
					</c:if>
					<c:if test="${page ne PINFO.nowPage}">
						<a href="../report/ReportBoardList.do?nowPage=${page}">[${page}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${PINFO.endPage eq PINFO.totalPage}">
					[다음]
				</c:if>
				<c:if test="${PINFO.endPage ne PINFO.totalPage}">
					<a href="../report/ReportBoardList.do?nowPage=${PINFO.endPage + 1}">[다음]</a>
				</c:if>
			</td>
		</tr>	
	</table>
	
	<%--	검색기능 넣고 --%>
	<form method="POST" id="sfrm">
		<table border="1" width="1000" align="center">
			<tr>
				<td align="center">
					<select name="key" id="key">
						<option value="1">글쓴이</option>
						<option value="2">제목</option>
						<option value="3">본문</option>
						<option value="4">제목 + 본문</option>
					</select>
					<input type="search" name="text" id="text">
					<input type="button" id="sBtn" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	
<%--	글쓰기 기능 넣고 --%>
	<table border="1" width="1000" align="center">
		<tr>
			<td align="right">
				<input type="button" id="wBtn" value="글쓰기">
			</td>
		</tr>
	</table>
	
	
	
	
</BODY>
</HTML>
	



<%@ include file="/inc/bottom.jsp" %>

