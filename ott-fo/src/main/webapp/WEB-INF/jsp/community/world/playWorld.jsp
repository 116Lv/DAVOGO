<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:if test="${not empty imageList}">
<c:forEach var="image" items="${imageList}" varStatus="status">


<!-- 모달창 -->
<%-- <div class="modal fade" id="playWorldModal" tabindex="-1" role="dialog" aria-labelledby="playWorldModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<i class="uil uil-trophy"></i>
				<h4 class="modal-title text-center" id="playWorldModalLabel">${image.title}</h4>
				<small>${image.content}</small>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
						<label>총 라운드를 선택하세요.</label>
						<select class="form-control" id="selRound" name="${image_cnt}" comm_id="${image.commId}">
							<!-- 옵션들 들어올 자리 (단, image_cnt의 값이 4,8,16,32,64를 기준으로 옵션이 늘어나거나 줄어들어야함) -->
						</select>
						<div class="">총 ${image_cnt}명의 후보 중 무작위 ${selRound}명이 대결합니다.</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="startWorld">시작하기</button>
				<a href="/comm.do">커뮤니티</a>
			</div>
		</div>
	</div>
</div> --%>
<div class="row">
	<div class="col-lg-12">
		<div class="col-6 left">
			
		</div>
		<div class="col-6 right">
		
		</div>
		<div clas="title">
			${image.title}   결승전
		</div>
		<div class="versus">
		
		</div>
	</div>
</div>

</c:forEach>
</c:if>