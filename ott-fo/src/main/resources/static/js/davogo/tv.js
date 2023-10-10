$(document).ready(function() {
	
	//장르 선택시
	$(".genre").on("click", function(){
		var target = $(this);
		var genre = target.attr("genre");
		
		if (target.hasClass("active")) {	//이미 선택된 상태이면 
			location.href="/tv.do";
		} else {
			location.href="/tv/category.do?genre=" + genre;
		}
	});
	
	//미디어코멘트 모달창 open
	$('#mediaWriteModal').on('show.bs.modal', function (event) {
		if (!isLogin) {
			alert("로그인이 필요한 서비스입니다.");
			location.href = "/signIn.do";
			return false;
		}
	}).on('shown.bs.modal', function (event) {
		
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