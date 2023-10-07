<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row" style="background-color: black;">
	<div class="col-lg-12 mb-5" style="height: 95vh;">
		<div class="left">
			
		</div>
		<div class="right">
		
		</div>
		<div class="title">
			${community.title} <span id="roundName">N강</span> <span id="matchName">1/4</span>
		</div>
		<div class="versus">
			
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {

	
	// 비교할 랜던 이미지 순번
	var allImageIds = new Array();
	<c:forEach var="image" items="${imageIdList}" varStatus="status">
	allImageIds.push(${image});
	</c:forEach>
	
	for (var i=0; i<=1; i++) {
		var worldId = allImageIds[i];
		loadImage(worldId, (i == 0? ".left": ".right"));
	}
});

function loadImage(worldId, cssName) {
	$.ajax({
		type : "post",
		url  : "/comm/world/play/worldInfo.do",
		data : {worldId: worldId},
		dataType : "json",
		success: function(result) {
			if (result.resultCode == 'fail') {
        		alert(result.resultMessage);
                return;
        	}
			
			var worldInfo = result.world;
			var imagePath = worldInfo.storeLocate.replace(replaceSrc, replaceTrg) + "/" + worldInfo.storeTname;
			console.log("imagePath=", imagePath);
			$(cssName).css("background-image", "url('" + imagePath + "')");
		},
		error: function( xhr, status, error ) {
			alert(error);
		}
	})
}
</script>