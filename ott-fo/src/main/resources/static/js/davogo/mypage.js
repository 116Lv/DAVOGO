$(document).ready(function() {
	
	//내 정보 수정에서 저장할때
	$("#userForm").validate({
		rules : {
			password : {
				required : true
			},
			newPassword : {
				required : true
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
				required : "변경할 신규 비밀번호를 입력하세요."
			},
			newPasswordConfirm : {
				required : "변경할 비밀번호를 다시 한번 입력해주세요.",
				equalTo : "신규 비밀번호와 동일한 값을 입력해주세요."
			}
		}
	});
});