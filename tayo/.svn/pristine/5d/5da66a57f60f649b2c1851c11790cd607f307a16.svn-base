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
   <link href="/tayo/common/css/admin.css" rel="stylesheet" type="text/css">
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
	
	<script type="text/javascript" src="/tayo/common/js/custom/fun.js"></script>
	<script type="text/javascript" src="/tayo/common/se/js/HuskyEZCreator.js"></script>
	
	<!-- 네이버로그인 Javascript -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

    <!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="/tayo/common/css/bootstrap/bootstrap-theme.css">
	<link rel="stylesheet" href="/tayo/common/css/bootstrap/bootstrap.css">

	<!-- Bootstrap Core JavaScript -->
	<script src="/tayo/common/js/bootstrap/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#home").click(function(){
			$(location).attr("href","../tayo.do");
		});
		$("#logout").click(function(){
			$(location).attr("href","../service/logout.do")
		});
	});
</script>

</head>
<body>
	<% 
	String RANK = (String)session.getAttribute("RANK");
	String ID = (String)session.getAttribute("ID");
	
	System.out.println("등급: "+RANK+"\t아이디: "+ID);
	
	System.out.println(RANK.matches("^1|2$") && request.getRequestURI().toString().matches("^\\/tayo\\/admin(.+)$"));
	if(!RANK.matches("^1|2$") && request.getRequestURI().toString().matches("^\\/tayo\\/admin(.+)$")){
		try{
			out.print("<script>alert('관리자만 이용 가능합니다.');location.href='/tayo/'</script>");
			out.flush();
			out.close();
		}catch(Exception e){ 
			System.out.println("에러"+e); 
		}
	}
	%>
	<div class="div">
		<div class="div3">

		</div>

		<div class="div4">
			<div class="div5">
				<input class="headerBt" type="button" id="home" value="홈페이지">
				
			</div>
			<div class="div6">
				<input class="headerBt" type="button" id="logout" value="로그아웃">

			</div>
		</div>

	</div>
	<div class="div2">
		<ul>
			<li><a class="active" href="../admin/main.do">자전거현황</a></li>
			<li><a href="../admin/AdminUserStatusList.do">유저정보</a></li>
			<li><a href="../free/FreeBoardList.do">자유게시판</a></li>
			<li><a href="#news">Q&amp;A게시판</a></li>
			<li><a href="#news">신고게시판</a></li>
			<li><a href="../admin/AdminSetBoard.do">환경설정</a></li>
		</ul>
	</div>
	<br><br><br>
	
	