$(document).ready(function() {
	
	//미디어 댓글 모달창 open
	$('#mediaWriteModal').on('show.bs.modal', function (event) {
		if (!isLogin) {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "/signIn.do";
			return false;
		}
	}).on('shown.bs.modal', function (event) {
		
		//var button = $(event.relatedTarget);
		//var prdNo = button.data("prd-no");
		
		$.ajax({
			type : "post",
			url  : "/media/comment.do",
			data : {
				mediaId : $(event.relatedTarget).attr('media_id'),
				assessRate : $('#assess_rate').val()
			},
			dataType : "html",
			success:function(result){
				var modalDiv = $(event.target).find(".modal-body");
				modalDiv.append(result);
			}
		});
	});
	
	//미디어 댓글 모달창 닫기
	$('#mediaWriteModal').on('hidden.bs.modal', function (event) {
		var modalDiv = $(event.target).find(".modal-body");
		modalDiv.empty();
	});
	
});