<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/inc/header.jsp" %>
<script>
	function showHide(no) {
		var div = document.getElementsByName("div" + no);
		if(div[0].style.display == "none") {
		div[0].style.display = "";
		}
		else {
			div[0].style.display = "none";
		}
	}
</script>
	<!-- 자유게시판 글 상세보기 -->
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
	
	<form name="boardFrm" id="boardFrm" method="POST">
		<input type="hidden" name="page" value="${PAGE}">
		<input type="hidden" name="no" value="${DATA.no}">
		<table class="table">
			<thead>
				<tr>
					<th>작성자</th>
					<th>${DATA.writer}</th>
					<th>작성일</th>
					<th>${DATA.date}</th>
					<th>조회수</th>
					<th>${DATA.hit}</th>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5">${DATA.title}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6" style="height:100px">
						${DATA.content }
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" align="center">
						<button id="goodBtn" class="btn btn-success" onclick="board.freeBoardGoodProc();" ><i class="fa fa-thumbs-o-up" style="font-size:20px;"> <span class="badge"> ${DATA.good }</span></i></button>
						<button id="badBtn" class="btn btn-success" onclick="board.freeBoardBadProc();"><i class="fa fa-thumbs-o-down" style="font-size:20px;"> <span class="badge"> ${DATA.bad }</span></i></button>
					</td>
				</tr>
				<tr>
					<td colspan="6" class="TAR">
						<input type="button" name="lBtn" value="목록보기" onclick="board.freeBoardViewToList();">
						<input type="button" name="mBtn" value="수정하기" onclick="board.freeBoardModifyForm();">
						<input type="button" name="dBtn" value="삭제하기" onclick="board.freeBoardDeleteProc();">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	

	
	<div class="row">
           <div class="col-lg-12">
               <div class="panel-group" id="accordion">
                   <c:forEach var="reple" items="${REPLE }" varStatus="st">
                   <!-- 반복 -->
                   <div class="panel panel-default" onClick="JavaScript:showHide(${st.index})">
                       <div class="panel-heading">
                           <h4 class="panel-title">
                               <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-hand-right"> ${reple.title }</span></a>
                           </h4>
                       </div>
<%--                        <div id="div${st.index}" class="panel-collapse collapse"> --%>
                       <div id="collapseOne" class="panel-collapse" style="display:none" name="div${st.index}">
                       
                           <div class="panel-body">
                               <table class="table" id="t${reple.no}">
									<tr>
										<th width="20%">번호</th>
										<td width="*">${reple.no }</td>
										<th width="20%">날짜</th>
										<td width="*" >${reple.date }</td>
										<td><a href="./FreeBoardRepleDelete.do?no=${reple.no }&reno=${DATA.no}&page=${PAGE}">삭제</a></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${reple.writer }</td>
										<th>작성IP</th>
										<td>${reple.ip }</td>
										<td><a href="#" onclick="board.freeBoardRepleModify(${reple.no});">수정</a></td>
									</tr>
									<tr>
										<td colspan="5" style="height:100px;">${reple.content }</td>
										</tr>
										<tr>
											<td colspan="5"></td>
										</tr>
								</table>
								<%--답글을 수정하는 폼을 미리 만들어 놓고 나중에 보여주자--%>		
								<form method="POST" id="frm${reple.no}">
									<input type="hidden" name="reno" value="${reple.no}">
									<input type="hidden" name="no" value="${DATA.no }">
									<input type="hidden" name="page" value="${PAGE }">
									<input type="hidden" name="category" value="1"><%--자유게시판 1, 신고게시판 2 --%>
									<table class="table" id="m${reple.no}" style="display:none;">
										<tr>
											<th>작성자</th>
											<td>
												<input type="text" name="writer" id="writer" value="${reple.writer}" readonly>
											</td>
										</tr>
										<tr>
											<td>제목</td>
											<td>
												<input type="text" class="form-control W50" name="title" id="title" value="${reple.title}">
											</td>
										</tr>
										<tr>
											<th>작성글</th>
											<td>
												<textarea name="ir1" id="ir1" style="width:600px; height:150px; align:center; ">${reple.content}</textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<a href="#" class="btn btn-warning" >수정하기</a>
											</td>
										</tr>
									</table>
								</form>
                           </div>
                       </div>
                   </div>
                   <!-- /.panel/repeat -->
                   </c:forEach>
               </div>
               <!-- /.panel-group -->
           </div>
           <!-- /.col-lg-12 -->
       </div>



<%-- 답글 쓰기 폼을 만든다. --%>
	<form method="POST" name="repleFrm" id="repleFrm">
	<%--답글을 쓸 경우에는 반드시 이 글이 어떤 글에대한 답글인지를
			알려주어야 한다.
			form에 있는 데이터를 보내는 경우에는 따로 데이터를 보낼 수 없다.
			반드시 필요한 데이터는 반드시 폼 안에 있어야 한다.
			
			이럴 경우 사용하는 폼이 <input type="hidden"> 이다.
	 --%>
	 	<input type="hidden" name="no" value="${DATA.no }">
	 	<input type="hidden" name="page" value="${PAGE}">
		<table class="table">
			<tr>
				<th colspan="2" style="text-align:center;">댓글 작성하기</th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="form-control W50" name="writer" id="writer" value="${sessionScope.NAME }">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" class="form-control W50" name="title" id="title">
				</td>
			</tr>
			<tr>
				<td>답글</td>
				<td>
					<textarea name="content" id="content" class="form-control" style="width:100%; height:150px; align:center; "></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="#" onclick=javascript:board.freeBoardRepleProc();>댓글쓰기</a>
				</td>
			</tr>
		</table>
	</form>	

	
	

<%@ include file="/inc/bottom.jsp" %>