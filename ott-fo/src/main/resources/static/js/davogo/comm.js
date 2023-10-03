

/* commVote에서 테이블 행추가시 작동 */
$(document).ready(function() {
	
	//모달창 open
	$('#voteWriteModal').on('shown.bs.modal', function (event) {
		
		//var button = $(event.relatedTarget);
		//var prdNo = button.data("prd-no");
		
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
	
	//모달창 close
	$('#voteWriteModal').on('hidden.bs.modal', function (event) {
		var modalDiv = $(event.target).find(".modal-body");
		modalDiv.empty();
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

	$("#saveBtn").on('click', function() {
		$.ajax({
			type : "post",
			url  : "/comm/save.do",
			data : $("#voteForm").serialize(),
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
	
	$(".commMain .nav-item").on("click", function(event) {
		var target = $(event.target);
		var type = target.attr("type");
		$("#" + type).val(target.attr(type));
		$("#searchForm").submit();
	});
	
	$("[name=vote_id]").on("click", function(event) {
		if($(event.target).is(':checked')) {
			$.ajax({
				type : "post",
				url  : "/comm/saveVote.do",
				data : { voteId: $(event.target).val(), commId: $(event.target).attr("commId"), action: "vote" },
				dataType : "json",
				success: function(result) {
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}
					
		            alert("투표 처리되었습니다.");
					var items = result.items;
					if (items != null && items.length > 0) {
						for (i=0; i<items.length; i++) {
							var voteId = "#item" + items[i].voteId;
							var elem = $(voteId);
							elem.css("padding", "0");
							elem.children().css("height", "100%");
							var percentage = items[i].totalCnt / items[i].sumClickedCnt * 100;
							elem.children().children().css("width", percentage + "%");
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
				url  : "/comm/saveVote.do",
				data : { voteId: $(event.target).val(), commId: $(event.target).attr("commId"), action: "cancel" },
				dataType : "json",
				success: function(result) {
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}
					
		            alert("투표 취소되었습니다.");
					var items = result.items;
					if (items != null && items.length > 0) {
						for (i=0; i<items.length; i++) {
							var voteId = "#item" + items[i].voteId;
							var elem = $(voteId);
							elem.css("padding", "");
							elem.children().css("height", "");
							var percentage = items[i].totalCnt / items[i].sumClickedCnt * 100;
							elem.children().children().removeAttr("style");
						}
					}
					
				},
				error: function( xhr, status, error ) {
					alert(error);
				}
			});
		}
	});
	
});