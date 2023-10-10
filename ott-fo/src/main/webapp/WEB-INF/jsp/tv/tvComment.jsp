<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<form id="commentForm" name="commentForm" action="/tv/saveComment.do" method="POST">
	<input type="hidden" id="writer" name="writer" value="${params.writer}">
	<input type="hidden" id="media_id" name="media_id" value="${params.mediaId}">
	
	<div class="card">
		<div class="row">
			<div class="col-6 text-left">
				<h5 class="mt-0"><i class="uil uil-user-circle"></i>${params.writer}</h5>
			</div>
			<div class="col-6 text-right">
				<%-- <span class="badge bg-secondary">
					<i class="uil uil-star">${params.assessRate}</i>
				</span> --%>
				<input class="rating" id="assess_rate2" name="assess_rate" value="${params.assessRate}" data-theme="krajee-svg" data-show-clear="false" data-show-caption="false" data-min="0" data-max="5" data-step="0.5" data-size="lg">
			</div>
		</div>
		<div class="row my-3">
			<div class="col">
				<div class="input-group">
					<textarea class="form-control" name="content" id="content" placeholder="코멘트로 남기고 싶은 내용을 입력하세요." required>${params.content}</textarea>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
	$("#assess_rate2").rating();
	
	//미디어 댓글 저장
	$("#saveBtn").on('click', function() {
		$.ajax({
			type : "post",
			url  : "/media/saveMediaComment.do",
			data : $("#commentForm").serialize(),
			dataType : "json",
			success: function(result) {
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}
				
	            alert("저장되었습니다.");
				location.reload();
			},
			error: function( xhr, status, error ) {
				alert(error);
			}
		});
	});	
</script>