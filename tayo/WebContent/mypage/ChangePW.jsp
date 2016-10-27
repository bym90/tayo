<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>

<%--종헌 CSS 수정 --%>

<style>
	div.wrapper{width: 1000px; height:400px}
 	div.leftMenu{width: 200px; height: 100%; float: left; background-color:#555} 
	div.rightMenu{width: 800px; height: 100%; float: center; text-align: center; margin-top:38px;}
	table.main{width: 500px;  } /*border-top: 2px solid #000000; border-bottom: 2px solid #000000;*/	
	tr{ height: 50px;} /*border-bottom: 1px solid #000000;*/
	td.mainLeft{ text-align: left;}  /*border-right: 1px solid #000000;*/
	td.mainRight{text-align: left;}
	input.text{width: 95%;height: 95%;}
	table.below{width: 500px;}
	h4.leftMenu{color:black}
	td.below{text-align: center; width: 500px;}
	input.below{}
	ul.mypageLeft{list-style-type: none;padding-left:0;background-color: #555}
	li a{display: block;color:black;padding:8px 16px;text-decoration:none;}
	li a:visited{color:black}
	li a:hover{background-color:white;color:black}
	button.sub_btn { width:48%; height: 50px; background-color: #4CAF50; float:left; color:#FFFFFF; }
	button.can_btn { width:48%; height: 50px; background-color: #f44336; color:#ffffff ; }
	
	
</style>
<script>
	$(document).ready(function(){
		$("#confirmB").click(function(){
			//무결성 검사...
			//먼저 필요한 변수를 준비해놓고...
			var PWReal		= ${data.pw};
			var PW 			= document.getElementById("PW").value;
			var newPW 		= document.getElementById("newPW").value;
			var newPWChk 	= document.getElementById("newPWChk").value;
			//null 검사 및 알림창.
			if(PW.length == 0){alert("기존 비밀번호를 입력해주세요.");return;}
			if(newPW.length == 0){alert("새비밀번호를 입력해주세요.");return;}
			if(newPW.length != 4){alert("새비밀번호 오류: 4자리의 숫자이어야 합니다. ");return;}
			if(newPWChk.length == 0){alert("새비밀번호확인을 입력해주세요.");return;}
			
			if(PW != PWReal){alert("기존 비밀번호가 정확하지 않습니다.");return;}			
			if(newPW != newPWChk){alert("새 비밀번호 확인을 정확히 입력해주세요.");return;}
			if(newPW == PW){alert("새 비밀번호가 기존 비밀번호와 같습니다.");return;}
			
			
			alert("비밀번호 수정이 완료되었습니다!");
			//내용을 ChangePWProc으로 전달한다. 
			var form = document.getElementById("PWFrm");
			form.action = "../mypage/ChangePWProc.do";
			form.submit();
		});
		$("#cancelB").click(function(){
			$("#PW").val("");
			$("#newPW").val("");
			$("#newPWChk").val("");
		});
	});
</script>
<div class="wrapper">

		<!-- 본문 내비게이터 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">MyPage</h1>
	       <br>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a>
	            </li>
	            <li class="active">비밀번호 변경</li>
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
	
	<div class="rightMenu">
		<div style="margin-left: 50%; ">
		<h3><b>대여 비밀번호 변경</b></h3>
		<br>
		<form method="POST" id="PWFrm" action="">
			<table class="main">
				<tr><td class="mainLeft">사용자</td><td class="mainRight">${ID}</td></tr>
				<tr><td class="mainLeft">성명</td><td class="mainRight">
				<input type="text" class="text" name="name" id="name" value="${data.userName}"></td></tr>
				
				<tr><td class="mainLeft">기존비밀번호</td><td class="mainRight">
				<input type="password" class="text" name="PW" id="PW" value="" placeholder="숫자4자리의 기존 대여 비밀번호."></td></tr>
				
				<tr><td class="mainLeft">새비밀번호</td><td class="mainRight">
				<input type="password" class="text" name="newPW" id="newPW" value="" placeholder="숫자4자리의 새로운 대여 비밀번호."></td></tr>
				
				<tr><td class="mainLeft">새비밀번호확인</td><td class="mainRight">
				<input type="password" class="text" name="newPWChk" id="newPWChk" value="" placeholder="새로운 대여 비밀번호 확인."></td></tr>
			</table>
		</form>
		
		<hr>
		
		<table class="below">
			<tr class="below">
				<td class="below">
					<button class= "sub_btn" id="confirmB" type="submit" >변경하기</button> &nbsp;&nbsp;&nbsp;
					<button class= "can_btn" id="cancelB" type="button" >취소</button>
				</td>
			</tr>
		</table>
		
	</div>
	</div>
</div>


























<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br>
<hr>
<%@ include file="/inc/bottom.jsp" %>