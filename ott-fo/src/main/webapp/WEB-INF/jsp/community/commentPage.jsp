<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<form id="commentForm" action="/comm/comment.do" method="POST">
		<input type="hidden" id="writer" name="writer" value="${loginUser.emailId}">
		<input type="hidden" id="comm_id" name="comm_id" value="${item.comm_id}">
		<div class="row">
			<div class="col-sm-10">
				<input type="text" placeholder="댓글 추가..." id="comment" name="comment" size="50" required>
			</div>
			<div class="col-sm-2">
				<button class="" type="button" id="addComment">등록</button>
			</div>
		</div>
		<hr>
		<c:if test="${not empty list}">
			<div class="row">
				<c:forEach var="comment" items="${list}" varStatus="status">
					<p>${comment.writer}</p>
					<p>${comment.comment}</p>
					<c:choose>
						<c:when test="${comment.writer eq loginUser.emailId}">
							<button type="button" id="deleteComment"><i class="uil uil-trash-alt"></i></button>
						</c:when>
					</c:choose>
					<hr>
				</c:forEach>
			</div>
		</c:if>
</form>

<script>
	$("#commentCnt").html("${item.commentCnt}");
</script>