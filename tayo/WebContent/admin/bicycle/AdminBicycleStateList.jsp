<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/adminHeader.jsp"%>
<link href="/tayo/admin/css/bicycle.css" rel="stylesheet" type="text/css">
<script>
$(document).ready(function() {
	  $("#check_all").click(function(){
	        if($("#check_all").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=check]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=check]").prop("checked",false);
	        }
	    });

	  $("#addbtn").click(function() {
			var popUrl = "../admin/AdminBicycleAdd.do"; //팝업창에 출력될 페이지 URL
			var popOption = "width=600, height=150, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "", popOption);
		});

	  $("#sbtn").click(function() {
			var search = $("#stext").val();
			if(search == ""){
				alert("자전거 이름을 입력해 주세요.");
				return;
			}
			else{
			$("#option").attr("action",	"../admin/AdminBicycleSearch.do");
			$("#option").submit();
			}
		});

	  $("#deletebtn").click(function(){
			if($("input:checkbox[id='check']").is(":checked")==false){
				alert("삭제 할 자전거를 선택해 주세요.");
				return;
			}
			else{
			$("#option").attr("action","../admin/AdminBicycleDeleteProc.do");
			$("#option").submit();
			alert("삭제 완료");
			}
	  });

	  $("#adapt").click(function(){
			var temp = $("#bsatus2").val();
			if($("input:checkbox[id='check']").is(":checked")==false){
				alert("상태를 변경 할 자전거를 선택해 주세요.");
			}
			else if(temp == ""){
				alert("자전거 상태를 선택해 주세요.")
			}
			else{
			$("#option").attr("action","../admin/AdminBicycleStateProc.do");
			$("#option").submit();
			alert("변경 완료");
			}
		});
});

function sub(){
	var t = $("#jijeom").val();
	if(t == ""){
		alert("지점을 선택해 주세요.")
	}
	else{
	var j = staus.jijeom.value;
	$.ajax({
		url : "../admin/AdminBicycleJijeom.do",
		data : "jijeom="+j,
		dataType : "json",
		type : "get",
		success : function(data){

			$("#total").val(data.JIJEOM[0]);
			$("#wait").val(data.JIJEOM[1]);
			$("#rent").val(data.JIJEOM[2]);
			$("#over").val(data.JIJEOM[3]);
			$("#break").val(data.JIJEOM[4]);
			$("#lost").val(data.JIJEOM[5]);
		},
		error : function(xh,code,msg){
			alert("실패");
		}
			});
		}
	}
	function sub2(){
	$("#staus").attr("action","../admin/main.do");
	$("#staus").submit();
}

</script>
<br>
<h1> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;자전거 현황</h2>

<hr>
<!-- 자전거 현황 테이블 -->
<br>

<form method="post" id="staus">
	<table class="statusT">
		<tr>
		<br>
			<td>지점별 현황</td>
			<td><select name="jijeom" id="jijeom" onchange="sub()">
					<option>--선택하세요--</option>
					<option value="난지한강공원지점">난지한강공원지점</option>
					<option value="신도림역지점">신도림역지점</option>
					<option value="신도림동주민센터지점">신도림동주민센터지점</option>
					<option value="구로5동주민센터지점">구로5동주민센터지점</option>
					<option value="구로역지점">구로역지점</option>
					<option value="여의도역지점">여의도역지점</option>
					<option value="여의나루역지점">여의나루역지점</option>
					<option value="당산역지점">당산역지점</option>
					<option value=당산2동주민센터지점>당산2동주민센터지점</option>
					<option value="노량진역지점">노량진역지점</option>
					<option value="노량진2동주민센터지점">노량진2동주민센터지점</option>
					<option value="이수역지점">이수역지점</option>
					<option value="남성역지점">남성역지점</option>
					<option value="망원1동주민센터지점">망원1동주민센터지점</option>
					<option value="망원한강공원지점">망원한강공원지점</option>
					<option value="하늘공원지점">하늘공원지점</option>
					<option value="난지한강공원지점">난지한강공원지점</option>
			</select></td>
			<td>총 자전거 수 : <input type="text" id="total" readonly style="width: 25px; border: 0px">
			</td>
			<td>대기중 : <input type="text" id="wait" readonly style="width: 25px; border: 0px">
			</td>
			<td>대여중 : <input type="text" id="rent" readonly style="width: 25px; border: 0px">
			</td>
			<td>연체중 : <input type="text" id="over" readonly style="width: 25px; border: 0px">
			</td>
			<td>파손 : <input type="text" id="break" readonly style="width: 25px; border: 0px">
			</td>
			<td>분실 : <input type="text" id="lost" readonly style="width: 25px; border: 0px">
			</td>

		</tr>

		<tr>
			<td><br> 자전거 정렬</td>
			<td><br> <select name="sort" id="sort" onchange="sub2()">
					<option>--선택하세요--</option>
					<option value="0">전체보기</option>
					<option value="1">대기중</option>
					<option value="2">대여중</option>
					<option value="3">연체중</option>
					<option value="4">파손</option>
					<option value="5">분실</option>
			</select></td>
		</tr>
	</table>
</form>
<br>
<br>
<form method="post" id="option">
	<table class="statusT">
		<tr>
			<th><input type="checkbox" name="check_all" id="check_all" /></th>
			<td>자전거 번호</td>
			<td>지점(위치)</td>
			<td>ID</td>
			<td>예약날짜</td>
			<td>대여시작시간</td>
			<td>종료시간</td>
			<td>상태</td>
		</tr>
		<tr>
			<td colspan="9"><hr></td>
		</tr>
		<c:forEach var="data" items="${LIST}">
			<tr>
				<td><input type="checkbox" name="check" id="check" value="${data.bno}" /></td>
				<td>${data.bno}</td>
				<td>${data.blocation }</td>
				<td>${data.id}</td>
				<td>${data.rday}</td>
				<td>${data.stime}</td>
				<td>${data.etime}</td>
				<td>${data.bstaus}</td>
			</tr>
			<tr>
				<td colspan="9"><hr></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<table class="statusT">
		<tr>
			<td align="center"><c:if test="${PINFO.startPage eq 1}">
					[이전]
				</c:if> <c:if test="${PINFO.startPage ne 1}">
					<a href="../admin/main.do?nowPage=${PINFO.startPage - 1}">[이전]</a>
				</c:if> <c:forEach var="page" begin="${PINFO.startPage}" end="${PINFO.endPage }">
					<c:if test="${page eq PINFO.nowPage}">
						[${page}]
					</c:if>
					<c:if test="${page ne PINFO.nowPage}">
						<a href="../admin/main.do?nowPage=${page}&sort=${SORT}">[${page}]</a>
					</c:if>
				</c:forEach> <c:if test="${PINFO.endPage eq PINFO.totalPage}">
					[다음]
				</c:if> <c:if test="${PINFO.endPage ne PINFO.totalPage}">
					<a href="../admin/main.do?nowPage=${PINFO.endPage + 1}">[다음]</a>
				</c:if></td>
		</tr>
	</table>
	<!-- 자전거 검색, 추가, 상태입력 -->
	<br> <br>
	<table class="searchT">
		<tr>
			<td><input type="search" id="stext" name="stext"> <input type="button" id="sbtn" name="sbtn" value="검색하기"></td>
			<td><input type="button" id="addbtn" name="addbtn" value="자전거 추가하기"> <input type="button" id="deletebtn" name="deletebtn" value="자전거 삭제하기"></td>
			<td align = "right"><select name="bsatus2" id="bsatus2">
					<option value="">--상태 변경--</option>
					<option value="1">대기</option>
					<option value="3">연체</option>
					<option value="4">파손</option>
					<option value="5">분실</option>
			</select> <input type="button" id="adapt" name="adapt" value="적용하기"></td>
		</tr>
	</table>
	<input type="hidden" name="sort" value="${SORT}"> <input type="hidden" name="nowPage" value="${PINFO.nowPage}">
</form>

<%@ include file="/inc/bottom.jsp"%>