<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/adminHeader.jsp" %>
<link href="/tayo/admin/css/bicycle.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function(){
		$("#sbtn1").click(function(){
			var temp = $("#set1").val();
			if(temp == 0){
				alert("선택해 주세요");
			}
			else{
			$("#setting").attr("action","../admin/AdminSetBoardProc.do");
			$("#setting").submit();
			alert("적용 완료");
			}
		});
		
		$("#sbtn2").click(function(){
			var temp = $("#set2").val();
			if(temp == 0){
				alert("선택해 주세요")
			}
			else{
			$("#setting").attr("action","../admin/AdminSetBoardProc.do");
			$("#setting").submit();
			alert("적용 완료");
			}
		});
	});
</script>

<br>
<h1>
	&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;환경설정
	</h2>
	<hr>
	<br>
	<form method="post" id="setting">
		<table>
			<tr>
				<td>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 페이지 나눔 수</td>
				<td>&nbsp; &nbsp; &nbsp; <select name="set1" id="set1">
						<option value="0">--선택하세요--</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
				</select>
				</td>
				<td>&nbsp; &nbsp; &nbsp; <input type="button" id="sbtn1" value="적용완료">
				</td>
			</tr>
			<tr>
				<td><br> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 게시판 목록 수</td>
				<td><br> &nbsp; &nbsp; &nbsp; <select name="set2" id="set2">
						<option value="0">--선택하세요--</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
				</select></td>
				<td><br> &nbsp; &nbsp; &nbsp; <input type="button" id="sbtn2" value="적용완료"></td>
			</tr>
		</table>
	</form>
	<%@ include file="/inc/bottom.jsp"%>