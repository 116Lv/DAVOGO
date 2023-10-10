<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!-- 기본정보 -->
<div class="row mt-1">
	<div class="col-lg-12">
		<form id="worldForm" name="worldForm" action="/comm/saveInfo.do" method="POST" onsubmit="return false;">
			<input type="hidden" id="writer" name="writer" value="${loginUser.emailId}">
			<input type="hidden" name="comm_id" value="${item.commId}">
			<input type="hidden" id="delFileNos" name="delFileNos" value="">
			
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">월드컵 기본정보
						<span class="float-right">
							<button type="submit" id="worldBasicSaveBtn" name="submit">저장하기</button>
						</span>
					</h5>
					<hr>
					<p class="card-text">
						<div class="form-group row">
							<div class="col-sm-1 text-center">
								<label class="control-label">제목</label>
							</div>
							<div class="col-sm-11">
								<input class="form-control" type="text" name="title" id="title" value="${item.title}" placeholder="월드컵의 제목을 입력하세요." />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-1 text-center">
								<label class="control-label">설명</label>
							</div>
							<div class="col-sm-11">
								<input class="form-control" type="text" name="content" id="content" value="${item.content}" placeholder="설명, 하고싶은 말 등을 자유롭게 적으세요." />
							</div>
						</div>
					</p>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="row my-2">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">월드컵 이미지 업로드 <span class="font14">(※ 음란물 등록시 임의로 삭제되며, 관련 법률에 의하여 처벌받을 수 있습니다.)</span></h5>
				<hr>
				<p class="card-text">
					<form class="dropzone dz-clickable" id="worldFormImage" action="/comm/saveImage.do">
						<input type="hidden" name="comm_id" value="${item.commId}">
						<div class="dz-default dz-message">
							<span>
								<strong>
									Drop files here or click to upload.
									<br>
									여기 파일을 놓거나 클릭하여 업로드하세요.
								</strong>
							</span>
						</div>
					</form>
				</p>
			</div>
		</div>
	</div>
</div>

<script>
var commId = '${item.commId}';
$("#worldFormImage").dropzone({
	url: '/comm/saveImage.do',
	maxThumbnailFilesize: 10, 		//MB 업로드전 파일 썸네일 만드는 용량 제한
	maxFilesize: 10, 				// MB 개별 파일 용량 제한
	maxFiles: 8, 					//업로드 파일 갯수(파일 갯수 제한)
	addRemoveLinks: true,			//삭제버튼 표시 여부
	dictRemoveFile: "파일 삭제",		//파일삭제 명칭
	dictResponseError: 'Server not Configured',	//응답오류시 명칭
	dictInvalidFileType: "해당 파일유형은 업로드 할 수 없습니다.",
	accept: function(file, done) {
		//console.log("accept", file);
		return done();
	},
	init: function() {
		//ajax 내에서 this는 dropzone 객체를 지칭하는게 아니므로 별도로 변수로 만들어둠.
		var dz_this = this;
		
		//첨부된 파일을 조회하여 preview 영역에 표시
		$.ajax({
			type : "get",
			url  : '/comm/worldImageFiles.do',
			data : {'commId': commId},
			dataType : "json",
			async: false,
			success:function(result){
				if (!result && !result.fileList) return;
				
				//console.log("fileList len=", result.fileList.length);
				$.each(result.fileList, function(index, item) {
					
					var mockFile = {
	    				name: item.orgFname,      // 마우스 오버 네임
	   					size: 0,
	   					id  : item.worldId,
	   					uuid: item.worldId
					};
					
					// Call the default addedfile event handler
					dz_this.emit("addedfile", mockFile);
					
					// And optionally show the thumbnail of the file:
					if (item.storeTname != null){
						dz_this.emit("thumbnail", mockFile, fileUrl(item.storeLocate + "/" + item.storeTname));
					}
					dz_this.emit("complete", mockFile);
					
					//console.log("addedfile file=", mockFile);
				});
			}
		});
		
		dz_this.on("removedfile", function(file) {
			console.log("after removefile called,", file);
			var delFileNos = $("#worldForm").find("[name=delFileNos]").val();
			if (delFileNos != ""){
				$("#worldForm").find("[name=delFileNos]").val(delFileNos + "," + file.id);
			} else {
				$("#worldForm").find("[name=delFileNos]").val(file.id);
			}
		});
		
		dz_this.on("success", function(file, res) {
			console.log("success called,", res);
			if (res.resultCode == 'success') {
				//조회 페이지로 이동
				file['id'] = res.item.worldId;
			}
			
			if (res.resultCode == 'fail') {
				alert(res.resultMessage);
			}
		});

		dz_this.on("error", function(file) {
			console.log("error called", file);
			if (!file.accepted) {
				alert(file.upload.filename + "은 업로드 할 수 없습니다.");
				dz_this.removeFile(file);
			}
		});
	}
});

$("#worldForm").validate({
	rules : {
		title : {
			required : true
		}
	},
	messages : {
		title : {
			required : "제목을 입력해주세요."
		}
	},
	submitHandler: function (form) {
		
		//$("#worldFormImage")
		
		$.ajax({
			type : "post",
			url  : "/comm/saveInfo.do",
			data : $(form).serialize(),
			dataType : "json",
			success:function(result){
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}

				alert("저장되었습니다");
			}
		});
	}
});
</script>