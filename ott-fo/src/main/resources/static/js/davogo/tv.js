

$(document).ready(function() {
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
			return false;
		}
	}).on('shown.bs.modal', function (event) {
		
		//var button = $(event.relatedTarget);
		//var prdNo = button.data("prd-no");
		
		$.ajax({
			type : "post",
			url  : "/tv/comment.do",
			data : {
				mediaId : $(event.relatedTarget).attr('media_id'),
				assessRate : $('#assess_rate').val()
			},
			dataType : "html",
			success:function(result){
				//result.title = "상품정보 보기";
				var modalDiv = $(event.target).find(".modal-body");
				modalDiv.append(result);
			}
		});
	});
	
	$('#mediaWriteModal').on('hidden.bs.modal', function (event) {
		var modalDiv = $(event.target).find(".modal-body");
		modalDiv.empty();
	});
	
	$("#saveBtn").on('click', function() {
		$.ajax({
			type : "post",
			url  : "/tv/saveMediaComment.do",
			data : $("#commentForm").serialize(),
			dataType : "json",
			success: function(result) {
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}
				
	            alert("저장되었습니다.");
				location.reload();
			},
			error: function( xhr, status, error ) {
				alert(error);
			}
		});
	});
});