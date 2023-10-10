

/* commVote에서 테이블 행추가시 작동 */
$(document).ready(function() {
	
	//투표생성 모달창 open
	$('#voteWriteModal').on('show.bs.modal', function (event) {
		if (!isLogin) {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		}
	}).on('shown.bs.modal', function (event) {
		
		$.ajax({
			type : "post",
			url  : "/comm/vote.do",
			/*data : {prdNo : prdNo},*/
			dataType : "html",
			success:function(result){
				//result.title = "상품정보 보기";
				var modalDiv = $(event.target).find(".modal-body");
				modalDiv.append(result);
			}
		});
	});
	
	//투표생성 모달창 close
	$('#voteWriteModal').on('hidden.bs.modal', function (event) {
		var modalDiv = $(event.target).find(".modal-body");
		modalDiv.empty();
	});
	
	//댓글 모달창 open
	$('#commentWriteModal').on('show.bs.modal', function (event) {
		if (!isLogin) {
			alert("로그인이 필요한 서비스입니다.");
			return false;
		}
	}).on('shown.bs.modal', function (event) { 
		
		$.ajax({
			type : "post",
			url  : "/comm/comment.do",
			data : {commId : $(event.relatedTarget).closest('.card').attr('comm_id')},
			dataType : "html",
			success:function(result){
				//result.title = "상품정보 보기";
				var modalDiv = $(event.target).find(".modal-body");
				modalDiv.append(result);
			}
		});
	});
	
	//댓글 모달창 close
	$('#commentWriteModal').on('hidden.bs.modal', function (event) {
		var modalDiv = $(event.target).find(".modal-body");
		modalDiv.empty();
		location.reload();
	});
	
	/* commWorldImage에서 라인삭제 클릭시 행삭제 */
	
    // 삭제 버튼이 클릭되면 SweetAlert로 확인 메시지를 표시합니다.
    $(".delete-button").click(function() {
	
		var $deleteButton = $(this);

        swal({
            title: "해당 라인을 삭제하시겠습니까?",
            text: "삭제하면 복구할 수 없습니다!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "네, 삭제할게요!",
            cancelButtonText: "취소",
            closeOnConfirm: true,
        }, function(isConfirm) {
            if (isConfirm) {
                // SweetAlert 확인을 선택하면 해당 행을 삭제합니다.
                $deleteButton.closest("tr").remove();
            }
        });
    });

	//투표생성 모달창 저장
	$("#saveBtn").on('click', function() {
		$("#voteForm").submit();
	});
	
	//메인창 정렬조건 화면반영
	$(".commMain .nav-item").on("click", function(event) {
		var target = $(event.target);
		var type = target.attr("type");
		$("#" + type).val(target.attr(type));
		$("#searchForm").submit();
	});
	
	//월드컵창 화면변경
	$(".commWorldInfo .nav-item").on("click", function(event) {
		var target = $(event.target);
		var type = target.attr("type");
		$("#" + type).val(target.attr(type));
		$("#searchForm").submit();	/*이게 맞는지 확인필요*/
	});
	
	//투표참여-클릭기능
	$("[name=vote_id]").on("click", function(event) {
		
		var chkObj = $(event.target);
		
		if(chkObj.is(':checked')) {
			//이미 선택된게 있는데 다른걸 체크한 경우 이전 선택한 것을 빼주는 로직
			chkObj.closest(".card").find("[name=vote_id]:checked").not(event.target).prop("checked", false);
			
			$.ajax({
				type : "post",
				url  : "/comm/clickVote.do",
				data : { voteId: chkObj.val(), commId: chkObj.closest('.card').attr('comm_id') },
				dataType : "json",
				success: function(result) {
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
						chkObj.prop("checked", false);
		                return;
		        	}
					
		            console.log("투표 처리되었습니다.");

					var items = result.items;
					if (items != null && items.length > 0) {
						for (i=0; i<items.length; i++) {
							var voteId = "#item" + items[i].voteId;
							var elem = $(voteId);
							elem.css("padding", "0");
							elem.css("height", "29.78px");
							elem.children().css("height", "100%");
							var percentage = Math.round(items[i].totalCnt / items[i].sumClickedCnt * 100);
							var progressBarObj = elem.children().children();
							progressBarObj.css("width", percentage + "%");
							progressBarObj.next().css("padding", ".375rem .75rem");
							progressBarObj.next().children().next().html(percentage + "%");
						}
					}
					
				},
				error: function( xhr, status, error ) {
					alert(error);
				}
			});
		} else {
			$.ajax({
				type : "post",
				url  : "/comm/clickVote.do",
				data : { voteId: chkObj.val(), commId: chkObj.closest('.card').attr('comm_id') },
				dataType : "json",
				success: function(result) {
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}
					
		            console.log("투표 취소되었습니다.");
					var items = result.items;
					if (items != null && items.length > 0) {
						for (i=0; i<items.length; i++) {
							var voteId = "#item" + items[i].voteId;
							var elem = $(voteId);
							elem.removeAttr("style");
							elem.children().css("height", "");
							var progressBarObj = elem.children().children();
							progressBarObj.removeAttr("style");
							progressBarObj.next().removeAttr("style");
							progressBarObj.next().children().next().html("");
						}
					}
					
				},
				error: function( xhr, status, error ) {
					alert(error);
				}
			});
		}
	});
	
	//좋아요
	$(".like").on("click", function(event) {
		$.ajax({
			type : "post",
			url  : "/comm/saveLike.do",
			data : {commId : $(this).closest('.card').attr('comm_id'), likeType: 'like'},
			dataType : "json",
			success:function(result){
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}
				
				var btnObj = $(event.target).closest('.row').find(".like");
				var cntObj = btnObj.next();
				//사용자가 좋아요를 누른 경우 
				if (btnObj.hasClass("btn-light")) {
					btnObj.removeClass("btn-light");
					btnObj.addClass("btn-primary");
					cntObj.html(parseInt(cntObj.html()) + 1);
					
					//싫어요 한게 있으면 없앰
					var dislikeBtnObj = $(event.target).closest('.row').find(".disLike");
					dislikeBtnObj.removeClass("btn-primary");
					dislikeBtnObj.addClass("btn-light");
				
				//사용자가 좋아요를 취소한 경우
				} else {
					btnObj.removeClass("btn-primary");
					btnObj.addClass("btn-light");
					cntObj.html(parseInt(cntObj.html()) - 1);
				}
				
			}
		});
	});
	
	//싫어요
	$(".disLike").on("click", function(event) {
		$.ajax({
			type : "post",
			url  : "/comm/saveLike.do",
			data : {commId : $(this).closest('.card').attr('comm_id'), likeType: 'dislike'},
			dataType : "json",
			success:function(result){
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}

				var btnObj = $(event.target).closest('.row').find(".disLike");
				//사용자가 싫어요를 누른 경우 
				if (btnObj.hasClass("btn-light")) {
					btnObj.removeClass("btn-light");
					btnObj.addClass("btn-primary");
					
					//좋아요 한게 있으면 없앰
					var likeBtnObj = $(event.target).closest('.row').find(".like");
					likeBtnObj.removeClass("btn-primary");
					likeBtnObj.addClass("btn-light");
					var cntObj = likeBtnObj.next();
					var likeCnt = parseInt(cntObj.html()) - 1;
					cntObj.html(likeCnt < 0 ? 0 : likeCnt);
				
				//사용자가 싫어요를 취소한 경우
				} else {
					btnObj.removeClass("btn-primary");
					btnObj.addClass("btn-light");
				}
			}
		});
	});
	
});

//댓글 리로드
function reloadComments(commId) {
	var modalDiv = $('#commentWriteModal').find(".modal-body");
	modalDiv.empty();
	$.ajax({
		type : "post",
		url  : "/comm/comment.do",
		data : {commId : commId},
		dataType : "html",
		success:function(result){
			modalDiv.append(result);
		}
	});
}