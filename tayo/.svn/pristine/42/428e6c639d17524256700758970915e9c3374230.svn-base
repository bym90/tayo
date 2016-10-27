<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/adminHeader.jsp" %>
<link href="/tayo/admin/css/bicycle.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function(){
		$("#list").click(function(){
				$(location).attr("href","../admin/main.do?nowPage=${NOWPAGE}");
		});
		$("#delete").click(function(){
		
			if($("input:checkbox[id='check']").is(":checked")==false){
				alert("삭제 할 자전거를 선택해 주세요.");
				return;
			}
			else{
			$("#option").attr("action","../admin/AdminBicycleDeleteProc.do");
			$("#option").submit();
			alert("삭제완료.");
			}
		})
	});

</script>
<br><br>
<form id = "option" method = "post">
	<table class="statusT">

		<tr>
			<th><input type="checkbox" name="check" id="check" /></th>
			<td>자전거 번호</td>
			<td>지점(위치)</td>
			<td>ID</td>
			<td>예약날짜</td>
			<td>대여시작시간</td>
			<td>종료시간</td>
			<td>상태</td>
		</tr>
		<tr>
			<td colspan="9"><hr></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="check" id="check" value="${DATA.bno}" /></td>
			<td>${DATA.bno}</td>
			<td>${DATA.blocation }</td>
			<td>${DATA.id}</td>
			<td>${DATA.rday}</td>
			<td>${DATA.stime}</td>
			<td>${DATA.etime}</td>
			<td>${DATA.bstaus}</td>
		</tr>
		<tr>
			<td colspan="9"><hr></td>
		</tr>
	</table>
	<table class="statusT">
		<tr>
			<td><input type="button" id="list" value="목록보기"> <input type="button" id="delete" value="삭제하기">
			<td>
		</tr>
	</table>
	<input type = "hidden" name ="nowPage" value = "${NOWPAGE}">
</form>


<%@ include file="/inc/bottom.jsp" %>