$(document).ready(function() {
    $('.datepicker').datepicker();
});

//우편번호 검색 열기
function openPostcodeSearch() {

    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                $("#addrExtra").val(extraAddr);
            
            } else {
                $("#addrExtra").val('');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#postCode').val(data.zonecode);
            $("#addrBasic").val(addr);

            // 커서를 상세주소 필드로 이동한다.
            $("#addrDetail").focus();

        }
    }).open();

}

//직원 저장
function saveUser() {
	
	$.validator.addMethod("userIdCkeck",  function( value, element ) {
		return this.optional(element) ||   /^[a-z]+[a-zA-Z0-9]*$/.test(value);
	});
	
	$.validator.addMethod("passwordCkeck",  function( value, element ) {
		return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=\*]).*$/.test(value);
	});
	
	$.validator.addMethod("emailCkeck",  function( value, element ) {
		return this.optional(element) ||  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/.test(value);
	});
	
	$.validator.addMethod("telNoCheck",  function( value, element ) {
		return this.optional(element) ||  /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/.test(value);
	});
	
	//validation 조건이 상황에 따라 다르므로.
	if (userNo == '') {
		$('#userForm').validate({
			rules: {
				userId  : { required: true, 
							minlength: 5, 
							maxlength: 20, 
							userIdCkeck: true,
							remote: { type: "post"
									, url:"/user/checkDupUserId.do"
									, data: { userId: function() { 
												return $( "#userId" ).val();
											}} 
									}
				}
				, userName	: { required: true }
				, password  : { required: true,
								passwordCkeck : true, 
								minlength: 8, 
								maxlength: 20 }
				, passwordConfirm  : { required: true, equalTo: "#password" }
				, joinDt 		: { required: true }
				, userEmail		: { emailCkeck: true }
				, userTel		: { telNoCheck: true }
				, emergencyTel	: { telNoCheck: true }
			},
			messages: {
				userId	: { required: "직원ID를 입력하십시오.",
							minlength: "직원ID는 {0}자 이상입니다.",
							maxlength: "직원ID는 최대 {0}자리를 초과하지 못합니다.",
							userIdCkeck: "직원ID는 영문,숫자 조합으로 구성해야 합니다.",
							remote : "이미 사용중인 직원ID입니다. 다른 ID를 입력해주세요." 
				}
				, userName     	: { required: "직원 이름을 입력하세요." }
				, password		: { required: "비밀번호를 입력하세요.", 
									passwordCkeck : "비밀번호는 영문,숫자,특수문자 조합으로 구성해야합니다.", 
									minlength: "비밀번호는 {0}자리 이상이어야 합니다.", 
									maxlength: "비밀번호는 최대 {0}자리를 초과하지 못합니다." 
				}
				, passwordConfirm	: { required: "비밀번호 확인을 입력하세요.", equalTo: "비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인하세요." }
				, joinDt		: { required: "입사일을 입력하십시오." }
				, userEmail		: { emailCkeck: "이메일 주소가 유효하지 않습니다." }
				, userTel			: { telNoCheck: "핸드폰번호가 유효하지 않습니다." }
				, emergencyTel			: { telNoCheck: "비상연락망 번호가 유효하지 않습니다." }
			},
			submitHandler: function (form) {
				if (!confirm("저장하시겠습니까?")) {
	    			return false;
	    		}
	
				executeSave(form);
			}
		});
	
	} else {
		$('#userForm').validate({
			rules: {
				userName	: { required: true }
				, joinDt 		: { required: true }
				, userEmail		: { emailCkeck: true }
				, userTel		: { telNoCheck: true }
				, emergencyTel	: { telNoCheck: true }
			},
			messages: {
				userName     	: { required: "직원 이름을 입력하세요." }
				, joinDt		: { required: "입사일을 입력하세요." }
				, userEmail		: { emailCkeck: "이메일 주소가 유효하지 않습니다." }
				, userTel			: { telNoCheck: "핸드폰번호가 유효하지 않습니다." }
				, emergencyTel			: { telNoCheck: "비상연락망 번호가 유효하지 않습니다." }
			},
			submitHandler: function (form) {
				if (!confirm("저장하시겠습니까?")) {
	    			return false;
	    		}
	
				executeSave(form);
			}
		});
	}
	
	$('#userForm').submit();
	
}

function executeSave(form) {
	$('.btn-save').attr("disabled", true);
	
	$.ajax({
		type : "post",
		url  : "/user/saveUser.do",
		data : $(form).serialize(),
		dataType : "json",
		success:function(result){
			if (result.resultCode == 'fail') {
        		alert(result.resultMessage);
                return;
        	}

            notify("저장되었습니다.");
			location.href = contextPath + "/user/view.do?userNo=" + result.userNo;
		}
	});
}