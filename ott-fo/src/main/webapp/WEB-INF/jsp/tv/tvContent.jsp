<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<style>
.round-logo{
	border-radius: 0.5em;
}
</style>

<div class="row">
	<div class="col" style="height: 50px;">
	</div>
</div>

<div class="row mb-4">
	<div class="col-3">
		<img class="rounded float-left img-thumbnail " src="${image.imgSrc}">
	</div>
	<div class="col-9 pt-2">
		<c:if test="${not empty image.categoryTitle}">
		<p class="font14">${image.categoryTitle} ${image.mediaRank}위</p>
		</c:if>
		<h5 class="font-weight-bold">${content.mediaName}</h5>
		<p class="font14">${content.period} - ${content.channel} - ${content.genre}</p>
		<hr/>
		<div class="row text-center">
			<div class="col-4">
				<div>평균 별점</div>
				<h4 class="py-4" style="height: 60px;">4.0</h4>
			</div>
			<div class="col-4">
				<div>평가하기</div>
				<input class="rating" id="assess_rate" name="assess_rate" value="${item.assessRate}" data-theme="krajee-svg" data-show-clear="false" data-show-caption="false" data-min="0" data-max="5" data-step="0.5" data-size="lg">
			</div>
			<div class="col-4">
				<!-- <div class="col">
					<i class="uil uil-plus">보고싶어요</i>
				</div> -->
				<div>코멘트</div>
				<div data-toggle="modal" data-target="#mediaWriteModal" media_id="${content.mediaId}" class="py-4" style="height: 60px; font-size: 20px;">
					<i class="uil uil-pen"></i>
				</div>
				<!-- <div class="col">
					<i class="uil uil-eye">보는중</i>
				</div> -->
			</div>
		</div>
		<hr class="mt-0" />
		<div class="row">
			<div class="col">
				<div class="row">
				<div>감상 가능한곳 <i class="uil uil-angle-right-b"></i></div>
				<!-- 조건 충족 필요 -->
				<c:set var="watchable" value="${fn:split(content.watchable, '^')}"/>
				<c:forEach var="watch" items="${watchable}" varStatus="status">
					<div class="col-sm-1 m-0 p-2">
						<c:choose>
							<c:when test="${watch == '넷플릭스'}">
								<img src="<c:url value="/images/channel/netflix.png"/>" alt="${watch}" class="round-logo" style="border: 1px solid black;">
							</c:when>
							<c:when test="${watch == '티빙'}">
								<img src="<c:url value="/images/channel/tving.png"/>" alt="${watch}" class="round-logo">
							</c:when>
							<c:when test="${watch == '왓챠'}">
								<img src="<c:url value="/images/channel/watcha.png"/>" alt="${watch}" class="round-logo">
							</c:when>
							<c:when test="${watch == '디즈니+'}">
								<img src="<c:url value="/images/channel/disney.png"/>" alt="${watch}" class="round-logo">
							</c:when>
							<c:when test="${watch == '웨이브'}">
								<img src="<c:url value="/images/channel/wavve.png"/>" alt="${watch}" class="round-logo">
							</c:when>
							<c:when test="${watch == '애플 TV+'}">
								<img src="<c:url value="/images/channel/appletv.png"/>" alt="${watch}" class="round-logo">
							</c:when>
							<c:otherwise>
								<img src="<c:url value="/images/channel/no-channel.png"/>" class="round-logo" style="border: 1px solid black;">
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<hr class="my-5" />
<div class="row mb-2">
	<div class="col">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">기본 정보</h5>
				<div class="card-text">
					<p>${content.mediaName}</p>
					<p>${content.period} - ${content.channel} - ${content.genre}</p>
					<p>${content.country} - ${content.ratingGrade}</p>
					<p>${content.introduce}</p>
				</div>
			</div>
			<hr/>
			<div class="card-body">
				<h5 class="card-title">출연/제작</h5>
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<c:set var="actor" value="${fn:split(content.actor, '^')}"/>
						<c:forEach var="person" items="${actor}" varStatus="status">
							<c:if test="${status.index % 12 == 0}">
							<div class="swiper-slide">
								<div class="row">
							</c:if>
								<c:if test="${status.index % 3 == 0}">
								<div class="col-3 pr-1">
								</c:if>
							
								<ul class="list-group">
									<li class="list-group-item text-left">
										<!-- 얼굴사진 -->
										<p>${person}</p>
										<p class="font12 text-gray">출연</p>
									</li>
								</ul>
								
								<c:if test="${status.index % 3 == 2 || status.last}">
								</div>
								</c:if>
							<c:if test="${status.index%12 == 11 || status.last}">
								</div>
							</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
<!-- 					<div class="swiper-pagination"></div> -->
				</div>
			</div>
			<hr/>
			<div class="card-body">
				<c:forEach var="comment" items="${commentList}">
				<h5 class="card-title">코멘트 ${comment.total}</h5>
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<div class="row">
								<div class="col-3 text-left">
									<i class="uil uil-user-circle"></i>${comment.writer}
								</div>
								<div class="col-9 text-right">
									<i class="uil uil-star">${comment.assessRate}</i>
								</div>
							</div>
						</div>
						<hr>
						<div class="card-text">
							<p>${comment.content}</p>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script>
		var swiper = new Swiper(".mySwiper", {
		    slidesPerView: 1,
		    spaceBetween: 30,
		    slidesPerGroup: 1,
		    loopFillGroupWithBlank: true,
		    navigation: {
		      nextEl: ".swiper-button-next",
		      prevEl: ".swiper-button-prev",
			},
		});
	</script>
</div>

<!-- 미디어 평가 모달창 -->
<div class="modal fade" id="mediaWriteModal" tabindex="-1" role="dialog" aria-labelledby="mediaWriteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mediaWriteModalLabel">${content.mediaName} 코멘트작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveBtn">Save</button>
      </div>
    </div>
  </div>
</div>

<!-- js파일 임포트 -->
<script src="<c:url value="/js/davogo/tv.js"/>"></script>
