<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>
	<!-- 자유게시판 목록 보기 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">게시판<small> 자유게시판</small>
	        </h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a></li>
	            <li><a href="/tayo/free/FreeBoardList.do">게시판 </a></li>
	            <li class="active">자유게시판</li>
	        </ol>
	    </div>
	</div>
	<!-- /.row -->
	
	<form id="boardFrm" name="boardFrm" method="POST">
		<input type="hidden" name="page" value="${PAGE}">
		<input type="hidden" name="no" value="${DATA.no}">
		<table class="table">
			<tr>
				<td width="15%">작성자</td>
				<td width="*"><input type="text" name="writer" id="writer" type="text" class="form-control W50" readonly="readonly" value="${DATA.writer }(${sessionScope.ID })"></td>
				<td width="20%"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title" type="text" class="form-control W50" value="${DATA.title }"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">
					<textarea name="ir1" id="ir1" style="width:900px; height:300px;">${DATA.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="TAR">
					<input type="button" id="wBtn" name="wBtn" class="btn btn-info" value="작성하기" onclick="board.freeBoardModifyProc();" >
				</td>
				<td></td>				
			</tr>
		</table>

	</form>


<%@ include file="/inc/bottom.jsp" %>