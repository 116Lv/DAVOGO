<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!-- 기본정보 -->
<div class="row mt-1">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">월드컵 기본정보</h5>
				<hr>
				<p class="card-text">
					<form id="worldForm" name="worldForm" action="/comm/saveInfo.do" method="POST">
						<input type="hidden" id="writer" name="writer" value="${loginUser.emailId}">
						<input type="hidden" name="comm_id" value="${item.commId}">
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
						<div class="form-group row">
							<div class="col-sm-1 text-center">
								<button type="submit" id="worldForm_submit">저장하기</button>
							</div> 
							<div class="col">
							</div>
						</div>
					</form>
				</p>
			</div>
		</div>
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
$("#worldFormImage").dropzone({
	
});
</script>