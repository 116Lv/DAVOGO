<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<form id="commentForm" name="commentForm" action="/mypage/updateMediaComment.do" method="POST">
	<input type="hidden" id="media_id" name="media_id" value="${info.mediaId}">
	<input type="hidden" id="comment_id" name="comment_id" value="${info.commentId}">
	
	<div class="card">
		<div class="row mx-0">
			<div class="col-6 text-left">
				<h5 class="mt-0"><i class="uil uil-user-circle" style="font-size: 1.5em;">${info.writer}</i></h5>
			</div>
			<div class="col-6"></div>
		</div>
		<div class="row mx-0 my-3">
			<div class="col">
				<div>평가</div>
				<input class="rating" id="assess_rate" name="assess_rate" value="${info.assessRate}" data-theme="krajee-svg" data-show-clear="false" data-show-caption="false" data-min="0" data-max="5" data-step="0.5" data-size="lg">
				<div>코멘트 내용</div>
				<textarea class="form-control" name="content" id="content" required>${info.content}</textarea>
			</div>
		</div>
	</div>
</form>

<script>
$("#assess_rate").removeClass('rating-loading').addClass('rating-loading').rating();
</script>