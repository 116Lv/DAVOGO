<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form id="voteForm" name="voteForm" method="POST">
	<div class="card">
		<input type="hidden" id="writer" name="writer" value="${loginUser.emailId }">
		<input type="hidden" id="comm_div" name="comm_div" value="1">
		<label for="content"><b>제목</b></label>
		<input type="text" id="title" name="title" placeholder="제목" required><br/>
		<label for="rowContent"><b>투표 보기항목</b></label>
		<div class="column-container">
			
		</div>
	</div>
	<div>
		<button type="button" id="addRow">보기 추가</button>
	</div>
</form>

<script type="text/javascript">
$(document).ready(function() {
	$("#addRow").on('click', function() {
		 
		var newRow = $("<div class='custom-row'></div>");
		
		// 투표 컬럼 입력란을 생성하고 설정
        var newTextarea = $("<textarea></textarea>");
        newTextarea.attr("placeholder", "투표 보기내용");
        newTextarea.attr("rows", "3"); // 원하는 높이로 조절할 수 있습니다.
        newTextarea.attr("name", "items"); // name 속성 추가
        newTextarea.attr("class", "col-11");
        
        var newButton = $("<button>");
        newButton.text("행 삭제");
        newButton.attr("type", "button");
        newButton.attr("class", "col-1 removeColumn");
        newButton.css({
            "display": "flex",
            "flex-direction": "column",
            "justify-content": "center",
            "align-items": "center",
            "text-align": "center"
        });
        
		// 생성한 입력란을 새로운 행에 추가
        newRow.append(newTextarea);
		newRow.append(newButton);

		// 새로운 행을 컨테이너에 추가
        $(".column-container").append(newRow);
	});
	
	$(document).on('click', '.removeColumn', function() {
        // 클릭한 버튼의 부모인 custom-row를 찾고 그 안의 input과 버튼을 삭제합니다.
        $(this).closest('.custom-row').remove();
    });
	
	$("#voteForm").validate({
		rules : {
			title : {
				required : true
			}
		},
		messages : {
			title : {
				required : "제목은 필수 입력입니다."
			}
		},
		submitHandler(form) {
			
			//보기는 1건 이상이여야 함.
			if ($(form).find("textarea[name=items]").length  < 2) {
				alert("선택 보기항목은 2건 이상 입력되어야 합니다.");
				return false;
			}
			
			if (!confirm("저장하시겠습니까?")) {
    			return false;
    		}
			
			$.ajax({
				type : "post",
				url  : "/comm/saveVote.do",
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
		}
	});
});
</script>
