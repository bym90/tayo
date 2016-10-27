<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<style>
	div.wrapper{width: 1000px;}
	div.rightMenu{width: 800px;height: 600px;float: center;text-align: center;margin-top: 38px;}
	table.main{width: 800px;border-top: 2px solid #000000;border-bottom: 2px solid #000000;}
	tr{border-bottom: 1px solid #000000;height: 50px;}
	td.mainLeft{border-right: 1px solid #000000;text-align: left;}
	td.mainRight{text-align: left;}
	input.text{width: 95%;height: 95%;}
	table.below{width: 500px;}
	h4.leftMenu{color:black}
	td.below{text-align: center;width: 500px;}
	input.below{}
	ul.mypageLeft{list-style-type: none;padding-left:0;background-color: #555}
	li a{display: block;color:black;padding:8px 16px;text-decoration:none;}
	li a:visited{color:black}
	li a:hover{background-color:white;color:black}
</style>

<!-- 반납 이력 정보와 테이블이 더 들어올 예정임 / 그리고 지도는 크기가 줄어든다고 하심... . -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJyqdb8LENaY4ZVBytETkTAVPt0Rrpkos&sensor=false"></script>

<script>
	var loc;
	var jijeom;
	var lotel;
	function Send(no) {
		jijeom = $("#jijeom" + no).val();
		$.ajax({
			url : "../reserve/ReserveLocation.do",
			data : "jijeom=" + jijeom,
			type : "get",
			dataType : "json",
			success : function(data){
				loc = data[0].location;
				lotel = data[2].lotel;
				jijeom = data[3].jijeom;
				initialize(loc, jijeom, lotel);
			},
			error : function(xhr, code, msg) {
				alert("실패");
			}
		});
	}



	function initialize(loc, jijeom, lotel) {
        var mapOptions = {
                            zoom: 16, // 지도를 띄웠을 때의 줌 크기
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };


        var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
                                    mapOptions);

        var size_x = 40; // 마커로 사용할 이미지의 가로 크기
        var size_y = 40; // 마커로 사용할 이미지의 세로 크기

        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( '주소 여기에 기입!',
                                                    new google.maps.Size(size_x, size_y),
                                                    '',
                                                    '',
                                                    new google.maps.Size(size_x, size_y));

        // Geocoding *****************************************************

        var address = ['회기역', loc]; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        for(var i=0; i<address.length; i++){
        geocoder.geocode( { 'address': address[i]}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // 마커로 사용할 이미지(변수)
                                position: results[0].geometry.location
                            });

                var content = jijeom + "<br/><br/> Tel: " + lotel; // 말풍선 안에 들어갈 내용

                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        }
    }
    google.maps.event.addDomListener(window, 'load', initialize);



</script>
<script>


</script>

	<!-- 마이페이지 페이지 -->

	<!-- 본문 내비게이터 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">MyPage</h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈</a>
	            </li>
	            <li class="active">마이페이지</li>
	        </ol>
	    </div>
	</div>

	<!-- 최근 소스 -->
	<div class="row">
	    <!-- Sidebar Column -->
	 <div class="col-md-3">
	     <div class="list-group">
	         <a href="RentRecord.do" class="list-group-item">반납 및 이력</a>
	         <a href="ChangeInfo.do" class="list-group-item">개인정보수정</a>
	         <a href="ChangePW.do" class="list-group-item">비밀번호변경</a>
	     </div>
	 </div>
	 <!-- Content Column -->
	    <div class="col-md-9">
	        <h3>지도 정보</h3>
	        <div id="map-canvas" style="width:800px; height:500px;" onload="initianlize()"></div>
			<c:choose>
				<c:when test="${empty LIST}">
					<table class="main">
						<tr>
							<td><b>예약 내역이 없습니다.</b></td>
						</tr>
					</table>
				</c:when>
				<c:otherwise>
					<form>
					<table class="main">
						<tr>
							<td>번호</td>
							<td>대여일자</td>
							<td>대여지점</td>
							<td>자전거</td>
							<td>예약시작시간</td>
							<td>예약종료시간</td>
							<td>청구요금</td>
							<td>자전거상태</td>
							<td>위치찾기</td>
						</tr>
						<c:forEach var="data" items="${LIST}" varStatus="st">
							<input type="hidden" id="location${st.index}" value="${data.location}">
							<input type="hidden" id="jijeom${st.index}" value="${data.jijeom}">
							<input type="hidden" id="lotel${st.index}" value="${data.lotel}">
							<tr>
								<td>${data.reserNum}</td>
								<td>${data.rday}</td>
								<td>${data.jijeom}</td>
								<td>${data.byno}</td>
								<td>${data.rstime}</td>
								<td>${data.retime}</td>
								<td>${data.charge}</td>
								<td>${data.bstatus}</td>
								<td><input type="button" value="검색" id="map${st.index}" onClick="JavaScript:Send(${st.index})"></td>
							</tr>
						</c:forEach>
					</table>
					</form>
				</c:otherwise>
			</c:choose>
	    </div>
	</div>
	<!-- /.row -->

	<hr>

<%@ include file="/inc/bottom.jsp" %>