$.ajaxSetup({
	beforeSend: function(xhr) {
		// context path 적용
		var url = this.url;
		if (contextPath.length > 1) {
			if (url.indexOf(contextPath) == -1) {
				if (url.substr(0, 1) == '/') {
					url = url.substr(1);
				}
				this.url = contextPath + url;
			}
		}
		
	},
	async: false
});

//모달에서 선택한 코드와 명칭이 입력될 필드
var callbackFn;
var codeInput, nameInput;
var managerInput, managerTelInput;
$(document).ready(function() {
	
	//datepicker 설정
	$.datepicker.setDefaults({
        dateFormat: 'yymmdd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
		todayHighlight: true
    });

	//validate method 선언
	$.validator.addMethod("telNoCheck",  function( value, element ) {
		return this.optional(element) || isPhone(value);
	});
	
	$.validator.addMethod("exactLength",  function( value, element, param ) {
		return this.optional(element) || value.length == param;
	});
	
	$.fn.clearForm = function () {
		return this.each(function () {
			var type = this.type,
		    	tag = this.tagName.toLowerCase();
			if (tag === "form") {
				return $(":input", this).clearForm();
		    }
			
		    if (type === "text" || type === "password" || type === "hidden" || tag === "textarea") {
				this.value = "";
		    } else if (type === "checkbox" || type === "radio") {
				this.checked = false;
		    } else if (tag === "select") {
				this.selectedIndex = 0;
		    }
		});
	};

});

/**
 * loading 표시 없이 static page(HTML)를 load하여 area 뒤에 붙인다.
 */
function loadPage(url, area) {
	$.ajax({
		url : url,
		global: false,	//loading 표시 안함.
		dataType: "html",
		success: function(templates){
			$(area).after(templates);
		}
	});
}

//pagination 숫자 array로 만들기
function getPageNumbersToArray(start, end) {
	if (end < start) {
		return Array(0);
	}
	var arr = Array(end - start + 1);
	$.map(arr, function(_, idx) {
		arr[idx] = start + idx;
	});
	return arr;
}

function fileUrl(name) {
	if (!name) return contextPath + "/images/data/search/list-noimg.jpg";
	return name.replace(replaceSrc, replaceTrg);
}

/**
 * 서버로부터 코드정보 조회, expiredTime 30분
 */
function getServerCodeList() {

	var expiredTime = localStorage.getItem("expiredTime");
	var codeList = localStorage.getItem("codeList");
	
	const now = new Date();
	if (codeList && expiredTime && expiredTime >= now.getTime()) {
		return JSON.parse(codeList);
	}

	$.ajax({
		url  : "/system/AllCommonCodeList.do",
		dataType : "json",
		success:function(result){
			console.log("화면 코드 캐시 조회=", result);
			localStorage.setItem("codeList", JSON.stringify(result));
			
			const now = new Date();
			now.setMinutes(now.getMinutes() + 30);
			//30분 뒤로 설정
			localStorage.setItem("expiredTime", now.getTime())
		}, error: function(xhr,status,error){
			localStorage.removeItem("codeList");
			console.log(error);
		}
	});
	
	return JSON.parse(localStorage.getItem("codeList"));
}

/**
 * @param codeType 코드유형
 * @param code 코드
 * @return 코드명
 */
function getCodeName(codeType, code) {
	//console.log("getCodeName=" + codeType + ":" + code);
	if (!codeType || !code) return "";
	
	var codeList = getServerCodeList();
	try {
		var codeName = ""; 
		$.each(codeList[codeType], function(key, code_obj) {
			if (code_obj.code == code) {
				codeName = code_obj.name;
				return false;	//break;
			} else {
				//코드가 같지 않은 경우 하위 코드도 search
				subList = getCodes(codeType, code_obj.code);
				if (subList == null)
					return true;	//continue;
				
				$.each(subList, function(idx, subCode) {
					if (subCode.code == code) {
						codeName = code_obj.name + " > " + subCode.name;
						return false; 	//break;
					}
				});
				
				//하위에서 코드를 찾은 경우 break;
				if (codeName != "") {
					return false;	//break;
				}
			}
		});
		return codeName;
	}catch(e){
		return "NO DATA";
	}
}

/**
 * 상위코드값 찾기
 * @param codeType 코드유형
 * @param code 코드값
 * @return 상위코드값(상위코드값이 없는 경우 empty string)
 */
function getParentCode(codeType, code) {
	//코드유형과 코드값에 따른 코드들이 있다면, 그 자체가 상위코드임.
	var list = getCodes(codeType, code);
	if (list && list.length > 0)
		return "";
	
	var parentCode = "";
	$.each(getCodes(codeType), function(idx, code_obj) {
		subList = getCodes(codeType, code_obj.code);
		if (subList == null)
			return true;	//continue;
		
		$.each(subList, function(idx, subCode) {
			if (subCode.code == code) {
				parentCode = code_obj.code;
				return false; 	//break;
			}
		});
		
		//하위에 일치하는 코드를 찾으면 해당코드를 리턴
		if (parentCode != "")
			return false;	//break;
	});
	
	return parentCode;	
}

/**
 * @param codeType 코드유형(필수)
 * @param code 코드값(옵션) - code값이 있는 경우 하위코드를 리턴
 * @return 코드명
 */
function getCodes(codeType, code) {
	//console.log("getCodes=" + codeType + (code ? ":" + code : ""));
	if (!codeType) return null;
	
	var codeList = getServerCodeList();
	try {
		if (code) {
			var subCodes = null;
			$.each(codeList[codeType], function(key, code_obj) {
				if (code_obj.code == code) {
					subCodes = code_obj.subCodes;
					return false;	//break;
				}
			});
			return subCodes;
		} else {
			console.log(codeList[codeType]);
			return codeList[codeType];
		}
	} catch(e){
		return null;
	}
}

// 만 나이 구하기
function getAge(birth) {
	const today = new Date();
	const birthDate = new Date(
			birth.substring(0,4), 
			birth.substring(4,6) - 1, 
			birth.substring(6,8)
	);
	
	let age = today.getFullYear() - birthDate.getFullYear();
	const m = today.getMonth() - birthDate.getMonth();
	if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
	    age--;
	}
	
	return age;
}

/**
 * 날짜 형식 변환
 */
function formatDate(strDate, delim = '-'){
	//console.log("formatDate=" + strDate);
	var rtnDate = "";
	
	if (strDate != null && strDate != "") {
		// 연·월·일 (20220620)
		rtnDate = strDate.substring(0,4) + delim + strDate.substring(4,6) + delim + strDate.substring(6,8);
	
		// 연·월·일·시·분·초 (20220620190930)
		if(strDate.length == 14){
			rtnDate += " " + strDate.substring(8,10) + ":" + strDate.substring(10,12);
		}
	}
	
	return rtnDate;
}

/**
 * 전화번호 형식 변환
 */
function formatTelNo(strTelNo) {
	
	var rtnTelNo = "";
	if (!strTelNo) {
		return rtnTelNo;
	}
	
    return strTelNo.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, '$1-$2-$3');
}

//콤마찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

/**
 * alert
 */
function notify(message) {
	$.NotificationApp.send("",message,"bottom-center","rgba(0,0,0,0.2)","info", 1000);
}

/**
 * 담당자 찾기
 */
function openUserSearch() {
	//var modal = $("div").attr("id", "user-modal");
	//$("body").append(modal);
}

/**
 * 모바일 기기인지
 */
function isMobile() {
	return /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
}

function isPhone(value) {
	return /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/.test(value)
			|| /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/.test(value)
			|| /^(15|16|18)[0-9]{2}-?[0-9]{4}$/.test(value);
}