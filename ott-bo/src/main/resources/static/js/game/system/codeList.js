$(document).ready(function() {
	loadPage('/js/lds/paginationTemplate.html', "body");
	searchList(1);
	
	//코드 추가 또는 수정시에 호출
	$('#code-modal').on('shown.bs.modal', function (event) {
		var modalDiv = $(event.target);
		var modalBody = modalDiv.find(".modal-body");
		modalBody.empty();
		
		var button = $(event.relatedTarget);
		var codeType = button.data("code-type");	//jquery data att사용시 대문자가 안되니 주의할 것.
		var code = button.data("code");
		//console.log("codeType, code", codeType, code);
		
		if (codeType && code) {
			modalDiv.find(".modal-title").text("코드 수정");
			$.ajax({
				type : "get",
				url  : "/system/codeInfo.do",
				data : {'codeType': codeType, 'code' : code},
				dataType : "json",
				success:function(result){
					//console.log(result.code);
					result.code.mode = 'modify';
					$("#codeInputTemplate").tmpl(result.code).appendTo(modalBody);
				}
			});
		} else {
			modalDiv.find(".modal-title").text("코드 등록");
			$("#codeInputTemplate").tmpl({mode:'add'}).appendTo(modalBody);
		}
		
		$('#codeType').trigger('focus');
	});
	
	//코드 등록/수정 창이 닫힐때 호출
	$('#code-modal').on('hidden.bs.modal', function (event) {
		$(this).find(".modal-body").empty();
	});
	
});

//코드 목록 보기
function searchList(pageNo) {
	var frm = $('#codeForm');
	if (pageNo >= 1) {
		frm.find(":hidden[name=pageIndex]").val(pageNo);
	}
	
	$.ajax({
		type : "post",
		url  : "/system/codeListOfType.do",
		data : frm.serialize(),
		dataType : "json",
		success:function(result){
			$("#codeListArea").empty();
			$("#codeListTemplate").tmpl(result.codeList).appendTo("#codeListArea");
			
			$("#codePageArea").empty();
			var data = {page : result.pagination, jsFunction: 'searchList'};
			$("#paginationTemplate").tmpl(data).appendTo("#codePageArea");
		}
	});
}

//코드유형별 코드 목록 보기
function showCodeList(codeType) {
	$('#codeForm').find(":hidden[name=codeType]").val(codeType);
	searchList(1);
	
	if (codeType != '') {
		$('#codeListArea').sortable({
			placeholder: "ui-state-highlight",
			stop: function(event, ui) {
				//console.log("codeType", codeType);
				sortAndSave(codeType);
			}
		});
		$('#codeListArea').draggable();
	} else {
		$('#codeListArea').sortable('destroy');
	}
}

//저장
function saveCode() {
	
	$("#codeEditForm").validate({
        submitHandler: function(form) {
			//console.log("validate success!");
        	
        	if (!confirm("저장하시겠습니까?")) {
    			return false;
    		}
        	
        	$.ajax({
				type : "post",
				url  : "/system/saveCode.do",
				data : $(form).serialize(),
				dataType : "json",
				success:function(result){
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}

					$('#code-modal').modal('hide');
		            alert("저장되었습니다.");
					refreshPage();
				}
			});
        }
    });
}

//삭제
function deleteCode(obj) {
	var button = $(obj);
	var codeType = button.data("code-type");	//jquery data att사용시 대문자가 안되니 주의할 것.
	var code = button.data("code");
	//console.log("codeType, code", codeType, code);
	
	if (!confirm("삭제하시겠습니까?")) {
		return false;
	}
	
	$.ajax({
		type : "post",
		url  : "/system/deleteCode.do",
		data : {'codeType': codeType, 'code' : code},
		dataType : "json",
		success:function(result){
			if (result.resultCode == 'fail') {
        		alert(result.resultMessage);
                return;
        	}

            alert("삭제되었습니다.");
			refreshPage();
		}
	});	
}

//화면 재조회
function refreshPage() {
	window.location.reload(true);
}

//순서 재정렬&저장
function sortAndSave(codeType) {
	$('#codeListArea').find(":hidden[name=sno]").each(function(idx, item) {
		$(item).val(idx+1);
	});
	
	$.ajax({
		type : "post",
		url  : "/system/saveCodeSort.do",
		data : "codeType=" + codeType + "&" + $('#sortForm').serialize(),
		dataType : "json",
		success:function(result){
			if (result.resultCode == 'fail') {
        		alert(result.resultMessage);
                return;
        	}

			$.NotificationApp.send("","순서가 변경되었습니다.","bottom-center","rgba(0,0,0,0.2)","info", 1000);
			showCodeList(codeType);
		}
	});
}