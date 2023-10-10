<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="custom-container">
	<nav class="navbar navbar-expand-lg">
		<div class="collapse navbar-collapse" id="navbar_3">
			<div class="navbar-nav m-auto">
				<a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '드라마'}"> active</c:if>" genre="드라마">드라마</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '로맨스'}"> active</c:if>" genre="로맨스">로맨스</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '코미디'}"> active</c:if>" genre="코미디">코미디</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '애니메이션'}"> active</c:if>" genre="애니메이션">애니메이션</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '스릴러'}"> active</c:if>" genre="스릴러">스릴러</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '미스터리'}"> active</c:if>" genre="미스터리">미스터리</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '모험'}"> active</c:if>" genre="모험">모험</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '액션'}"> active</c:if>" genre="액션">액션</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '판타지'}"> active</c:if>" genre="판타지">판타지</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == 'SF'}"> active</c:if>" genre="SF">SF</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '공포'}"> active</c:if>" genre="공포">공포</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${params.genre == '다큐멘터리'}"> active</c:if>" genre="다큐멘터리">다큐멘터리</a>
			</div>
		</div>
	</nav>

	<div class="row mt-3">
		<div class="col-md-12">
			<h4>영화 목록</h4>
		</div>
	</div>

	<c:choose>
	<c:when test="${not empty list}">
		<div class="row">
			<c:forEach var="item" items="${list}" varStatus="status">
				<div class="col-md-15">
					<div class="card my-3">
						<a class="text-dark" href="<c:url value="/movie/contents.do?media_id=${item.mediaId}"/>">
							<img class="card-img-top" src="${item.imgSrc}" alt="${item.mediaName}" onerror="this.src='<c:url value="/images/no-img.jpg"/>';"/>
							<div class="card-body px-10 py-10">
								<h5 class="card-title font15 mt-0 text-truncate" title="${item.mediaName}">${item.mediaName}</h5>
								<fmt:parseDate var="dt" value="${item.openDate}" pattern="yyyyMMdd"/>
								<div class="font12 text-gray">개봉 <fmt:formatDate value="${dt}" pattern="yyyy.MM.dd"/> / ${item.runningTime}분</div>
								<div class="font12 text-gray">누적관객 
									<c:choose>
										<c:when test="${item.audiAcc > 10000}">
											<c:set var="num" value="${item.audiAcc/10000}" />
											<fmt:formatNumber type="number" value="${num}" maxFractionDigits="1" />만명
										</c:when>
										<c:otherwise>
											<fmt:formatNumber type="number" value="${item.audiAcc}"/>명
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row">
			<div class="col text-center" style="height: 350px; margin-top: 160px;">
				검색 결과가 없어요. <c:if test="${not empty params.genre}">다른 장르를 선택해보세요.</c:if>
			</div>
		</div>
	</c:otherwise>
	</c:choose>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$(".genre").on("click", function(){
		var target = $(this);
		var genre = target.attr("genre");
		
		if (target.hasClass("active")) {	//이미 선택된 상태이면 
			location.href="/movie.do";
		} else {
			location.href="/movie.do?genre=" + genre;
		}
		
	});
});
</script>