<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>
	<!-- 마이페이지 페이지 -->

	<!-- 본문 내비게이터 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Board<small> FAQ 게시판</small>
	        </h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a></li>
	            <li><a href="/tayo/free/FreeBoardList.do">게시판 </a></li>
	            <li class="active">FAQ게시판</li>
	        </ol>
	    </div>
	</div>
	<!-- /.row -->
	
	<!-- Content Row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">자전거 대여한 곳에만 반납해야 하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                                아닙니다 . 자전거를 대여한 곳에 꼭 반납할 필요는 없습니다 . 자전거를 이용하신 후 가까운 어느 대여소에서라도 반납이 가능합니다 .
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">자전거를 이용하고 싶은데 어떻게 해야하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                홈페이지나 App 을 통해 회원가입을 하신 후 이용권을 결제하신 후 이용할 수 있습니다 . 회원가입을 원치 않는 분들께서도 일일권 구매를 통해 자전거를 이용할 수 있습니다 . 자세한 사항은 이용방법을 참고하세요 
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">자전거 반납은 어떻게 하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                반납할 대여소의 거치대에 자전거를 거치한 후 거치대 연결장치를 당겨서 단말기의 잠금 홈에 삽입하면 반납이 완료됩니다 . 다른 절차는 필요하지 않습니다 .
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">대여 비밀번호는 무엇인가요?</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                대여비밀번호는 자전거를 대여할 때 단말기에서 입력하는 간단한 4 자리 숫자조합입니다 . 이는 회원카드나 스마트폰 분실시 습득자가 무단으로 자전거를 대여하는 것을 막기위해 사용되며 , 자가잠금 (self-lock) 을 해제할 때에도 사용됩니다 .
대여비밀번호를 모르면 대여할 수 없으니 꼭 기억하세요 .
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">회원가입은 왜 하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                회원가입을 하여야만 이용이 가능하며, 네이버로그인 API를 이용하므로 주민등록번호와 같은 개인정보는 저장하지 않습니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">반납할 거치대가 없을 경우 어떻게 하나요??</a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body">
                                대여소의 거치대에 자전거가 모두 거치되어 있어 반납할 거치대가 없는 경우에는 이미 거치되어 있는 자전거의 보조 잠금장치를 빼어 반납하고자 하는 자전거의 잠금 홈에 삽입하면 반납처리가 완료됩니다 .
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.panel-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <hr>


<%@ include file="/inc/bottom.jsp" %>