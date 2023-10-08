$(document).ready(function() {
	
	//mypage 선택된 메뉴 active처리
	var currUrl = window.location.pathname;
	if ($("#mypageMenus")) {
		$("#mypageMenus").find("a").removeClass("list-group-item-primary");
		$("#mypageMenus").find("a").each(function(index, item) {
			if (currUrl == $(item).attr("href")) {
				$(item).addClass("list-group-item-primary");
			}
		});
	}
	
	//----------------------------------------
	//내 정보 수정에서 사용
	$.validator.addMethod("notEqualTo",  function( value, element, param ) {
		var target = $( param );
		return this.optional(element) ||  value !== target.val();
	});
	
	//내 정보 수정에서 저장할때
	$("#userForm").validate({
		rules : {
			password : {
				required : true
			},
			newPassword : {
				required : true,
				notEqualTo : "#password"
			},
			newPasswordConfirm : {
				required : true,
				equalTo : "#newPassword"
			}
		},
		messages : {
			password : {
				required : "현재 비밀번호를 입력하세요."
			},
			newPassword : {
				required : "변경할 신규 비밀번호를 입력하세요.",
				notEqualTo : "현재 비밀번호와 다른 값을 입력해야 합니다."
			},
			newPasswordConfirm : {
				required : "변경할 비밀번호를 다시 한번 입력해주세요.",
				equalTo : "신규 비밀번호와 동일한 값을 입력해주세요."
			}
		},
		submitHandler: function (form) {
			
			if (!confirm("저장하시겠습니까?")) {
    			return false;
    		}
			
			$.ajax({
				type : "post",
				url  : "/mypage/saveUserInfo.do",
				data : $(form).serialize(),
				dataType : "json",
				success:function(result){
					if (result.resultCode == 'fail') {
		        		alert(result.resultMessage);
		                return;
		        	}

					alert("저장되었습니다");
					location.reload();
				}
			});
		}
	});	
});