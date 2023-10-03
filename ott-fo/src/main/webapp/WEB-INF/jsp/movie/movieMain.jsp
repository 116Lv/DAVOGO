<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<div class="custom-container">
	<nav class="navbar navbar-expand-lg">
		<div class="collapse navbar-collapse" id="navbar_3">
			<div class="navbar-nav m-auto">
				<a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">드라마</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">로맨스</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">코미디</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">애니메이션</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">스릴러</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">미스터리</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">모험</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">액션</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">판타지</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">SF</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">공포</a>
		        <a class="nav-item nav-link btn btn-outline-secondary mx-2" href="">다큐멘터리</a>
			</div>
		</div>
	</nav>

	<c:if test="${not empty list}">
	   	<c:forEach var="image" items="${list}" varStatus="status">
			<div class="row">
				<div class="col-md-12">
					<p>${image.categoryTitle}</p>
					<!-- Swiper_TV -->
					<div class="swiper mySwiper${status.index}">
						<div class="swiper-wrapper">
								<div class="swiper-slide">
									<a href="${image.mediaHref}">
										<img src="${image.imgSrc}" alt="${image.mediaName}">
										<p>${image.mediaName}</p>
										<p>${image.period} - ${image.country}</p>
										<p>${image.avg_score}</p>
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