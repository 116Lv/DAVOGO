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
	<c:if test="${not empty movieList}">
		<div class="row mt-3">
			<div class="col-md-12">
				<h5 class="mb-2"><b>박스오피스 순위</b></h5>
				<!-- Swiper1 -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
		   				<c:forEach var="movie" items="${movieList}" varStatus="status">
							<div class="swiper-slide">
								<a class="text-dark" href="${movie.mediaHref}">
									<div class="image-container">
										<img src="${movie.imgSrc}" alt="${movie.mediaName}">
										<div class="number">${status.count}</div>
									</div>
									<div class="font-weight-bold font16 text-truncate" title="${movie.mediaName}">${movie.mediaName}</div>
									<fmt:parseDate var="dt" value="${movie.openDate}" pattern="yyyyMMdd"/>
									<div class="font12 text-gray">개봉 <fmt:formatDate value="${dt}" pattern="yyyy.MM.dd"/> / ${movie.runningTime}분</div>
									<div class="font12 text-gray">누적관객 
										<c:choose>
											<c:when test="${movie.audiAcc > 10000}">
												<c:set var="num" value="${movie.audiAcc/10000}" />
												<fmt:formatNumber type="number" value="${num}" maxFractionDigits="1" />만명
											</c:when>
											<c:otherwise>
												<fmt:formatNumber type="number" value="${movie.audiAcc}"/>
											</c:otherwise>
										</c:choose>
									</div>
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
			<div class="row mt-4">
				<div class="col-md-12">
					<h5 class="mb-2"><b>${category.categoryTitle}</b></h5>
					<!-- Swiper1 -->
					<div class="swiper mySwiper${status.index} mb-4">
						<div class="swiper-wrapper">
			   				<c:forEach var="image" items="${category.imageList}">
								<div class="swiper-slide">
									<a class="text-dark" href="/tv/contents.do?media_id=${image.mediaId}">
										<div class="image-container">
											<img src="${image.imgSrc}" alt="${image.mediaName}">
											<div class="number">${image.mediaRank}</div>
										</div>
										<div class="font-weight-bold font16 text-truncate" title="${image.mediaName}">${image.mediaName}</div>
										<div class="font12 text-gray">${image.period} ・ ${image.country}</div>
										<div class="font12 text-gray">${image.avgScore}</div>
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
