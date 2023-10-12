<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
   			<div class="card border-dark">
   				<div class="card-body">
		    		<h3 class="card-title mb-3">기본정보</h3>
   					<div class="card-text">
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
    	</div>
   	</div>
</div>