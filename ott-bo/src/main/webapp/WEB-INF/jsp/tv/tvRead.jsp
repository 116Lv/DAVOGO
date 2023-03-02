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
	
	/* .image{
		width: 190px;
		height:240px;
		image-rendering: high-quality;
	} */
	
</style>
	
<!-- Start Content-->
<div class="container-fluid">
    
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">tv 상세</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
   	<div class="center">
   		<div class="left">
    		<h2>기본정보</h2>
    		<hr>
			<label for="tv_name"><b>프로그램명</b></label>
			<p>${item.mediaName}</p>
			
			<label for="director"><b>감독명</b></label>
			<p>${item.director}</p>
			
			<label for="actor"><b>출연진</b></label>
			<p>${item.actor}</p>
			
			<label for="author"><b>작가</b></label>
			<p>${item.author}</p>
			
			<label for="channel"><b>채널</b></label>
			<p>${item.channel}</p>
			
			<label for="producer"><b>제작사</b></label>
			<p>${item.producer}</p>
			
			<label for="episode"><b>방송횟수</b></label>
			<p>${item.episode}부작</p>
			
			<label for="rating_grade"><b>시청등급</b></label>
			<p>${item.ratingGrade}</p>
			
			<label for="introduce"><b>소개글</b></label>
			<p>${item.introduce}</p>
			
			<label for="period"><b>방송시작</b></label>
			<p>${item.period}</p>
			
    	</div>
    	
    	<div class="right">
    		<h2>프로그램 관련 이미지 등록</h2>
    		<hr>
    		<h3>프로그램 포스터</h3><br>
    		<div class="row">
				<c:forEach var="poster" items="${posterList}">
					<div class="col-sm-6 col-lg-3">
						<div class="card">
  							<img class="card-img-top" src="${fn:replace(poster.storeLocate, replaceSrc, replaceTrg)}/${poster.storeTname}" alt="${poster.orgFname}"/>
   							<div class="card-body">
	    						<h5 class="card-title">${poster.orgFname}</h5>
	    					</div>
		    			</div>
   					</div>
   				</c:forEach>
   			</div>
    		<hr>
    		<h3>프로그램 관련 이미지 및 영상</h3><br>
    		<div class="row">
  				<c:forEach var="ads" items="${adsList}">
   					<div class="col-sm-6 col-lg-3">
   						<div class="card">
			    			<img class="card-img-top" src="${fn:replace(ads.storeLocate, replaceSrc, replaceTrg)}/${ads.storeTname}" alt="${ads.orgFname}"/>
		    				<div class="card-body">
		    					<h5 class="card-title">${ads.orgFname}</h5>
		    				</div>
		    			</div>
    				</div>
    			</c:forEach>
    		</div>
    	</div>
   	</div>
    
</div>