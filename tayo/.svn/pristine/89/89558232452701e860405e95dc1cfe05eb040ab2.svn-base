var board = {
	"freeBoardWriteForm":function(){
		var frm = document.boardFrm;
		frm.action = "./FreeBoardWriteForm.do";
		frm.submit();
	},
	"freeBoardWriteProc":function(){
		var frm = document.boardFrm;
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		var content =$("#ir1").val();
		if(content =="<p>&nbsp;</p>"){
			alert("본문 내용을 입력해주세요.");
			return;
		}
		frm.action= "./FreeBoardWriteProc.do";
		frm.submit();
	},
	"freeBoardViewToList":function(){
		var frm = document.boardFrm;
		frm.action = "./FreeBoardList.do";
		frm.submit();
	},
	"freeBoardModifyForm":function(){
		var frm = document.boardFrm;
		frm.action = "./FreeBoardModify.do";
		frm.submit();
	},
	"freeBoardDeleteProc":function(){
		var frm = document.boardFrm;
		frm.action = "./FreeBoardDelete.do";
		frm.submit();
	},
	"freeBoardModifyProc":function(){
		var frm = document.boardFrm;
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		frm.action = "./FreeBoardModifyProc.do";
		frm.submit();
	},
	"freeBoardGoodProc":function(){
		var frm = document.boardFrm;
		frm.action = "./FreeBoardGood.do";
		frm.submit();
	},
	"freeBoardBadProc":function(){
		var frm = document.boardFrm;
		frm.action = "./FreeBoardBad.do";
		frm.submit();
	},
	"freeBoardSearch":function(){
		var frm = document.sFrm;
		frm.action = "./FreeBoardSearch.do";
		frm.submit();
	},
	"freeBoardRepleProc":function(){
		var frm = document.repleFrm;
		frm.action = "./FreeBoardRepleWrite.do";
		frm.submit();
	},
	"freeBoardRepleModify":function(no){
//		이 번호에 해당하는 테이블을 알아낸다.
		var	ta = document.getElementById("t" + no);
		//	화면에서 그 테이블을 숨기도록 한다.
		ta.style.display = "none";
		
		// 기존 테이블은 숨기면서 새로 보여줄 폼 테이블을 알아낸다.
		var	mt = document.getElementById("m" + no);
		//	이 테이블을 화면에 출력한다.
		mt.style.display = "";
	},
	"freeBoardRepleModifyProc":function(datano){
		var	form = document.getElementById("frm" + datano);
		//	무결성 검사하시고
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		form.action = "./FreeBoardRepleModify.do";
		form.submit();
	}
}