<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>

<%--종헌 CSS 수정 --%>

<style>
	div.wrapper{width: 1000px;}

/* 	div.leftMenu{width: 200px;height: 600px;float: left;background-color:#FFFFFF; border: solid grey 1px;} */
	div.rightMenu{width: 800px;height: 600px;float: center;text-align: center; margin-top: 20px; }
	table.main{width: 500px;  } /* border-top: 3px solid #f1f1f1;  border-bottom: 2px solid #000000; border: 3px solid #f1f1f1 ; */	
	tr{height: 50px;} /*border-bottom: 1px solid #000000;*/
	td.mainLeft{text-align: left;} /*border-right: 1px solid #000000; */
	td.mainRight{text-align: left;}
	input.text{width: 95%;height: 95%;}
	table.below{width: 500px;}
	h4.leftMenu{color:black}
	td.below{text-align: center;width: 500px;}
	input.below{}
	ul.mypageLeft{list-style-type: none;padding-left:0;background-color: #FFFFFF;}
	li a{display: block;color:black;padding:8px 16px;text-decoration:none;}
	li a:visited{color:black}
	li a:hover{background-color:white;color:black}
	button.sub_btn { width:48%; height: 50px; background-color: #4CAF50; float:left; color:#FFFFFF; }
	button.can_btn { width:48%; height: 50px; background-color: #f44336; color:#ffffff ; }
	
</style>
<script>
	$(document).ready(function(){
		$("#confirmB").click(function(){
			// 무결성 검사...
			var PWReal 	= ${data.pw}; 
			var pwInput	= document.getElementById("PW").value;
			if(PWReal != pwInput){
				alert("대여 비밀번호가 정확하지 않습니다.");
				return;
			}
			
			alert("개인정보 수정이 완료되었습니다!");
			// 내용을 ChangeInfoProc으로 전달한다. 
			var form = document.getElementById("InfoFrm");
			form.action = "../mypage/ChangeInfoProc.do";
			form.submit();	
		});
		$("#cancelB").click(function(){
			$("#birth").val("${data.birth}");
			$("#phoneNum").val("${data.cellPhone}");
			$("#addr").val("${data.addr}");
			$("#birth").val("${data.birth}");
			$("#PW").val("");
		});
	});
</script>
<div class="wrapper">

<!-- 본문 내비게이터 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	    <br>
	        <h1 class="page-header">MyPage</h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a>
	            </li>
	            <li class="active">개인정보수정</li>
	        </ol>
	    </div>
	</div>
	
	<div class="col-md-3">
	     <div class="list-group">
	         <a href="RentRecord.do" class="list-group-item">반납 및 이력</a>
	         <a href="ChangeInfo.do" class="list-group-item">개인정보수정</a>
	         <a href="ChangePW.do" class="list-group-item">비밀번호변경</a>
	     </div>
	 </div>
	
<!-- 	 width: auto; -->
<!--     padding: 10px 18px; --> 
<!--     background-color: #f44336; -->
	
	<div class="rightMenu">
	
		<!-- 개인정보 수정 자리는 가운데로 옮겼고, 위에도 조금 띄었음. -->
		<div style="margin-left: 50%; ">
			<h3 ><b>개인 정보 수정</b></h3>
			<h5>*는 필수사항입니다.</h5>
			<!-- 개인정보 수정 테이블 고치려고 함.  -->
				<form method="POST" name="InfoFrm" id="InfoFrm" action="">
					<table class="main">
						<tr><td class="mainLeft">사용자</td>
						<td class="mainRight">${ID}</td></tr>
						
						<tr><td class="mainLeft">성명</td>
						<td class="mainRight">${data.userName}</td>					
						<%-- <td class="mainRight"><input type="text" class="text" name="name" id="name" value="${data.userName}" readonly></td></tr> --%>
						<tr><td class="mainLeft">*생년월일</td>
						<td class="mainRight"><input type="text" class="text" name="birth" id="birth" value="${data.birth}" placeholder="예)19990101"></td></tr>
						
						<tr><td class="mainLeft">*휴대폰번호</td>
						<td class="mainRight"><input type="text" class="text" name="phoneNum" id="phoneNum" value="${data.cellPhone}" placeholder="예)010-0000-0000"></td></tr>
						
						<tr><td class="mainLeft">*주소</td>
						<td class="mainRight"><input type="text" class="text" name="addr" id="addr" value="${data.addr}"></td></tr>
						
						<tr><td class="mainLeft">*비밀번호</td>
						<td class="mainRight"><input type="password" class="text" name="PW" id="PW" value="" placeholder="숫자4자리의 기존 대여 비밀번호."></td></tr>
					</table>			
				</form>
			<table class="below">
				<tr class="below">
					<td class="below">
						<br>
						<button class= "sub_btn" name="confirmB" id="confirmB" type="button" >정보 수정</button>&nbsp;&nbsp;&nbsp;
						<button class= "can_btn" name="cancelB" id="cancelB" type="button" >취소</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
</div>

<%@ include file="/inc/bottom.jsp" %>



