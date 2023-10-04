<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<form id="commentForm" name="commentForm" action="/comm/comment.do" method="POST">
	<input type="hidden" id="writer" name="writer" value="${loginUser.emailId}">
	<input type="hidden" id="comm_id" name="comm_id" value="${params.commId}">

	<div class="input-group mb-3">
		<input type="text" id="comment" name="comment" class="form-control" placeholder="댓글 추가...">
		<div class="input-group-append">
			<button class="btn btn-outline-secondary" type="button" id="saveComment">등록</button>
		</div>
	</div>
	<c:if test="${not empty list}">
	<hr>
		<c:forEach var="comment" items="${list}">
			<div class="media">
				<div class="mr-3"><i class="uil uil-user-circle" style="font-size: 2em;"></i></div>
				<div class="media-body">
					<h5 class="mt-0">${comment.writer}</h5>
					${comment.comment}
				</div>
				<c:if test="${comment.writer eq loginUser.emailId}">
					<div class="btn" id="deleteComment"><i class="uil uil-trash-alt"></i></div>
				</c:if>
			</div>
		</c:forEach>
	</c:if>
</form>

<script type="text/javascript">
$(document).ready(function() {
	$("#commentCnt").html("${fn:length(list)}");

	//댓글창에서 등록 클릭
	$("#saveComment").on('click', function() {
		$.ajax({
			type : "post",
			url  : "/comm/saveComment.do",
			data : $("#commentForm").serialize(),
			dataType : "json",
			success: function(result) {
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}
				
	            alert("작성되었습니다.");
				reloadComments(result.commId);
			},
			error: function( xhr, status, error ) {
				alert(error);
			}
		});
	});

	//댓글창에서 본인댓글 삭제시
	$("#deleteComment").on("click", function(event) {
		$.ajax({
			type : "post",
			url  : "/comm/deleteComment.do",
			data : $("#commentForm").serialize(),	//수정필요
			dataType : "json",
			success: function(result) {
				if (result.resultCode == 'fail') {
	        		alert(result.resultMessage);
	                return;
	        	}
				
	            alert("삭제되었습니다.");
				//어디로 보내야할지 정해야함
			},
			error: function( xhr, status, error ) {
				alert(error);
			}
		});
	});

});
</script>