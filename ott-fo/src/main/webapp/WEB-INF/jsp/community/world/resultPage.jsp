<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="replaceSrc"><spring:eval expression="@environment.getProperty('file.replaceSrc')"></spring:eval></c:set>
<c:set var="replaceTrg"><spring:eval expression="@environment.getProperty('file.replaceTrg')"></spring:eval></c:set>


<div class="row">
	<div class="col-lg-6 px-0 pt-0 text-center" style="height: 95vh; background-color:#181818;">
		<div class="center" style="background-image: url(${fn:replace(imageInfo.storeLocate, replaceSrc, replaceTrg)}/${imageInfo.storeTname})"></div>
		<div class="title" style="top: -100%;">
			${worldInfo.title} <span>우승</span>
		</div>
		<div class="resultLine">
			<div class="resultText">
				<span id="">${imageInfo.item}</span>
			</div>
		</div>
	</div>
	<div class="col-lg-6 pr-0 py-3">
		<p>
			<a href="/comm/world/play/playWorld.do?comm_id=${imageInfo.commId}" class="btn btn-outline-secondary text-dark"><i class="uil uil-refresh"></i> 다시하기</a>
			<a href="/comm.do?comm_div=2" class="btn btn-outline-secondary text-dark"><i class="uil uil-trophy"></i> 다른 월드컵보기</a>
		</p>
		<div class="row mx-0 mt-2">
<%-- 			<h5>사용자 의견 (${})</h5> --%>
			<div class="col pl-0">
				<div class="social-box">
					<div class="social-inner-box">
						<form id="commentForm" name="commentForm" method="POST" class="form-horizontal">
							<input type="hidden" name="comm_id" value="${imageInfo.commId}">
							<input type="hidden" name="world_id" value="${imageInfo.worldId}">
							<div class="mb-3">
								<label class="form-label">닉네임</label>
								<input type="text" class="form-control" name="writer" placeholder="${params.loginEmailId}">
							</div>
							<div class="mb-3">
								<label class="form-label">한마디 남기기</label>
								<textarea name="comment" class="form-control" rows="4" required></textarea>
							</div>
							<button type="submit" class="btn btn-secondary"><i class="uil uil-pen"></i>저장하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#commentForm").on('submit', function(event) {
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
				location.href = "/comm.do?comm_div=2";
			},
			error: function( xhr, status, error ) {
				alert(error);
			}
		});
	});
});
</script>