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

<div class="container">
	<c:if test="${not empty movieList}">
		<div class="row">
			<div class="col-md-12">
				<p>박스오피스 순위</p>
				<!-- Swiper1 -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
		   				<c:forEach var="list" items="${movieList}">
							<div class="swiper-slide">
								<a href="${list.mediaHref}">
									<img src="${list.storeLocate}/${list.storeTname}" alt="${list.mediaName}">
									<p>${list.mediaName}</p>
									<p>${list.period} - ${list.country}</p>
									<p>${list.audiAcc}</p>
								</a>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
	</c:if>

   	<c:if test="${not empty categoryList}">
	   	<c:forEach var="category" items="${categoryList}" varStatus="status">
			<div class="row">
				<div class="col-md-12">
					<p>${category.categoryTitle}</p>
					<!-- Swiper1 -->
					<div class="swiper mySwiper${status.index}">
						<div class="swiper-wrapper">
			   				<c:forEach var="image" items="${category.imageList}">
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
			      var swiper = new Swiper(".mySwiper", {
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
