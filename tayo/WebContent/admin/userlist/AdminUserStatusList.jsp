<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/adminHeader.jsp" %>
<link href="/tayo/admin/css/bicycle.css" rel="stylesheet" type="text/css">

<script>
	$(document).ready(function(){
		
		  $("#check_all").click(function(){
			  if($("#check_all").prop("checked")){
		            $("input[name=check]").prop("checked",true);
		         }else{
		            $("input[name=check]").prop("checked",false);
		        }
		    });
		
		$("#abtn").click(function(){
			if($("input:checkbox[id='check']").is(":checked")==false){
				alert("등급을 변경 할 회원을 선택해 주세요.");
			}
			else{
				$("#user").attr("action","../admin/AdminUserStatusProc.do");
				$("#user").submit();
			}
		});
		
		$("#sbtn").click(function(){
			var search = $("#search").val();
			if(search == ""){
				alert("검색 정보를 입력해 주세요");
			}
			else{
				$("#user").attr("action","../admin/AdminUserSearch.do");
				$("#user").submit();
			}
		});
	});
</script>

<br>
<h1> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;유저정보</h2>

<hr>
<form id = "user" method = "post">
<table class="statusT">
<tr>
<br><br>
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
<br>
<table class="statusT">
	<tr>
		<td align = "center"><c:if test="${PINFO.startPage eq 1}">
					[이전]
				</c:if> <c:if test="${PINFO.startPage ne 1}">
				<a href="../admin/AdminUserStatusList.do?nowPage=${PINFO.startPage - 1}">[이전]</a>
			</c:if> <c:forEach var="page" begin="${PINFO.startPage}" end="${PINFO.endPage }">
				<c:if test="${page eq PINFO.nowPage}">
						[${page}]
					</c:if>
				<c:if test="${page ne PINFO.nowPage}">
					<a href="../admin/AdminUserStatusList.do?nowPage=${page}">[${page}]</a>
				</c:if>
			</c:forEach> <c:if test="${PINFO.endPage eq PINFO.totalPage}">
					[다음]
				</c:if> <c:if test="${PINFO.endPage ne PINFO.totalPage}">
				<a href="../admin/AdminUserStatusList.do?nowPage=${PINFO.endPage + 1}">[다음]</a>
			</c:if></td>
	</tr>
</table>
<br><br>

<table class="statusT">
	<tr>
		<td>
			<select name="searchlist" id="searchlist">
				<option value="1">이름</option> 
				<option value="2">ID</option> 
			</select> 
			<input type = "search" id = "search" name = "search">
			<input type = "button" id = "sbtn" value = "검색하기 ">
		</td>
		<td class = "l">
			<select name="rank" id="rank">
				<option value="1">관리자</option> 
				<option value="2">게시판 관리자</option> 
				<option value="3">일반</option> 
			</select> 
			<input type = "button" id = "abtn" value = "적용하기">
		</td>
		
	</tr>
</table>
<input type = "hidden" name ="nowPage" value = "${PINFO.nowPage}">
</form>

<%@ include file="/inc/bottom.jsp" %>