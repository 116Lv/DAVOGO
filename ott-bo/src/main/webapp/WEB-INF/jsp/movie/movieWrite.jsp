<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="replaceSrc"><spring:eval expression="@environment.getProperty('file.replaceSrc')"></spring:eval></c:set>
<c:set var="replaceTrg"><spring:eval expression="@environment.getProperty('file.replaceTrg')"></spring:eval></c:set>

<style>

	div.center {
  		width: 100%;
	  	display:flex;
	}
   
   	div.left {
   		width: 50%;
		padding: 30px;
		float: left;
		box-sizing: border-box;
		border: 1px solid;
	}
	   
	div.right {
	  width: 50%;
	  padding: 30px;
	  float: right;
	  box-sizing: border-box;
	  /* border: 1px solid; */
	}
	   
	input[type=text] {
		width: 100%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
	}
		
	textarea {
		width: 100%;
		height:150px;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
	}
		
	select{
		width:100%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
	}

</style>
    
<!-- 플러그인에서 제공해주는 css 로딩 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />
<!-- jquery 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.js"></script>
<!-- 플러그인 javascript 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

<script>
var errMsg = "${message}";
if (errMsg) {
	alert(errMsg);
}

function deleteImage(fileId) {
	$("#img" + fileId).hide();
	var splitDeleteFileIds = $("#deleteFileIds").val();
	if (splitDeleteFileIds == "") {
		splitDeleteFileIds += fileId;
	} else {
		splitDeleteFileIds += "," + fileId;
	}
	$("#deleteFileIds[type=hidden]").val(splitDeleteFileIds);
}
</script>
	
<!-- Start Content-->
<div class="container-fluid">

    <form id="movieForm" action="/movie/save.do" method="post" enctype="multipart/form-data">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                	<a href="<c:url value="/movie.do"/>" class="btn btn-primary btn-sm">목록</a>
                	<button type="submit" class="btn btn-primary btn-sm">저장</button>
                </div>
                <h4 class="page-title">영화 등록/수정</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
    	<input type="hidden" id="deleteFileIds" name="deleteFileIds" value="" />
    	<div class="center">
    		<div class="left">
	    		<h2>기본정보</h2>
	    		<hr>
	    		<label for="movie_name"><b>영화명</b></label>
	    		<input type="hidden" name="media_id" value="${item.mediaId}"/>
	    		<input type="text" placeholder="영화명" name="movie_name" id="movie_name" value="${item.mediaName}" required>
	    		
	    		<label for="director"><b>감독명</b></label>
	    		<input type="text" placeholder="감독명" name="director" id="director" value="${item.director}" required>
	    		
	    		<label for="actor"><b>출연진</b></label>
	    		<input type="text" placeholder="배우명" name="actor" id="actor" value="${item.actor}" required>
	    		
	    		<label for="author"><b>작가</b></label>
	    		<input type="text" placeholder="작가명" name="author" id="author" value="${item.author}" required>
	    		
	    		<label for="distributor"><b>배급사</b></label>
	    		<input type="text" placeholder="배급사" name="distributor" id="distributor" value="${item.distributor}" required>
	    		
	    		<label for="producer"><b>제작사</b></label>
	    		<input type="text" placeholder="제작사" name="producer" id="producer" value="${item.producer}" required>
	    		
	    		<label for="running_time"><b>상영시간</b></label>
	    		<input type="text" placeholder="상영시간" name="running_time" id="running_time" value="${item.runningTime}" required>
	    		
	    		<label for="rating_grade"><b>상영등급</b></label>
	    		<select name="rating_grade" id="rating_grade" value="${item.ratingGrade}" required>
	    			<option value="전체관람가" <c:if test="${item.ratingGrade == '전체관람가'}"> selected</c:if>>전체관람가
	    			<option value="12세 이상 관람가" <c:if test="${item.ratingGrade == '12세 이상 관람가'}"> selected</c:if>>12세 이상 관람가
	    			<option value="15세 이상 관람가" <c:if test="${item.ratingGrade == '15세 이상 관람가'}"> selected</c:if>>15세 이상 관람가
	    			<option value="청소년 관람불가" <c:if test="${item.ratingGrade == '청소년 관람불가'}"> selected</c:if>>청소년 관람불가
	    			<option value="제한상영가" <c:if test="${item.ratingGrade == '제한상영가'}"> selected</c:if>>제한상영가
	    		</select>
	    		
	    		<label for="introduce"><b>소개글</b></label>
	    		<textarea type="text" placeholder="간단한 영화정보 입력" name="introduce" id="introduce" required>${item.introduce}</textarea>
	    		
	    		<label for="open_date"><b>개봉일</b></label>
	    		<input name="open_date" id="open_date" type="text" placeholder="날짜 입력..." value="${item.openDate}"/>
			   	<script>
			      	$("#open_date").datetimepicker();
			   	</script>
	    	</div>
	    	
	    	<div class="right">
	    		<h2>영화 관련 이미지 등록</h2>
	    		<hr>
	    		<h3>영화 포스터</h3><br>
	    		<div class="row">
	    			<div class="card">
	    				<input type="file" name="poster" multiple>
	    			</div>
	    		</div>
	    		<div class="row">
					<c:forEach var="poster" items="${posterList}">
						<div class="col-sm-6 col-lg-3" id="img${poster.fileId}">
							<div class="card">
	  							<img class="card-img-top" src="${fn:replace(poster.storeLocate, replaceSrc, replaceTrg)}/${poster.storeTname}" alt="${poster.orgFname}"/>
	   							<div class="card-body">
		    						<h5 class="card-title">${poster.orgFname}</h5>
		    						<a href="#" onclick="deleteImage('${poster.fileId}');" class="btn btn-primary mt-2 stretched-link">이미지 삭제</a>
		    					</div>
			    			</div>
	   					</div>
	   				</c:forEach>
   				</div>
	    		<hr>
	    		<h3>영화 관련 이미지 및 영상</h3><br>
	    		<div class="row">
	    			<div class="card">
	    				<input type="file" name="ads" multiple>
	    			</div>
	    		</div>
	    		<div class="row">
	  				<c:forEach var="ads" items="${adsList}">
	   					<div class="col-sm-6 col-lg-3" id="img${ads.fileId}">
	   						<div class="card">
				    			<img class="card-img-top" src="${fn:replace(ads.storeLocate, replaceSrc, replaceTrg)}/${ads.storeTname}" alt="${ads.orgFname}"/>
			    				<div class="card-body">
			    					<h5 class="card-title">${ads.orgFname}</h5>
			    					<a href="#" onclick="deleteImage('${ads.fileId}');" class="btn btn-primary mt-2 stretched-link">이미지 삭제</a>
			    				</div>
			    			</div>
	    				</div>
	    			</c:forEach>
	    		</div>
	    	</div>
    	</div>
    </form>
    
</div>