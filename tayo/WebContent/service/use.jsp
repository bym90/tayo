<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/inc/header.jsp" %>
<link rel="stylesheet" href="../common/css/tayo_css.css">
	<!-- 본문 내비게이터 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">이용안내<small> 이용방법</small>
	        </h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a>
	            </li>
	            <li class="active">이용안내</li>
	        </ol>
	    </div>
	</div>
	<!-- /.row -->
	
	
	<!-- 최근 소스 -->
	<div class="row">
	    <!-- Sidebar Column -->
	 <div class="col-md-3">
	     <div class="list-group">
	         <a href="./use.do" class="list-group-item">이용 안내</a>
	         <a href="./use2.do" class="list-group-item">의무와 책임</a>
	     </div>
	 </div>
	 <!-- Content Column -->
	    <div class="col-md-9">
	        <div class="con_view">
				<!-- 본문내용시작 -->		
				<h4 class="first">회원가입 안내</h4>
				<ul class="h5_ul">
					<li>공공자전거 홈페이지 가입 안내
						<ul class="h6_ul">
							<li>만 19세 이상 성인: 본인 명의 휴대폰 번호 필요</li>
							<li>미성년자(만15세 이상 19세 미만): 본인 명의 휴대폰 번호 필요</li>
							<li>외국인(국내 거주자): 외국인 등록번호 및 본인 명의 휴대폰 번호 필요<br>
								<div class="color_red mt5">※ 법인명의 등록 휴대폰 소지자는 가입이 불가능 합니다.</div>
							</li>
						</ul>
					</li>
					<li>서비스 신청(정회원 서비스)
						<ul class="h6_ul">
							<li>홈페이지 가입 후 별도의 서비스를 정회원 서비스를 신청한 뒤 기본요금을 결제합니다. (※ 자세한 내용은  <a href="/introduceAction.do?process=information&amp;menu=13" class="link_blank">‘서비스 안내’</a> 참조)</li>
							<li>서비스 가입 종류(※ 90분 이내 사용 기준)
								<ul class="h7_ul">
									<li>1일권(1일) / 1,000원 : 대여소(자전거 정류장) 현장 결제(휴대폰 소액 결제 이용)</li>
								</ul>
							</li>
							<li>서비스 신청(정회원 서비스)을 하지 않은 회원은 일반(준)회원입니다.</li>
						</ul>
					</li>
					<li>대여소에서 정회원 서비스 카드 등록
						<ul class="h6_ul">
							<li>정회원 서비스 등록 가능한 카드
								<ul class="h7_ul">
									<li>교통카드 기능이 있는 신용카드</li>
									<li>T-Money 카드</li>
									<li>캐시비 카드<br>
									<span class="color_red">※ 일부 구(舊)버전 카드는 이용이 불가능 할 수 있습니다.</span>
									</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>	
				<h4>무인정보단말기에서 카드 등록</h4>
				<ul class="h5_ul">
					<li>1단계 - 회원카드 등록하기
						<ul class="h6_ul">
							<li>‘회원카드 등록’ 버튼을 선택합니다.</li>
							<li>홈페이지 회원가입 후 회원카드를 사전등록 할 수 있으며 정회원 서비스 결제 후 자전거 대여가 가능합니다.</li>
						</ul>
					</li>
					<li>2단계 - 회원정보 입력
						<ul class="h6_ul">
							<li>생년월일 + 대여비밀번호 + 주민번호 뒤 3자리</li>
						</ul>
					</li>
					<li>3단계 - 대여카드 등록
						<ul class="h6_ul">
							<li>무인정보단말기 ‘카드 인식부’에 카드를 접속합니다.<br>
								<span class="color_red">※ 13.56MHz 태그기능이 있는 일반 스마트 카드</span>
							</li>
							<li><a href="#" class="link_blank">접촉위치를 확인하세요.(클릭)</a></li>
						</ul>
					</li>
				</ul>	
				<h4>일반(준)회원 또는 비회원인 경우</h4>
				<ul class="h6_ul ml10">
					<li>휴대전화 인증을 통한 일일회원권 구매 후 자전거 대여가 가능합니다.</li>
					<li>만19세 미만은 일일회원권 구매가 불가능합니다. 홈페이지에서 법정대리인(부모님) 동의하에 정회원 서비스를 이용하시기 바랍니다.</li>
					<li>법인 휴대전화로 일일회원권 구매가 불가능 합니다.</li>
					<li>휴대폰 소액결제가 불가능한 이용자는 일일회원권 구매가 불가능 합니다.</li>
					<li>선불폰 혹은 별정통신사 가입 이용자는 일일회원권 구매가 불가능 합니다.</li>
					<li>통신사에 약관에 문제가 있으신 분은 일일회원권 구매가 불가능 합니다. <br>
						<span class="color_red">(ex. 요금미납, 일시 정지 휴대폰 등)</span>
					</li>
				</ul>
				<h4>1일 이용권자 이용 방법</h4>
				<ul class="h5_ul">
					<li>1단계 - 메뉴선택  
						<ul class="h6_ul">
							<li>‘자전거 대여’  선택합니다.</li>
						</ul>
					</li>
					<li>2단계 - 일일 회원 만들기
						<ul class="h6_ul">
							<li>‘일일권 구매’ 버튼을 선택합니다. </li>
						</ul>
					</li>
					<li>3단계 - 휴대폰 인증
						<ul class="h6_ul">
							<li>통신, 휴대폰번호, 주민번호를 입력한 후 ‘인증번호 받기’ 버튼을 선택합니다.</li>
							<li>휴대폰에 수신된 인증번호를 입력한 후 ‘확인’ 버튼을 누릅니다.
								<span class="color_red">(※ 주의: 인증번호 6자리는 24시간 동안 ‘대여비밀번호’로 사용됩니다.)</span>
							</li>
						</ul>
					</li>
					<li>4단계 - 대여
						<ul class="h6_ul">
							<li>‘정상처리 되었습니다.’라는 음성 메시지를 확인합니다.</li>
							<li>‘일일회원권 대여’ 절차를 수행합니다.</li>
						</ul>
					</li>
				</ul>
				<!-- //본문내용끝 -->
			</div>
	    </div>
	</div>
	<!-- /.row -->

	<hr>
	
	
	
	
	
	
	
	
	
	
<%@ include file="/inc/bottom.jsp" %>

		



