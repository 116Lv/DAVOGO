var table;
$(document).ready(function() {
	loadPage('/js/lds/paginationTemplate.html', "body");

	//코드유형 조회
	jsCodeTree();
	
	init();
	
	//코드유형  등록 창이 닫힐때 호출
	$('#codeType-modal').on('hidden.bs.modal', function (event) {
		$("#codeType").val("");
		$("#codeTypeName").val("");
	});

	//코드 추가 또는 수정시에 호출
	$('#code-modal').on('shown.bs.modal', function (event) {
		var modalDiv = $(event.target);
		var modalBody = modalDiv.find(".modal-body");
		modalBody.empty();
		
		//수정일때만 읽을 수 있는 값
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
			var activeNode = $("#tree").dynatree("getActiveNode");
			var data = { 
				mode:'add'
				, codeType: activeNode.data.codeType
				, pCode: activeNode.data.code || ''
				, codeTypeName: activeNode.data.title
				, codeLevel: parseInt(activeNode.data.codeLevel) + 1
			};
			$("#codeInputTemplate").tmpl(data).appendTo(modalBody);
		}
		
		$('#codeType').trigger('focus');
	});
	
	//코드 등록/수정 창이 닫힐때 호출
	$('#code-modal').on('hidden.bs.modal', function (event) {
		$(this).find(".modal-body").empty();
	});
});

/* 코드 Tree 출력 */
function jsCodeTree(){
	//코드 추가 버튼 미사용
	$("#btn-code-add").attr("disabled", true);
	
	$("#tree").dynatree({
		debugLevel: 1, // 0:quiet, 1:normal, 2:debug
		children: [ //시스템 최상단            
			{
				title: "전체", 
				key: "000000",
				level: "0",
				expand: true, 
				isFolder: true, 
				addClass: "root"
			}
		], 
		fx: { height: "toggle", duration: 50 },
		//onCreate : 트리구조 출력(대분류 ~ 소분류)
		onCreate: function(node, span) {
			
			if (node.data.key == "000000"){
				
				node.appendAjax({
					url: contextPath + "/system/codeTreeData.do",
					dataType: 'json',
					async: false
				});
				
			}
			
		},
		//clickFolderMode : (3) 폴더를 한번 클릭하면 하단폴더가 열리고 설정창이 나옴
		clickFolderMode: 3,
		//onLazyRead : 트리구조 출력(중분류 ~ 소분류)
		onLazyRead: function(dtnode){
			
			dtnode.appendAjax({
				url: contextPath + "/system/subCodeTreeData.do",
				dataType: 'json',
				async: false,
				data: {codeType: dtnode.data.key}
			});
			
		},
		// onClick : 각각의 폴더에 따라 상세조회페이지 출력하기 (소분류는 상세조회가 없다)
		onClick : function(dtnode){   
			
			//선택한 부분의 key
			var codeType = dtnode.data.codeType;
			var code = dtnode.data.code;
			var codeLevel = parseInt(dtnode.data.codeLevel) + 1;
			
			showCodeList(codeType, code, codeLevel);
			init();
		}
	});
}

//코드유형별 코드 목록 보기
function showCodeList(codeType, code, codeLevel) {
	
	//console.log("showCodeList,", codeType, code, codeLevel);
	$('#codeForm').find(":hidden[name=codeType]").val(codeType);
	$('#codeForm').find(":hidden[name=code]").val(code || '');
	$('#codeForm').find(":hidden[name=codeLevel]").val(codeLevel);
	searchList(1);
	
	//코드 추가 버튼 사용
	$("#btn-code-add").attr("disabled", false);
		
	//sorting 기능-모바일이 아닌 경우만 사용
	if (!isMobile()) {
		if (codeType != '') {
			$('#codeListArea').sortable({
				placeholder: "ui-state-highlight",
				update: function(event, ui) {
					sortAndSave(codeType);
				}
			});
			$('#codeListArea').draggable();
			
		} else {
			$('#codeListArea').sortable('destroy');
		}
	}	
}

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
		success: function(result) {
			
			$("#codeListArea").empty();
			$("#codeListTemplate").tmpl(result.codeList).appendTo("#codeListArea");
			
			$("#codePageArea").empty();
			var data = {page : result.pagination, jsFunction: 'searchList'};
			$("#paginationTemplate").tmpl(data).appendTo("#codePageArea");
			
			$("#totCnt").text(result.pagination.totalRecordCount);
		}
	});
}

function init() {
	table = $("#code-datatable").DataTable({
		searching: false,
		ordering: false,
		lengthChange: false,
		info: false,
		paging: false,
		retrieve: true,
		scrollX: true,
		scrollCollapse: true,
		fixedColumns: true
	});
}

//코드유형 저장
function saveCodeType() {
	
	$("#codeTypeEditForm").validate({
        submitHandler: function(form) {
			//console.log("validate success!");
        	
        	if (!confirm("저장하시겠습니까?")) {
    			return false;
    		}
        	
        	$.ajax({
				type : "post",
				url  : "/system/saveCodeType.do",
				data : $(form).serialize(),
				dataType : "json",
				success:function(result){
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}

					$('#codeType-modal').modal('hide');
		            $.NotificationApp.send("","저장되었습니다.","bottom-center","rgba(0,0,0,0.2)","info", 1000);

					$("#tree").dynatree("getTree").reload();
				}
			});
        }
    });
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
                    $.NotificationApp.send("","저장되었습니다.","bottom-center","rgba(0,0,0,0.2)","info", 1000);
					searchList(1);
					
					//$("#tree").dynatree("getTree").reload();
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

            $.NotificationApp.send("","삭제되었습니다.","bottom-center","rgba(0,0,0,0.2)","info", 1000);
			searchList(1);
			
			//$("#tree").dynatree("getTree").reload();
		}
	});	
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
			searchList(1);
			
			//$("#tree").dynatree("getTree").reload();
		}
	});
}