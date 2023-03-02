var table;
$(document).ready(function() {
	
	searchList();
	
	//연차 추가 또는 수정시에 호출
	$('#annual-modal').on('shown.bs.modal', function (event) {
		var modalDiv = $(event.target);
		var modalBody = modalDiv.find(".modal-body");
		modalBody.empty();
		
		//수정일때만 읽을 수 있는 값
		var button = $(event.relatedTarget);
		var annualNo = button.data("annual-no");
		
		if (annualNo) {
			modalDiv.find(".modal-title").text("연차 수정");
			$.ajax({
				type : "get",
				url  : "/user/getAnnuanlInfo.do",
				data : {'annualNo': annualNo},
				dataType : "json",
				success:function(result){
					$("#annualInputTemplate").tmpl(result.info).appendTo(modalBody);
				}
			});
		} else {
			modalDiv.find(".modal-title").text("연차 등록");
			var data = { 
				'userNo': userNo
			};
			$("#annualInputTemplate").tmpl(data).appendTo(modalBody);
		}
		
		$('.datepicker').datepicker({
			minDate: '-1m'
			, maxDate: '+1m'
		});
		$('#occurDt').trigger('focus');
	});
	
	//연차 등록/수정 창이 닫힐때 호출
	$('#annual-modal').on('hidden.bs.modal', function (event) {
		$(this).find(".modal-body").empty();
	});	
});

//연차내역 조회
function searchList() {
	
	//올해만 연차내역 추가 가능
	if (new Date().getFullYear() == $("#searchYear").val()) {
		$("#annual-add-btn").attr("disabled", false);
	} else {
		$("#annual-add-btn").attr("disabled", true);
	}
	
	$.ajax({
		type : "post",
		url  : "/user/findUsedAnnualList.do",
		data : $("#annualSearchForm").serialize(),
		dataType : "json",
		success:function(result){
			$("#annualListArea").empty();
			$("#annualSummary").empty();
			
			if (!result.list || result.list.length == 0) {
				$("#annualNoDataTemplate").tmpl().appendTo("#annualListArea");
			} else {
				$("#annualListTemplate").tmpl(result.list).appendTo("#annualListArea");
			}
			
			$("#annualSummaryTemplate").tmpl(result.summary).appendTo("#annualSummary");
		}
	});
	
}

//연차 정보 저장
function saveAnnualInfo() {
	
	$("#annualEditForm").validate({
		errorPlacement: function(error, element) {
			if(element.is(":radio") || element.is(":checkbox")) {
				element.parent().parent().after(error);
			} else {
				element.after(error);
			}
		},
        submitHandler: function(form) {
			//console.log("validate success!");
        	
        	if (!confirm("저장하시겠습니까?")) {
    			return false;
    		}
        	
        	$.ajax({
				type : "post",
				url  : "/user/saveAnnualInfo.do",
				data : $(form).serialize(),
				dataType : "json",
				success:function(result){
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}

					$('#annual-modal').modal('hide');
                    notify("저장되었습니다.");
					searchList();
				}
			});
        }
    });
}

//연차 정보 삭제
function deleteAnnualInfo(obj) {
	
	var button = $(obj);
	var annualNo = button.data("annual-no");
	
	if (!confirm("삭제하시겠습니까?")) {
		return false;
	}
	
	$.ajax({
		type : "post",
		url  : "/user/deleteAnnualInfo.do",
		data : {'annualNo': annualNo},
		dataType : "json",
		success:function(result){
			if (result.resultCode == 'fail') {
        		alert(result.resultMessage);
                return;
        	}

            notify("삭제되었습니다.");
			searchList();
		}
	});	
}
