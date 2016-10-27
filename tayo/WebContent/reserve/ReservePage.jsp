<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJyqdb8LENaY4ZVBytETkTAVPt0Rrpkos&sensor=false"></script>
<link rel=styleSheet href="../common/css/reserve.css">
<script>

	$(document).ready(function(){
		$("#rBtn").click(function(){
			$("#rfrm").each(function(){
				this.reset();
			});
		});
	});

	$(document).ready(function(){
        $('#accordion').accordion({
        	active: false,
        	  collapsible: true
        });
    });

	$(document).ready(function(){
		$("#etime").change(function(){
			stime = $("#stime option:selected").val();
			etime = $("#etime option:selected").val();
			temp1 = stime.substring(0,2);
			temp2 = etime.substring(0,2);
			if(temp1 >= temp2){
				alert("이용종료시간을 다시 설정해주세요");
				$('#etime').val('default');
				return;
			}
			ptime = temp2-temp1;
			charge = ptime * 500;
			$("#charge").val(charge+"원");
		});
    });


</script>
<script>

	function subm(){
		var regAddtel = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		$addtel = $("#addtel").val();
		if(!regAddtel.test($addtel)){
			alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.\n예시>010/016/017/018/019-xxxx-xxxx");
			return false;
		}

		$jijeom = $("#jijeom option").index($("#jijeom option:selected"));
		if($jijeom == 0){
			alert("지점을 선택하세요");
		}

		$pickdate = $("#pickdate").val();
		if($pickdate == "") {
			alert("날짜를 선택해주세요")
			return;
		}

		$stime = $("#stime option").index($("#stime option:selected"));
		if($stime == 0){
			alert("이용시작시간을 선택하세요");
		}

		$etime = $("#etime option").index($("#etime option:selected"));
		if($etime == 0){
			alert("이용시작시간을 선택하세요");
		}

		var regPW = /^[0-9]{4,20}$/;
		$pw = $("#pw").val();
		if(!regPW.test($pw)){
			alert("4자이상 20자이하 숫자 비밀번호를 입력해주세요");
			return false;
		}

		$("#rfrm").attr("method", "get");
		$("#rfrm").attr("action", "../reserve/ReserveProc.do");
		$("#rfrm").submit();
	};

</script>
<script>
$(document).ready(function(){
	$("#reBtn").click(function(){
			var pw = $("#pw").val();
			$.ajax({
				url : "../reserve/ReserveConfirm.do",
				data : "pw=" + pw,
				type : "get",
				dataType : "json",
				success : function(data){
					if(data.result=="success"){
						subm();
					}else{
						alert("비번이 틀립니다. 다시 한번 확인해주세요");
					}

				},
				error : function(xhr, code, msg	){
					alert("실패")
				}
			});
	});
});
</script>
<script>

	function changeDong(){
		var gu = $("#gu").val();
		$.ajax({
			url : "../reserve/ReserveDong.do",
			data : "gu=" + gu,
			dataType : "json",
			type : "post",
			success : function(data){
				var dongs = data.DONG;

				var st1 = "<select id='dong' name='dong'>";
					st1 += "<option>--동 선택--</option>";
				$.each(dongs, function(index){
					var dong = dongs[index];
					st1 += "<option>";
					st1 += dong;
					st1 += "</option>";
				});
				st1 += "</select>";
				$('#dong').html(st1);
			},

			error : function(xhr, code, msg	){
				alert("실패")
			}
		});
	}


	function changeJijeom(){
		var dong = $("#dong").val();
		$.ajax({
			url : "../reserve/ReserveJijeom.do",
			data : "dong=" + dong,
			dataType : "json",
			type : "post",
			success : function(data){

				var jijeoms = data.JIJEOM;

				var st2 = "<select id='jijeom' name='jijeom'>";
					st2 += "<option>--지점 선택--</option>";
				$.each(jijeoms, function(index){
					var jijeom = jijeoms[index];
					st2 += "<option>";
					st2 += jijeom;
					st2 += "</option>";
				});
				st2 += "</select>";
				$('#jijeom').html(st2);
			},

			error : function(xhr, code, msg	){
				alert("실패")
			}
		});
	}


	$(document).ready(function(){
		$("#pw").blur(function(){
				var pw = $("#pw").val();
				$.ajax({
					url : "../reserve/PWConfirm.do",
					data : "pw=" + pw,
					type : "get",
					dataType : "html",
					success : function(data){
						$("#pwconf").html(data);

					},
					error : function(xhr, code, msg	){
						alert("실패")
					}
				});
		});
	});


</script>
<script>
var marker;
var loc;
var jijeom;
var lotel;

$(document).ready(function(){
	$("#jijeom").change(function(){
		jijeom = $("#jijeom option:selected").val();
		$.ajax({
			url : "../reserve/ReserveLocation.do",
			data : "jijeom=" + jijeom,
			type : "get",
			dataType : "json",
			success : function(data){
				$("#count").val(data[1].bcount);
				$("#loc").val(data[0].location);
				loc = data[0].location;
				lotel = data[2].lotel;
				jijeom = data[3].jijeom;
				initialize(loc, jijeom, lotel);

			},
			error : function(xhr, code, msg	){
				alert("실패");
			}
		});
	});
});

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


    marker = null;
    var geocoder = new google.maps.Geocoder();
    for(var i=0; i<address.length; i++){
    geocoder.geocode( { 'address': address[i]}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            marker = new google.maps.Marker({
                            map: map,
                            icon: image,
                            position: results[0].geometry.location
                        });

			 var content = jijeom + "<br/><br/> Tel: " + lotel; // 말풍선 안에 들어갈 내용

            // 마커를 클릭했을 때의 이벤트
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

	<!-- 예약하기 페이지 -->

	<!-- 본문 내비게이터 -->
	<hr>
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">예약하기
	        </h1>
	        <ol class="breadcrumb">
	            <li><a href="/tayo">홈 </a>
	            </li>
	            <li class="active">예약하기 </li>
	        </ol>
	    </div>
	</div>
	<!-- /.row -->


	<div class="DIVCENTER" id="accordion" >
		<h3 class="FONT_RED3"><b>이용요금 및 수칙 안내</b></h3>
		<div>
			<p><b class="FONT_RED3">▶이용시간</b>                                                          <br>
 				&nbsp;이용시간은 시간제로 이루어져 있습니다.                                 <br>
				&nbsp;시간제의 이용시간은 오전 9시부터 오후 6시입니다.                       <br>
				&nbsp;시간제의 단위는 기본 1시간으로 시작해 1시간 단위로 추가할 수 있습니다. <br>
			   <b class="FONT_RED3">▶이용요금</b>                                                          <br>
				&nbsp;시간당 요금 : 500원                                                    <br>
			   <b class="FONT_RED3">▶이용수칙</b>                                                            <br>
				&nbsp;반납시간이 1분이라도 초과할 경우 500원씩 추가됩니다.                   <br>
				&nbsp;반납시 파손여부확인 후 상태에 따라 수리비가 부과됩니다.                <br>
			    &nbsp;반납시 다음사람을 위해 청결상태 유지 부탁드립니다.                     <br>
			</p>
		</div>
	</div>
	<form id="rfrm">
		<input type="hidden" name="loc" id="loc" >
	<table class="table W100">
		<tr>
			<td width="20%">이름</td>
			<td colspan="4"><input type="text" id="name" name="name" value="${DATA.name}" readonly size="25"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="4">
			<input type="text" id="tel" name="tel" value="${DATA.tel}" readonly size="25">
			<input type="text" id="addtel" name="addtel" placeholder="추가 핸드폰번호를 입력하세요" size="25">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="4"><input class="W100" type="text" id="addr" name="addr" value="${DATA.addr}" readonly></td>
		</tr>
		<tr>
			<td class="TDSTYLE1">대여소 위치</td>
			<td colspan="4">
				<select id="gu" name="gu" onchange="changeDong();" class="SELECTSTYLE1">
				<option>--구 선택--</option>
				<c:forEach var="data" items="${GU}">
					<option value="${data.gu}">${data.gu}</option>
    			</c:forEach>
				</select>

				<select id="dong" name="dong" onchange="changeJijeom();" class="SELECTSTYLE1">
    			<option>--동 선택--</option>
    			<option>----</option>
    			<option>----</option>
    			<option>----</option>
    			<option>----</option>
				</select>

				<select id="jijeom" name="jijeom" class="SELECTSTYLE1">
    			<option>--지점 선택--</option>
    			<option>----</option>
    			<option>----</option>
    			<option>----</option>
    			<option>----</option>
				</select>

			</td>

		</tr>
		<tr>

			<td colspan="5">

				<div onload="initialize();" id="map-canvas" style="width:100%; height:400px;"></div>

			</td>

		</tr>
		<tr>
			<td>잔여 자전거 대수</td>
			<td colspan="4"><input type="text" id="count" name="count" class="INPUTSTYLE1" readonly></td>
		</tr>
		<tr>
			<td>날짜선택</td>
			<td colspan="4"><input class="COMMON_CALENDAR" id="pickdate" class="INPUTSTYLE1 W20" name="pickdate" readonly /></td>
		</tr>
		<tr>
			<td>이용시간선택</td>
			<td colspan="4">
				<select id="stime" name="stime" class="SELECTSTYLE1">
    			<option>--이용시작시간--</option>
    			<option>09:00</option>
    			<option>10:00</option>
    			<option>11:00</option>
    			<option>12:00</option>
    			<option>13:00</option>
    			<option>14:00</option>
    			<option>15:00</option>
    			<option>16:00</option>
    			<option>17:00</option>
    			<option>18:00</option>
				</select>

				<select id="etime" name="etime" class="SELECTSTYLE1">
    			<option value="default">--이용종료시간--</option>
    			<option>10:00</option>
    			<option>11:00</option>
    			<option>12:00</option>
    			<option>13:00</option>
    			<option>14:00</option>
    			<option>15:00</option>
    			<option>16:00</option>
    			<option>17:00</option>
    			<option>18:00</option>
    			<option>19:00</option>
				</select>

			</td>
		</tr>
		<tr>
			<td>요금</td>
			<td colspan="4"><input type="text" id="charge" name="charge" class="INPUTSTYLE1" readonly></td>
		</tr>
		<tr>

			<td>대여비밀번호</td>
			<td colspan="4"><input type="password" id="pw" name="pw" class="INPUTSTYLE1" placeholder="대여비밀번호 입력하세요"><small id="pwconf"></small></td>
		</tr>

		<tr>
			<td colspan="5" align="right">
				<input type="button" id="rBtn"  value="다시쓰기" class="BTN_G2W">
				<input type="button" id="reBtn" value="예약하기" class="BTN_GW">
			</td>
		</tr>

	</table>
	</form>



<%@ include file="/inc/bottom.jsp"%>
