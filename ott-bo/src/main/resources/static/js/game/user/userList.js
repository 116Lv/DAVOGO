$(document).ready(function() {
	loadPage('/js/lds/paginationTemplate.html', "body");
	searchUserList(1);
});

//모델 목록 보기
function searchUserList(pageNo) {
	var frm = $('#userSearchForm');
	if (pageNo >= 1) {
		frm.find(":hidden[name=pageIndex]").val(pageNo);
	}
	
	$.ajax({
		type : "post",
		url  : "/user/userListData.do",
		data : frm.serialize(),
		dataType : "json",
		success:function(result){
			
			$("#userListArea").empty();
			$("#userPageArea").empty();
			
			if (!result.list || result.list.length == 0) {
				$("#userNoDataTemplate").tmpl().appendTo("#userListArea");
			} else {
				$("#userListTemplate").tmpl(result.list).appendTo("#userListArea");
			}
			
			var data = {page : result.pagination, jsFunction: 'searchUserList'};
			$("#paginationTemplate").tmpl(data).appendTo("#userPageArea");
			
			$("#userPageArea .totCnt").text(result.pagination.totalRecordCount);
			
		}
	});
}
