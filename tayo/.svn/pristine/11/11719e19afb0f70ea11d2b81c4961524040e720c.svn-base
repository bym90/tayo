<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>

<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir2",
	sSkinURI: "/common/se/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
// 		oEditors.getById["ir2"].exec("PASTE_HTML", [${sessionScope.NAME }]);
	},
	fCreator: "createSEditor2"
});

</script>
	<!-- 자유게시판 목록 보기 -->
		<hr>
		<div class="row">
		    <div class="col-lg-12">
		        <h1 class="page-header">게시판<small> 자유게시판</small>
		        </h1>
		        <ol class="breadcrumb">
		            <li><a href="/tayo">홈 </a></li>
		            <li><a href="/tayo/free/FreeBoardList.do">게시판 </a></li>
		            <li class="active">자유게시판</li>
		        </ol>
		    </div>
		</div>
	<!-- /.row -->
	
	<form id="boardFrm" name="boardFrm" method="POST">
		<input type="hidden" name="page" value="${PAGE}">
		<input type="hidden" name="writer" value="${sessionScope.NAME }">
		<table class="table">
			<tr>
				<td width="15%">작성자</td>
				<td width="*"><input type="text" name="writer2" id="writer2" type="text" class="form-control W50" readonly="readonly" value="${sessionScope.NAME }(${sessionScope.ID })"></td>
				<td width="20%"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title" type="text" class="form-control W50" value="${DATA.title }"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">
					<textarea name="ir1" id="ir1" style="width:900px; height:300px;"></textarea>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td colspan="3"> -->
<!-- 					<textarea name="ir2" id="ir2" style="width:900px; height:300px;"></textarea> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td colspan="2" class="TAR">
					<input type="button" id="wBtn" name="wBtn" class="btn btn-info" value="작성하기" onclick="board.freeBoardWriteProc();" >
				</td>
				<td></td>				
			</tr>
		</table>
	</form>
	


<%@ include file="/inc/bottom.jsp" %>