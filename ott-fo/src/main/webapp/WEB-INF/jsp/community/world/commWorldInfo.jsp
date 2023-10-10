<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!-- 기본정보탭 & 이미지이름수정/삭제탭 -->
<div class="row mt-2">
	<div class="col-lg-12">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" id="basic-tab" href="#basic" data-toggle="tab" data-target="#basic" data-url="/comm/worldBasicWrite.do">1. 기본정보 수정 / 이미지 업로드</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="image-tab" href="#image" data-toggle="tab" data-target="#image" data-url="/comm/worldImageWrite.do">2. 이미지 이름 수정 / 삭제</a>
			</li>
		</ul>
		
		<div class="tab-content">
			<%-- 1. 기본정보 수정 / 이미지 업로드 --%>
			<div class="tab-pane active" id="basic">
			
			</div>
			
			<%-- 2. 이미지 이름 수정 / 삭제 --%>
			<div class="tab-pane" id="image">
			
			</div>
		</div>
	</div>
</div>	
	
<script type="text/javascript">
$(document).ready(function() {
	
	//선택된 tab의 화면 load
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		loadPage($(e.target));
	});

	//기본탭 화면 load
	loadPage($("#basic-tab"));
	
});

//화면을 조회해서 target안에 넣어줌
function loadPage(targetObj) {
	var url = targetObj.data("url");
	console.log(url);
	$.ajax({
		type : "post",
		url  : url,
		data : { commId : '${params.comm_id}'},
		dataType : "html",
		success: function(result){
			var targetDiv = targetObj.data("target");
			$(targetDiv).html(result);
		}
	});
}
</script>