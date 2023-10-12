<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row" style="background-color: #181818;">
	<div id="compareArea" class="col-lg-12 mb-5 text-center" style="height: 95vh; background-color:#181818; clear:both;">
		<div class="left">
			<div class="line">
				<div style="width: 15%; float: right; font-size: 3vh;"></div>
				<div style="width: 85%; float: left; overflow: hidden;"></div>
			</div>
		</div>
		<div class="right">
			<div class="line">
				<div style="width: 15%; float: right; font-size: 3vh;"></div>
				<div style="width: 85%; float: left; overflow: hidden;"></div>
			</div>
		</div>
		<div class="title">
			${community.title} <span id="roundName">N강</span> <span id="matchName">1/4</span>
		</div>
		<div class="versus"></div>
		<div class="textLine">
			<div class="row">
				<div class="col-6 leftText">왼쪽 글자</div>
				<div class="col-6 rightText">오른쪽 글자</div>
			</div>
		</div>
	</div>
</div>
<form name="worldForm" id="worldForm" action="/comm/world/play/saveWorld.do" method="post" hidden>
	<input type="hidden" name="comm_id" value="${community.commId}">
	<input type="hidden" id="worldId" name="world_id">
</form>
<script type="text/javascript">
var round = 0;	//강
var match = 0;	//match
var allImageIds = new Array();

$(document).ready(function() {

	// 비교할 랜던 이미지 순번
	<c:forEach var="image" items="${imageIdList}" varStatus="status">
	allImageIds.push(${image});
	</c:forEach>
	
	round = allImageIds.length;
	
	chooseMatch();
	
	// 선택
	$(".left, .right").on("click", function(event) {
		
		if ($(this).hasClass("right")) {
			$(".left").animate({left: '-1000px'}, 2000);
		} else {
			$(".right").animate({right: '1000px'}, 2000);
		}
		
		var selectedId = $(event.target).attr("world_id");
		allImageIds.push(selectedId);
		if(round == 2) {
			saveResult(selectedId);
		} else {
			chooseMatch();
		}
		
	});
});

//주어진 배여렝서 2개씩 이미지 로드
function chooseMatch() {
	
	if(round/2 == match) {
		round = allImageIds.length;	//강
		match = 0;	//match
	}
	
	loadImage(allImageIds[0], ".left");
	loadImage(allImageIds[1], ".right");
	allImageIds.shift();
	allImageIds.shift();
	match += 1;
	
	if(round == 2) {
		$("#roundName").html("결승전");
		$("#matchName").html("");
	} else {
		$("#roundName").html(round + "강");
		$("#matchName").html(match + "/" + (round/2));
	}
}

function loadImage(worldId, cssName) {
	$.ajax({
		type : "post",
		url  : "/comm/world/play/worldInfo.do",
		data : {world_id: worldId},
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
			$(cssName).attr("world_id", worldInfo.worldId);
			var txtName = cssName + "Text";
			console.log("txtName=", txtName);
			console.log(worldInfo.item);
			$(txtName).html(worldInfo.item);
			
		},
		error: function( xhr, status, error ) {
			alert(error);
		}
	});
}

function saveResult(selectedId) {
	$('#worldId').val(selectedId);
	
	$('#worldForm').submit();
}
</script>