<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<%@ include file= "/inc/header.jsp" %>
<!-- <style>
	body{text-align: center;}
	table{width: 600px;margin: auto;border: 1px solid #000000;}
	table.subTable{width: 600px;margin: auto;border: 0;}
	tr.z{text-align: left;border: 1px solid #000000;height: 50px}
	tr.a{text-align: left;border: 1px solid #000000;height: 120px}
	td.z{text-align: center;border: 1px solid #000000;}
	td.zz{text-align: center;padding-left:140px;border: 1px solid #000000;}
	td.a{width: 200px;text-align: center;border: 1px solid #000000;}
	td.b{width: 400px;text-align: center;border: 1px solid #000000;}
	td.captcha{width: 600px;height: 500px;text-align: center;border: 1px solid #000000;}
	input.a{width: 95%;height: 95%;margin: auto;}
	input.zz{margin-right:130px}
	div.zz{padding-right:130px}
</style> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
<script>
$(function(){
	//Site key
	var siteKey = "6LcXPScTAAAAACpklD_Jq_9FBRLuBR92rhgg224z";
	var div = "recaptcha";
	Recaptcha.create(siteKey, div, {theme: "red"});
	$("#recaptchaCheck").click(function(){
		
		var challenge = Recaptcha.get_challenge();
		var response = Recaptcha.get_response();
		var host = $(location).attr('host');
		$.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/login/retest_result.jsp",
			async: false,
			data: {
				host: host,
				challenge: challenge,
				response: response
			},
			success: function(data) {
				if(data == "Y") {
					document.getElementById("captchaOX").value = "O";
					document.getElementById("message").innerHTML = "입력 정보가 일치합니다!";
				}else{
					document.getElementById("captchaOX").value = "X";
					document.getElementById("message").innerHTML = "그림을 잘 보세요!";
					Recaptcha.reload();
				}
			}
		}); 
	});
}); 
</script>
<script>
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById("zip1").value = data.postcode1;
			document.getElementById("zip2").value = data.postcode2;
			document.getElementById("addr").value = data.address;
			document.getElementById("addrSub").focus();
		}
	}).open();
}
</script>
<script>
	$(document).ready(function(){
		$("#confirmBtn").click(function(){
			//유효성 검사
			//치현: 항목 입력하지 않았을 시.
			var captchaOX 	= document.getElementById("captchaOX").value;
			var userName 	= document.getElementById("userName").value;
			var pickDate 	= document.getElementById("pickDate").value;
			var cellPhone 	= document.getElementById("cellPhone").value;
			var zip1 		= document.getElementById("zip1").value;
			var zip2 		= document.getElementById("zip2").value;
			var addr 		= document.getElementById("addr").value;
			var addrSub 	= document.getElementById("addrSub").value;
			var rentPW 		= document.getElementById("rentPW").value;
			var rentPWCheck = document.getElementById("rentPWCheck").value;
			
			if(captchaOX == "X"){alert("이미지에 나타난 글자를 정확히 입력해주세요.");return;}
			if(userName.length == 0){alert("이름을 입력하세요. Input your name.");return;}
			if(pickDate.length == 0){alert("날짜를 선택해주세요.");return;}
			if(cellPhone.length == 0){alert("전화번호를 입력해주세요.");return;}
			if(zip1.length == 0 || zip2.length == 0){alert("우편번호를 선택해주세요.");return;}
			if(addrSub.length == 0){alert("세부주소를 입력해주세요.");return;}
			if(rentPW.length == 0){alert("비밀번호를 입력하세요.");return;}
			if(rentPWCheck.length == 0){alert("비밀번호 확인을 입력하세요.");return;}
			if(rentPW != rentPWCheck){alert("비밀번호 확인이 비밀번호가 동일하지 않습니다.");return;}  //비밀번호 확인과 비밀번호의 일치 확인.
			
			//치현: 정규식.
			var re_tel = /^\d{3}-\d{3,4}-\d{4}$/;   									//전화번호 정규식. 010-0000-0000
			var re_pw = /^\d{4}$/; 														//비밀번호 정규식. 4자리 숫자.  
			
			//치현: 정규식에 따른 알림창
			if(!re_tel.test(cellPhone)){alert("잘못된 전화번호입니다.");return;} 				//전화번호 양식이 틀릴 경우. 
			if(!re_pw.test(rentPW)){alert("비밀번호는 4자리 숫자로 입력해주세요.");return;}			//비밀번호 양식이 틀릴 경우. 
			
			
			
			/* var userName = document.getElementById("userName");
			var birth = document.getElementById("birth");
			var cellPhone = document.getElementById("cellPhone");
			var capchaInput = document.getElementById("capchaInput");
			var birth = document.getElementById("birth");
			capchaInput
			addr
			if(userName.length == 0){
				alert("이름을 입력하세요. Input your name.");
				return;
			} */
			//폼의 내용을 제출한다. 
			$("#addFrm").attr("action","../login/AddInfoProc.do"); ////////////주소가 이게 맞는지?
			$("#addFrm").submit();					
		});
		$("#cancelBtn").click(function(){
			$(location).attr("href","../login/logout.do");
		});
	});
</script>




	<!-- 본문 내비게이터 -->
	<hr>	
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">네이버로그인<small> 부가정보 입력</small>
	        </h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">네이버 로그인 </a>
	            </li>
	            <li class="active">부가정보 입력</li>
	        </ol>
	    </div>
	</div>
	<!-- /.row -->

<div class="well well-lg">
	<h2>타요!타요! 처음 이용하세요?</h2>
	<p>원활한 서비스를 위한 부가정보를 입력 부탁드립니다!</p>
</div>

<form method="post" id="hiddenFrm">
	<input type="hidden" id="captchaOX" value="X"/>
</form>
<form method="post" id="addFrm">
	<table class="table">
		<tr >
			<td width="20%">이름</td>
			<td>
				<input type="text" class="W20 INPUTSTYLE1" name="userName" id="userName">
			</td>
		</tr>
		<tr >
			<td >생년월일</td>
			<td >
				<input class="COMMON_CALENDAR_BIRTH W20 INPUTSTYLE1" id="pickDate" name="pickDate" readonly/>
			</td>
		</tr>
		<tr >
			<td >휴대폰번호</td>
			<td >
				<input type="text"  name="cellPhone" class="W20 INPUTSTYLE1" id="cellPhone" placeholder="예)010-0000-0000">
			</td>
		</tr>
		<tr >
    		<td >우편번호</td>
    		<td >
    			<input type="text" class="W10 INPUTSTYLE1" name="zip1" id="zip1" readonly="readonly" />
    			<input type="text" class="W10 INPUTSTYLE1" name="zip2" id="zip2" readonly="readonly" />
    			<input type="button" value="우편번호" class="btngray btn" onclick="openDaumPostcode()" />
    		</td>
    	</tr>
    	<tr >
    		<td >주소</td>
			<td ><input type="text" class="INPUTSTYLE1 W50" id="addr"  name="addr" readonly="readonly" /></td>    			
    	</tr>
		<tr >
	    	<td >상세주소</td>
			<td ><input type="text" id="addrSub" name="addrSub" class="INPUTSTYLE1 W50"/></td>
    	</tr>
 
		<tr >
			<td colspan="2" >
				<input type="checkbox" name="infoAgree" value="infoAgree">타요 서비스를 위한 개인정보수집/이용에 동의합니다.
			</td>
		</tr>
		<tr >
			<td >자전거 대여 비밀번호</td>
			<td >
				<input type="text"  name="rentPW" id="rentPW" class="INPUTSTYLE1" placeholder="숫자 4자리">
			</td>
		</tr>
		<tr >
			<td >자전거 대여 비밀번호 확인</td>
			<td >
				<input type="text"  name="rentPWCheck" id="rentPWCheck" class="INPUTSTYLE1" placeholder="숫자 4자리">
			</td>
		</tr>
		<tr >
			<td>자동가입 방지</td>
			<td>
				<div id="message" style="color: #ff0000;"></div>
				<div id="recaptcha"></div> <input id="recaptchaCheck" type="button" class="btngray btn" value="번호체크">
				<div id="recaptcha_widget" style="display: none">
					<div style="text-align:center;">
						<div id="recaptcha_image"></div>
						<div class="recaptcha_only_if_incorrect_sol" style="color: red">Incorrect please try again</div>
						<span class="recaptcha_only_if_image">Enter the words above:</span> <span class="recaptcha_only_if_audio">Enter the numbers you hear:</span> <input type="text" id="recaptcha_response_field"
							name="recaptcha_response_field" />
						<div>
							<a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a>
						</div>
						<div class="recaptcha_only_if_image">
							<a href="javascript:Recaptcha.switch_type('audio')">Get an audio CAPTCHA</a>
						</div>
						<div class="recaptcha_only_if_audio">
							<a href="javascript:Recaptcha.switch_type('image')">Get an image CAPTCHA</a>
						</div>
						<div>
							<a href="javascript:Recaptcha.showhelp()">Help</a>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="TAC">
				<input type="button" id="confirmBtn" class="btngray btn W20" value="확인">
				<input type="button" id="cancelBtn" class="btngray btn W20" value="취소">
			</td>
		</tr>
	</table>
	
</form>
<%@ include file="/inc/bottom.jsp" %>