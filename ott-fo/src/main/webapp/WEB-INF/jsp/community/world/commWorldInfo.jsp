<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<div class="wrapper">
	<!-- 기본정보탭 & 이미지이름수정/삭제탭 -->
	<div class="row mt-2">
		<div class="col-lg-12">
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-secondary active" onclick="<c:url value="/comm/worldInfo.do"/>">1. 기본정보 수정 / 이미지 업로드</button>
		  		<button type="button" class="btn btn-secondary" onclick="<c:url value="/comm/worldImage.do"/>">2. 이미지 이름 수정 / 삭제</button>
					<%-- <a class="nav-item nav-link btn btn-outline-secondary mx-1 active" href="<c:url value="/comm/worldInfo.do"/>">1. 기본정보 수정 / 이미지 업로드</a>
					<a class="nav-item nav-link btn btn-outline-secondary mx-1"href="<c:url value="/comm/worldImage.do"/>">2. 이미지 이름 수정 / 삭제</a> --%>
			</div>
		</div>
	</div>	
		
	<!-- 기본정보 -->
	<div class="row mt-1">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">이상형 월드컵 기본정보</h5>
					<hr>
					<p class="card-text">
						<form id="worldForm" action="/comm/worldSave.do" method="POST">
							<input type="hidden" id="writer" name="writer" value="${loginUser.emailId}">
							<div class="form-group row">
								<label class="col-sm-1 control-label">제목</label>
								<div class="col-sm-11">
									<input class="form-control" type="text" name="worldTitle" id="worldTitle" value="${item.worldTitle}" placeholder="이상형 월드컵의 제목을 입력하세요." />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-1 control-label">설명</label>
								<div class="col-sm-11">
									<input class="form-control" type="text" name="worldNotice" id="worldNotice" value="${item.worldNotice}" placeholder="설명, 하고싶은 말 등을 자유롭게 적으세요." />
								</div>
							</div>
							<div class="form-group">
								<button type="button" id="worldForm_submit">저장하기</button> 
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
					<h5 class="card-title">이상형 월드컵 이미지 업로드 (※ 음란물 등록시 임의로 삭제되며, 관련 법률에 의하여 처벌받을 수 있습니다.)</h5>
					<hr>
					<p class="card-text">
						<form id="worldFormImage" action="/comm/worldSave.do" method="POST" enctype="multipart/form-data">
							<input type="file" name="worldImage" multiple>
							<span>
								<strong>
									Drop files here or click to upload.
									<br>
									여기 파일을 놓거나 클릭하여 업로드하세요.
								</strong>
							</span>
						</form>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
