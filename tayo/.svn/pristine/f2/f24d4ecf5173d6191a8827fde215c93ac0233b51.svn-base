<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="/tayo/admin/css/bicycle.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
			
		function sub(){
			var x = f.gu.value;
			$.ajax({
				url : "../admin/AdminBicycleLocation.do",
				data : "dong="+x,
				dataType : "json",
				type : "get",
				success : function(data){
 			var dong = data.DONG;
 			var re = "<select name = 'd'>";
 			re += "<option value ='' >선택하세요</option>"
  			$.each(dong,function(index){
  				var dongs = dong[index];
  				re += "<option value ='";
  				re += dongs;
  				re += "'>";
 				re += dongs;
  				re += "</option>"
			});
 			re += "</select>";
 			$("#dong").html(re);
					
		},
		error : function(xh,code,msg){
				alert("실패");
			}
	});
}
		
		function sub2(){
			var x = f.dong.value;
			$.ajax({
				url : "../admin/AdminBicycleLocation2.do",
				data : "jijeom="+x,
				dataType : "json",
				type : "get",
				success : function(data){
 			var jijeoms = data.JIJEOM;
 			var re = "<select name = 'j'>";
 			re += "<option value =''>선택하세요</option>"
  			$.each(jijeoms,function(index){
  				var jijeom = jijeoms[index];
  				re += "<option value ='";
  				re += jijeom;
  				re += "'>";
 				re += jijeom;
  				re += "</option>"
			});
 			re += "</select>";
 			$("#sp2").html(re);
 		
		},
		error : function(xh,code,msg){
				alert("실패");
			}
	});
}
		
$(document).ready(function(){
	$("#addbtn").click(function(){
		var bno = $("#bno").val();
		if(bno == ""){
			alert("자전거 이름을 입력해 주세요.");
			return;
		}
		else{
		$("#f").attr("action","../admin/AdminBicycleAddProc.do");
		$("#f").submit();
		window.opener.location.reload();
		}
	});
});
	

</script>
<body>
	<form id="f" method="post">
		<table class="addT">
			<tr>
				<td colspan="5">자전거 추가하기</td>
			</tr>
			<tr>
				<td colspan="3">지점선택</td>
				<td colspan="2">자전거이름</td>
			</tr>
			<tr>
				<td><select name="gu" id="gu" onchange="sub()">
						<option value="">선택하세요</option>
						<c:forEach var="data" items="${LIST}">
							<option value="${data.gu}">${data.gu}</option>
						</c:forEach>
				</select></td>
				<td><span id="sp1"> <select name="dong" id="dong" onchange="sub2()">
							<option value="">-----</option>
					</select>
				</span></td>
				<td><span id="sp2"> <select name="jijeom" id="jijeom">
							<option value="">-----</option>
					</select>
				</span></td>
				<td><input type="text" id="bno" name="bno"></td>
				<td><input type="button" id="addbtn" name="addbtn" value="완료"></td>
			</tr>
		</table>
	</form>
</body>
</html>