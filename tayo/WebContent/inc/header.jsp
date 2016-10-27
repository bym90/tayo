<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>타요! 타요!</title>

	<!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/tayo/common/css/common.css">
    <link href="/tayo/common/css/modern-business.css" rel="stylesheet">
    <link href="/tayo/common/lib/jquery/smoothness/jquery-ui-1.10.custom.min.css" rel="stylesheet">
	<!-- font CSS -->
	<link href="/tayo/common/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- 최근버전 -->
	<script type="text/javascript" src="/tayo/common/js/angular.min.js"></script>
	<script type="text/javascript" src="/tayo/common/js/html5shiv.js"></script>
	<script type="text/javascript" src="/tayo/common/js/jindo.desktop.all.js"></script>

	<!-- jQuery -->
	<script type="text/javascript" src="/tayo/common/js/jquery-1.12.3.js"></script>


	<!-- 추가 -->
	<script type="text/javascript" src="/tayo/common/js/common.js"></script>
	<script type="text/javascript" src="/tayo/common/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="/tayo/common/js/slider.js"></script>
	<script type="text/javascript" src="/tayo/inc/jyScript.js"></script>
	<script type="text/javascript" src="/tayo/common/js/custom/fun.js"></script>
	<script type="text/javascript" src="/tayo/common/se/js/HuskyEZCreator.js"></script>

	<!-- 네이버로그인 Javascript -->
<!-- 	<script type="text/javascript" src="/tayo/common/js/naverLogin.js"></script> -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJyqdb8LENaY4ZVBytETkTAVPt0Rrpkos&sensor=false"></script>

    <!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="/tayo/common/css/bootstrap/bootstrap-theme.css">
	<link rel="stylesheet" href="/tayo/common/css/bootstrap/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/tayo/common/css/JKitboot.css">

	<!-- Bootstrap Core JavaScript -->
	<script src="/tayo/common/js/bootstrap/bootstrap.min.js"></script>

	<!-- js import-->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/dropdown.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/affix.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/alert.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/button.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/carousel.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/collapse.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/modal.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/popover.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/scrollspy.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/tab.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/tooltip.js"></script> -->
	<!-- <script type="text/javascript" src="/tayo/common/js/bootstrap/transition.js"></script> -->


    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!--service > info_main.css > logo_size.css  -->

                <a class="navbar-brand" href="/tayo"><img class ="logo_size" src="/tayo/img/main/tayo01.png" ></a>
            </div>
            <p></p><!-- 	상단 네비 한칸 띄워주기-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<c:if test="${sessionScope.RANK eq 1 }">
                	<li>
                		<a href="/tayo/admin/main.do" >관리자</a>
                	</li>
                	</c:if>
                	<c:if test="${sessionScope.RANK eq 2 }">
                	<li>
                		<a href="/tayo/admin/main.do" >관리자</a>
                	</li>
                	</c:if>

                	<li id="naverH">
                        <a href="#" id="naver_id_login">로그인</a>
                    </li>
					<c:if test="${!empty sessionScope.ID}">
                    <li>
                    	<a href="/tayo/login/logout.do"><span class="btn_inr">로그아웃</span></a>
                    </li>
                    </c:if>
                	<li>
                		<a href="/tayo/service/info.do">타요안내</a>
                	</li>
                	<li>
                		<a href="/tayo/service/use.do">이용안내</a>
                	</li>
<!--                 	<li> -->
<!--                 		<a href="/tayo/service/station.do">정거장조회</a> -->
<!--                 	</li> -->
                    <li>
                        <a href="/tayo/reserve/ReservePage.do">예약하기</a>
                    </li>
					<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/tayo/free/FreeBoardList.do">자유게시판</a>
                            </li>
                            <li>
                                <a href="#">신고게시판</a>
                            </li>
                            <li>
                                <a href="/tayo/qna/QnABoardList.do">F A Q</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/tayo/mypage/RentRecord.do">마이페이지</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<!-- 네이버 아이디 로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("Ol8C9WRS2jrclOSdcoud", "http://tayotayo.com:8080/tayo/");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,20);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<!-- //네이버아디디로로그인 초기화 Script -->

<!-- 네이버 아이디 로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		$.ajax({
			url: "http://tayotayo.com:8080/tayo/login/loginProc.do",
			data: {  //서버로 보낼 데이터 data변수(form객체 컬렉션)
	        	email : naver_id_login.getProfileData('email'),
       			nick : naver_id_login.getProfileData('nickname'),
	        	gender : naver_id_login.getProfileData('gender'),
	        	birthday : naver_id_login.getProfileData('birthday'),
	        	profile: naver_id_login.getProfileData('profile_image')
	        },
 			dataType: "json",
			type: "post",
			success: function(data){
				if(data.result == "success"){
					opener.location.href = "http://tayotayo.com:8080/tayo/";
					self.close();
				}else{
					opener.location.href = "http://tayotayo.com:8080/tayo/login/AddInfoForm.do?email=${ID}";
					self.close();
				}

			},
			error:function(){
				alert("실패");
			}
		});
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>

	<div class="container">


