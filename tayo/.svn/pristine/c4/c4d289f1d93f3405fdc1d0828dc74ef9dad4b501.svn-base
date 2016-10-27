<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>
<script>
</script>
	<!-- 자유게시판 목록 보기 -->
		<hr>
		<div class="row">
		    <div class="col-lg-12">
		        <h1 class="page-header">Board<small> 자유게시판</small>
		        </h1>
		        <ol class="breadcrumb">
		            <li><a href="/tayo">홈 </a></li>
		            <li><a href="/tayo/free/FreeBoardList.do">게시판 </a></li>
		            <li class="active">자유게시판</li>
		        </ol>
		    </div>
		</div>
	<!-- /.row -->
		<form method="POST" id="sFrm" name="sFrm">
			<input type="hidden" name="page" value="${PINFO.nowPage }">
			<select class="SELECTSTYLE2" name="key" id="key">
				<option value="1">글쓴이</option>
				<option value="2">제목</option>
				<option value="3">본문</option>
				<option value="4">제목+본문</option>
			</select>
			<input class="SEARCHBAR1" type="search" name="search" id="search" placeholder="Search.." value="${SEARCH }">
			<input type="button" id="sBtn" class="btn btn-warning" onclick="board.freeBoardSearch();" value="검색하기">
		</form>
	<c:choose>
		<c:when test="${empty LIST }">
			<hr>
			<table class="table">
				<tr>
					<td align="center">게시물이 없습니다.</td>
				</tr>
				<tr>
					<td align="right">
						<a class="btn btn-warning" href="./FreeBoardWriteForm.do">글쓰기</a>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<form name="boardFrm" id="boardFrm" method="POST">
				<input type="hidden" name="page" value="${PINFO.nowPage }">
				<input type="hidden" name="fno" value="${data.no }">
				<table class="table">
					<thead>
						<tr>
							<th width="5%">번호</th>
							<th width="50%">제목</th>
							<th width="8%">작성자</th>
							<th width="8%">조회수</th>
							<th width="8%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="data" items="${LIST}" >
						<tr>
							<td>${data.no }</td>
							<td><a href="./FreeBoardView.do?no=${data.no}&page=${PINFO.nowPage}">${data.title}</a></td>
							<td>${data.writer }</td>
							<td>${data.hit }</td>
							<td>${data.date }</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					<tr>
						<td colspan="5" align="right">
<!-- 							<a class="btn btn-warning" href="./FreeBoardWriteForm.do">글쓰기</a> -->
							<input type="button" class="btn btn-warning" onclick="board.freeBoardWriteForm();" value="글쓰기">
						</td>
					</tr>
					</tfoot>
				</table>
				<div style="text-align:center;">
					<ul class="pagination1" style="margin:auto; float:m;">
						<c:if test="${PINFO.startPage eq 1}"><li><a href="#">[«5페이지]</a></li></c:if>
						<c:if test="${PINFO.startPage ne 1}"><li><a href="./FreeBoardList.do?page=${PINFO.startPage - 1}">[<<5페이지]</a></li></c:if>
						<c:if test="${PINFO.nowPage eq 1 }"><li><a href="#">[«]</a></li></c:if>
						<c:if test="${PINFO.nowPage ne 1 }"><li><a href="./FreeBoardList.do?page=${PINFO.nowPage -1 }">[«]</a></li></c:if>
						<c:forEach var="temp" begin="${PINFO.startPage}" end="${PINFO.endPage}">
							<c:choose>
								<c:when test="${PINFO.nowPage eq temp}">
									<li><a class="active" href="./FreeBoardList.do?page=${temp }">[ ${temp} ]</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="./FreeBoardList.do?page=${temp }">[ ${temp} ]</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${PINFO.nowPage ne PINFO.totalPage }"><li><a href="./FreeBoardList.do?page=${PINFO.nowPage +1 }">[»]</a></li></c:if>
						<c:if test="${PINFO.nowPage eq PINFO.totalPage }"><li><a href="#">[»]</a></li></c:if>
						<c:if test="${PINFO.endPage eq PINFO.totalPage}"><li><a href="#">[5페이지»]</a></li></c:if>
						<c:if test="${PINFO.endPage ne PINFO.totalPage}"><li><a href="./FreeBoardList.do?page=${PINFO.endPage + 1}">[5페이지>>]</a></li></c:if>
					</ul>
				</div>
			</form>
		</c:otherwise>
	</c:choose>

<%@ include file="/inc/bottom.jsp" %>