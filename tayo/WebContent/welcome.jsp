<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel = "stylesheet" type = "text/css" href = "./service/CSS/info_main.css">

<%@ include file="/inc/header.jsp" %>
<script>
	$('.carousel').carousel({
	    interval: 3500
	})
</script>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill"><img class = "img_size" src = "./service/index_main_picture/picture1.jpg" style = "width:100%; height: 100%"></div>

<!--                 <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=겁쟁이페달!!');"></div> -->
                <div class="carousel-caption">
                    <h2> 자전거와 함께면 케이프타운까지...</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill"><img class = "img_size" src = "./service/index_main_picture/picture2.jpg" style = "width:100%; height: 100%"></div>
<!--                 <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=신나는 자전거여행');"></div> -->
                <div class="carousel-caption">
                    <h2> 히메히메 스키스키~ 다이스키</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill"><img class = "img_size" src = "./service/index_main_picture/picture3.jpg" style = "width:100%; height: 100%"></div>
<!--                 <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=뭐시 종헌디');"></div> -->
                <div class="carousel-caption">
                    <h2>히메히메 키라키라링</h2>
                </div>
            </div>

        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    게시판 미리보기
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> 자유게시판</h4>
                    </div>
                    <div class="panel-body">
                        <c:forEach var="ldata" items="${FLIST}">
                        	<p><a href="./free/FreeBoardView.do?no=${ldata.no}&page=1">${ldata.title }</a></p>
                        </c:forEach>

                        <a href="/tayo/free/FreeBoardList.do" class="btn btn-default">더보기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> F A Q</h4>
                    </div>
                    <div class="panel-body">
                        <p><a href="/tayo/qna/QnABoardList.do#collapseOne">자전거 대여한 곳에만 반납해야 하나요?</a></p>
                        <p><a href="/tayo/qna/QnABoardList.do#collapseTwo">자전거를 이용하고 싶은데 얻허게 해야하나요?</a></p>
                        <p><a href="/tayo/qna/QnABoardList.do#collapseThree">자전거 반납은 어떻게 하나요?</a></p>
                        <p><a href="/tayo/qna/QnABoardList.do#collapseFour">대여 비밀번호는 무엇인가요?</a></p>
                        <p><a href="/tayo/qna/QnABoardList.do#collapseFive">회원 가입은 왜 하나요?</a></p>
                        <p><a href="/tayo/qna/QnABoardList.do#collapseSix">반납할 거치대가 없을 경우 어떻게 하나요?</a></p>
                        <p><a href="#" onclick="return false;">테스트입니다.</a></p>
                        <a href="#" class="btn btn-default">더보기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> 신고게시판</h4>
                    </div>
                    <div class="panel-body">
                        <p><a href="#">로드바이크 속도감 끝내줍니다!</a></p>
                        <p><a href="#">바퀴 훔치려다가 걸린 썰!</a></p>
                        <p><a href="#">중고거래 하려다가 걸림</a></p>
                        <p><a href="#">타다가 넘어져서 고장났어요ㅠㅠ유유..</a></p>
                        <p><a href="#">자전거가 넘나 예쁜 것!</a></p>
                        <p><a href="#">잠실 자전거대여점 좋아요!!</a></p>
                        <p><a href="#">오늘도 좋은하루되세요!</a></p>
                        <a href="#" class="btn btn-default">더보기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">사진 갤러리</h2>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" onclick="return false;">
                    <img class="img-responsive img-portfolio img-hover" src="http://www.leonkorea.com/data/Travel/contents/20120911AM14647_558.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" onclick="return false;">
                    <img class="img-responsive img-portfolio img-hover" src="http://news.seocho.go.kr/images/0010423796_041/640-100726-1.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" onclick="return false;">
                    <img class="img-responsive img-portfolio img-hover" src="http://cfile22.uf.tistory.com/image/2245773C51A36A320AEAEB" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" onclick="return false;">
                    <img class="img-responsive img-portfolio img-hover" src="http://cfile22.uf.tistory.com/image/2245773C51A36A320AEAEB" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" onclick="return false;">
                    <img class="img-responsive img-portfolio img-hover" src="http://cfile223.uf.daum.net/image/236FA54F5285E3EF276268" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="#" onclick="return false;">
                    <img class="img-responsive img-portfolio img-hover" src="http://image.ajunews.com/content/image/2013/06/25/20130625000635_0.jpg" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->

        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">칭찬합시다.</h2>
            </div>
            <div class="col-md-6">
                <p>건강을 챙겨주는 자전거!!</p>
                <ul>
                    <li><strong>굳이예요 굳굳!!</strong></li>
                    <li>봄을 자전거와 함께하세요!</li>
                    <li>여름을 자전거와 함께하세요!</li>
                    <li>가을을 자전거와 함께하세요!</li>
                    <li>겨울엔 자전거와 함께하세요!</li>
                    <li>2017년 자전거와 함께하세요!</li>
                </ul>
            </div>
            <div class="col-md-6">
<!--                 <img class="img-responsive" src="http://placehold.it/700x450" alt=""> -->
				<img class="img-responsive" src="./img/main/img01.png" alt="">
            </div>
        </div>
        <!-- /.row -->



<%@ include file="/inc/bottom.jsp" %>