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
                <h4 class="page-title">미디어 코멘트 상세</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
   	<div class="row">
   		<div class="col-6">
    		<h2>기본정보</h2>
    		<hr>
			<label for="comment_id"><b>코멘트ID</b></label>
			<p>${item.commentId}</p>
			
			<label for="media_id"><b>미디어ID</b></label>
			<p>${item.mediaId}</p>
			
			<label for="writer"><b>작성자</b></label>
			<p>${item.writer}</p>
			
			<label for="content"><b>코멘트 내용</b></label>
			<p>${item.content}</p>
			
			<label for="assess_rate"><b>별점</b></label>
			<p>${item.assessRate}</p>
			
			<label for="save_date"><b>작성일자</b></label>
			<fmt:parseDate var="dt" value="${item.saveDate}" pattern="yyyyMMddHHmmss"/>
    		<p><fmt:formatDate value="${dt}" pattern="yyyy.MM.dd HH.mm.ss"/></p>
    	</div>
   	</div>
</div>