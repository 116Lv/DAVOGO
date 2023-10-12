<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fnc" uri="/WEB-INF/tlds/fnc.tld"%>

<c:set var="replaceSrc"><spring:eval expression="@environment.getProperty('file.replaceSrc')"></spring:eval></c:set>
<c:set var="replaceTrg"><spring:eval expression="@environment.getProperty('file.replaceTrg')"></spring:eval></c:set>
	
<style>
  	input[type=text] {
	  width: 100%;
	  padding: 15px;
	  margin: 5px 0 22px 0;
	  display: inline-block;
	  border: none;
	}
</style>


<!-- Start Content-->
<div class="container-fluid">
    
    <!-- start page title -->
    <div class="row">
        <div class="col-6">
            <div class="page-title-box text-left">
                <h4 class="page-title">영화 상세</h4>
            </div>
        </div>
        <div class="col-6">
        	<div class="text-right">
        		<a class="btn btn-scondary" href="/comm.do">목록</a>
        	</div>
        </div>
    </div>     
    <!-- end page title -->
    
    <c:choose>
    	<c:when test="${commDiv eq 1}">	<!-- 투표 -->
	    	<div class="row">
	   			<div class="col-6">
		    		<h2>기본정보</h2>
		    		<hr>
					<label for="comm_id"><b>커뮤니티 ID</b></label>
					<p>${item.commId}</p>
					
					<label for="comm_div"><b>커뮤니티 분류</b></label>
					<p>${item.commDiv}</p>
					
					<label for="title"><b>제목</b></label>
					<p>${item.title}</p>
					
					<label for="writer"><b>작성자</b></label>
					<p>${item.writer}</p>
					
					<label for="like_cnt"><b>좋아요 수</b></label>
					<p>${item.likeCnt}</p>
					
					<label for="dislike_cnt"><b>싫어요 수</b></label>
					<p>${item.dislikeCnt}분</p>
					
					<label for="save_date"><b>작성일자</b></label>
					<fmt:parseDate var="dt" value="${item.saveDate}" pattern="yyyyMMddHHmmss"/>
		    		<p><fmt:formatDate value="${dt}" pattern="yyyy.MM.dd HH.mm.ss"/></p>
		    		
					<label for="hide"><b>숨기기</b></label>
					<p>${item.hide}</p>
				</div>
				
				<div class="col-6">
		    		<h3>투표 컬럼내용</h3><br>
		    		<div class="row">
						<c:forEach var="comm" items="${commList}">
							<div class="col-sm-6 col-lg-3">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col">순서</th>
											<th scope="col">컬럼명</th>
											<th scope="col">선택 수</th>
										<tr>
									</thead>
									<tbody>
										<tr>
											<td>${comm.num}</td>
											<td>${comm.item}</td>
											<td>${comm.totalCnt}</td>
										</tr>
									</tbody>
				    			</table>
		   					</div>
		   				</c:forEach>
		   			</div>
		    	</div>
	    	</div>
    	</c:when>
    	<c:otherwise>
    		<div class="row">
    			<div class="col-6">
		    		<h2>기본정보</h2>
		    		<hr>
					<label for="comm_id"><b>커뮤니티 ID</b></label>
					<p>${item.commId}</p>
					
					<label for="comm_div"><b>커뮤니티 분류</b></label>
					<p>${item.commDiv}</p>
					
					<label for="title"><b>제목</b></label>
					<p>${item.title}</p>
					
					<label for="writer"><b>작성자</b></label>
					<p>${item.writer}</p>
					
					<label for="content"><b>내용</b></label>
					<p>${item.content}</p>
					
					<label for="like_cnt"><b>좋아요 수</b></label>
					<p>${item.likeCnt}</p>
					
					<label for="dislike_cnt"><b>싫어요 수</b></label>
					<p>${item.dislikeCnt}분</p>
					
					<label for="save_date"><b>작성일자</b></label>
					<fmt:parseDate var="dt" value="${item.saveDate}" pattern="yyyyMMddHHmmss"/>
		    		<p><fmt:formatDate value="${dt}" pattern="yyyy.MM.dd HH.mm.ss"/></p>
		    		
					<label for="hide"><b>숨기기</b></label>
					<p>${item.hide}</p>
				</div>
		    	
		    	<div class="col-6">
		    		<h3>월드컵 컬럼내용</h3><br>
		    		<div class="row">
						<c:forEach var="comm" items="${commList}">
							<div class="col-sm-6 col-lg-3">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col">순서</th>
											<th scope="col">컬럼명</th>
											<th scope="col">이미지</th>
											<th scope="col">선택 수</th>
										<tr>
									</thead>
									<tbody>
										<tr>
											<td>${comm.num}</td>
											<td>${comm.item}</td>
											<td><img src="${fn:replace(comm.storeLocate, replaceSrc, replaceTag)}/${comm.storeFname}" alt="comm.orgFname"/></td>
											<td>${comm.totalCnt}</td>
										</tr>
									</tbody>
				    			</table>
		   					</div>
		   				</c:forEach>
		   			</div>
		    	</div>
		   	</div>
    	</c:otherwise>
    </c:choose>
</div>