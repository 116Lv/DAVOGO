<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

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

	<c:if test="${not empty categoryList}">
	   	<c:forEach var="category" items="${categoryList}" varStatus="status">
			<div class="row mt-3">
				<div class="col-md-12">
					<h4 class="mb-1">${category.categoryTitle}</h4>
					<!-- Swiper_TV -->
					<div class="swiper mySwiper${status.index} mb-5">
						<div class="swiper-wrapper">
			   				<c:forEach var="image" items="${category.imageList}">
								<div class="swiper-slide">
									<a class="text-dark" href="<c:url value="/tv/contents.do?media_id=${image.mediaId}"/>">
										<img src="${image.imgSrc}" alt="${image.mediaName}">
										<p class="font-weight-bold">${image.mediaName}</p>
										<p>${image.period} - ${image.country}</p>
										<p>${image.avgScore}</p>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
		
				<!-- Initialize Swiper -->
				<script>
			      var swiper = new Swiper(".mySwiper${status.index}", {
			          slidesPerView: 5,
			          spaceBetween: 30,
			          slidesPerGroup: 5,
			          loopFillGroupWithBlank: true,
			          navigation: {
			            nextEl: ".swiper-button-next",
			            prevEl: ".swiper-button-prev",
			          },
			        });
		    	</script>
			</div>
		</c:forEach>
	</c:if>
</div>

<script src="<c:url value="/js/davogo/tv.js"/>"></script>

