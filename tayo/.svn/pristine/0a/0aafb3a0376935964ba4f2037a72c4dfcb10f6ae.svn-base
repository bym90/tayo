var oEditors = [];
var oEditors2 = [];
var common = {
	"init":function(object){
		$(object).find(".COMMON_CALENDAR").datepicker({ monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],dayNames: ['일','월','화','수','목','금','토'],dayNamesShort: ['일','월','화','수','목','금','토'],dayNamesMin: ['일','월','화','수','목','금','토'],dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],dateFormat: 'yy-mm-dd',showMonthAfterYear:true,buttonImageOnly: true,buttonText: "달력",	yearSuffix: '년',autoSize: true,showOn: 'both',	changeYear: true,yearRange: 'c-10:c+2',showAnim : '',buttonImage: '/tayo/common/css/images/ico/ico_calendar.gif'});
		if($(object).find("#ir1").length){ nhn.husky.EZCreator.createInIFrame({ oAppRef: oEditors, elPlaceHolder: "ir1", sSkinURI: "/tayo/common/se/SmartEditor2Skin.html", htParams : { bUseToolbar : true, bUseVerticalResizer : true, bUseModeChanger : true, fOnBeforeUnload : function(){}}, fOnAppLoad : function(){}, fCreator: "createSEditor2" });}
		if($(object).find("#ir2").length){ nhn.husky.EZCreator.createInIFrame({	oAppRef: oEditors2,	elPlaceHolder: "ir2",sSkinURI: "/tayo/common/se/SmartEditor2Skin.html", htParams : {	bUseToolbar : true,	bUseVerticalResizer : true,	bUseModeChanger : true,	fOnBeforeUnload : function(){}}, fOnAppLoad : function(){}, fCreator: "createSEditor2"	});}
		$(object).find(".COMMON_CALENDAR_BIRTH").datepicker({ monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], dayNames: ['일','월','화','수','목','금','토'], dayNamesShort: ['일','월','화','수','목','금','토'], dayNamesMin: ['일','월','화','수','목','금','토'], dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], dateFormat: 'yymmdd', showMonthAfterYear:true, buttonImageOnly: true, buttonText: "달력", 	yearSuffix: '년', autoSize: true, showOn: 'both', changeYear: true, yearRange: 'c-100:c+0', showAnim : '',	buttonImage: '/tayo/common/css/images/ico/ico_calendar.gif'});
	}
};
$(document).ready(function() {
	common.init($("BODY"));
});