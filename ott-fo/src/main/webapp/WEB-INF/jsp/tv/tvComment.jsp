<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<form id="commentForm" name="commentForm" action="/tv/saveComment.do" method="POST">
	<input type="hidden" id="writer" name="writer" value="${loginUser.emailId}">
	<input type="hidden" id="media_id" name="media_id" value="${params.mediaId}">
	<input type="hidden" id="assess_rate" name="assess_rate" value="${params.assessRate}">
	
	<div class="card">
		<div class="row">
			<div class="col-6 text-left">
				<h5 class="mt-0">${loginUser.emailId}</h5>
			</div>
			<div class="col-6 text-right">
				<span class="badge bg-secondary">
					<i class="uil uil-star">${params.assessRate}</i>
				</span>
			</div>
		</div>
		<div class="row my-3">
			<div class="col">
				<div class="input-group">
					<textarea class="form-control" placeholder="코멘트로 남기고 싶은 내용을 입력하세요." name="content" id="content" required></textarea>
				</div>
			</div>
		</div>
	</div>
</form>