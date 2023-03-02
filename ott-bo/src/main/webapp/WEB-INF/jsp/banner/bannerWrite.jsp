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

    <form id="bannerForm" action="/banner/save.do" method="post">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                	<a href="<c:url value="/banner.do"/>" class="btn btn-primary btn-sm">목록</a>
                	<button type="submit" class="btn btn-primary btn-sm">저장</button>
                </div>
                <h4 class="page-title">배너 등록/수정</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
    	<input type="hidden" id="deleteFileIds" name="deleteFileIds" value="" />
    	<div class="center">
    		<div class="left">
	    		<h2>기본정보</h2>
	    		<hr>
	    		<label for="title"><b>타이틀</b></label>
	    		<input type="hidden" name="banner_id" value="${item.bannerId}"/>
	    		<input type="text" placeholder="타이틀" name="title" id="title" value="${item.title}" required>
	    		
	    		<label for="media_id"><b>미디어ID</b></label>
	    		<input type="text" placeholder="미디어ID" name="media_id" id="media_id" value="${item.mediaId}" required>
	    		
	    		<label for="display_start"><b>노출시작날짜</b></label>
	    		<input name="display_start" id="display_start" type="text" placeholder="날짜 입력..." value="${item.displayStart}"/>
			   	<script>
			      	$("#display_start").datetimepicker();
			   	</script>
			   	
			   	<label for="display_end"><b>노출종료날짜</b></label>
	    		<input name="display_end" id="display_end" type="text" placeholder="날짜 입력..." value="${item.displayEnd}"/>
			   	<script>
			      	$("#display_end").datetimepicker();
			   	</script>
			   	
			   	<label for="hide"><b>숨김여부</b></label><br><br>
			   	<input type="checkbox" name="switch_hide" id="switch_hide" checked data-switch="none"/>
				<label for="switch_hide" data-on-label="On" data-off-label="Off"></label>
	    		
	    	</div>
	    	
	    	<div class="right">
	    		<h2>메인 베너 이미지 등록</h2>
	    		<hr>
	    		<h3>메인베너</h3><br>
	    		<div class="row">
	    			<div class="card">
	    				<input type="file" name="banner">
	    			</div>
	    		</div>
	    		<div class="row">
					<c:forEach var="banner" items="${bannerList}">
						<div class="col-sm-6 col-lg-3" id="img${banner.bannerId}">
							<div class="card">
	  							<img class="card-img-top" src="${fn:replace(banner.bannerPath, replaceSrc, replaceTrg)}/${banner.bannerThumb}" alt="${banner.bannerImage}"/>
	   							<div class="card-body">
		    						<h5 class="card-title">${banner.orgFname}</h5>
		    						<a href="#" onclick="deleteImage('${banner.bannerId}');" class="btn btn-primary mt-2 stretched-link">이미지 삭제</a>
		    					</div>
			    			</div>
	   					</div>
	   				</c:forEach>
   				</div>
	    	</div>
    	</div>
    </form>
    
</div>