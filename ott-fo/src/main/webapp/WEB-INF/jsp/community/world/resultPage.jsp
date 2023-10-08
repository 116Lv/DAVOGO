<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>



<div class="row">
	<p>
		<button type="button" id="restart" class="btn btn-lg"><i class="ri-refresh-line"></i>다시하기</button>
		<button type="button" id="home" class="btn btn-lg"><i class="uil uil-trophy"></i>다른 월드컵보기</button>
	</p>
	<div class="col-lg-6 px-0 py-0" style="background-color: black; height: 95vh;">
		<div class="center">
			
		</div>
		<div class="title">
			${imageInfo.title} <span>우승</span>
		</div>
		<div class="resultLine">
			<div class="resultText">
				<span id="">${imageInfo.item}</span>
			</div>
		</div>
	</div>
	<div class="col-lg-6 px-0 py-0">
		<div class="row">
			<h5>사용자 의견 (${})</h5>
			<div class="social-box">
				<div class="social-inner-box">
					<form id="commentForm" action="/comm/world/play/comment.do" method="POST" class="form-horizontal">
						<input type="hidden" name="comm_id" value="${imageInfo.commId}">
						<input type="hidden" name="world_id" value="${imageInfo.worldId}">
						<div class="mb-3">
							<label class="form-label">닉네임</label>
							<input type="text" class="form-control" placeholder="${loginEmailId}">
						</div>
						<div class="mb-3">
							<label class="form-label">한마디 남기기</label>
							<textarea class="form-control" rows="4"></textarea>
						</div>
						<button type="submit" class="btn btn-secondary"><i class="uil uil-pen"></i>저장하기</button>
					</form>
					<c:if test="">
						<c:forEach var="" items="${}">
							<div class="social-comment">
								
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>