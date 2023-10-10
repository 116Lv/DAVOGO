<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="replaceSrc"><spring:eval expression="@environment.getProperty('file.replaceSrc')"></spring:eval></c:set>
<c:set var="replaceTrg"><spring:eval expression="@environment.getProperty('file.replaceTrg')"></spring:eval></c:set>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<div class="custom-container">

	<!-- 커뮤니티 좋아요순 상위 4개 -->
	<c:if test="${not empty list}">
		<div class="row">
			<c:forEach var="comm" items="${list}" varStatus="status">
				<div class="col-md-3 px-2">
					<c:choose>
						<c:when test="${comm.commDiv eq 1}">	<!-- 투표 -->
							<div class="card my-3" comm_id="${comm.commId}">
								<div class="card-body px-10 py-10">
									<p class="card-text font15">${comm.writer}</p>
									<h5 class="card-title">${comm.title}</h5>
									
									<%-- 투표 아이템들 --%>
									<c:forEach var="item" items="${comm.items}">
										<div class="input-group my-1">
										<c:choose>
											<c:when test="${comm.userSelected == 'true'}"><%-- 투표한 경우 --%>
												<div class="input-group-prepend">
													<div class="input-group-text">
														<input type="checkbox" name="vote_id" value="${item.voteId}" <c:if test="${item.userVoted == 'true'}"> checked="checked"</c:if>>
													</div>
												</div>
												<div class="form-control" id="item${item.voteId}" style="padding: 0; height: 29.78px;">
													<div class="progress position-relative" style="background-color: white; height: 100%;">
														<div class="progress-bar" style="width: ${(item.totalCnt * 100) / item.sumClickedCnt}%"></div>
														<div class="justify-content-between d-flex position-absolute w-100" style="padding: .375rem .75rem;">
															<span title="${fn:replace(item.item, "\"", "'")}">${item.item}</span>
															<span><fmt:formatNumber type="number" value="${(item.totalCnt * 100) / item.sumClickedCnt}" pattern="0"/>%</span>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="input-group-prepend">
													<div class="input-group-text">
														<input type="checkbox" name="vote_id" value="${item.voteId}">
													</div>
												</div>
												<div class="form-control" id="item${item.voteId}">
													<div class="progress position-relative" style="background-color: white;">
														<div class="progress-bar"></div>
														<div class="justify-content-between d-flex position-absolute w-100">
															<span>${item.item}</span>
															<span></span>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
										</div>
									</c:forEach>
									<div class="row mt-2 mx-0">
										<div class="col-sm-3 px-0">
											<c:choose>
												<c:when test="${comm.userLiked == 'true'}"><%--사용자가 좋아요를 한 경우 --%>
													<c:set var="btnClass" value="btn-primary"/>
												</c:when>
												<c:otherwise>
													<c:set var="btnClass" value="btn-light"/>
												</c:otherwise>
											</c:choose>
											<div class="btn ${btnClass} like">
												<i class="uil uil-thumbs-up"></i>
											</div>
											<span>${comm.likeCnt}</span>
										</div>
										<div class="col-sm-3">
											<c:choose>
												<c:when test="${comm.userDisliked == 'true'}">
													<c:set var="btnClass" value="btn-primary"/>
												</c:when>
												<c:otherwise>
													<c:set var="btnClass" value="btn-light"/>
												</c:otherwise>
											</c:choose>
											<div class="btn ${btnClass} disLike">
												<i class="uil uil-thumbs-down"></i>
											</div>
										</div>
										<div class="col-sm-3">
										</div>
										<div class="col-sm-3">
											<div class="btn btn-light comment" data-toggle="modal" data-target="#commentWriteModal">
												<i class="uil uil-comment-dots mx-1"></i>
												${comm.commentCnt}
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						
						
						<c:when test="${comm.commDiv eq 2}">	<!-- 월드컵 -->
							<div class="card my-3" comm_id="${comm.commId}">
								<a class="text-dark" href="/comm/world/play/playWorld.do?comm_id=${comm.commId}">
									<div class="row">
									<c:forEach var="item" items="${comm.items}" varStatus="status">
										<div class="col-sm-6 <c:choose><c:when test="${status.index == 0}">pr-0</c:when><c:otherwise>pl-0</c:otherwise></c:choose>">
											<img class="card-img-top" src="${fn:replace(item.storeLocate, replaceSrc, replaceTrg)}/${item.storeTname}" alt="${item.orgFname}"/>
											<p class="font12">${item.item}</p>
										</div>
									</c:forEach>
									</div>
								<div class="card-body px-10 py-10">
									<input type="hidden" value="${comm.writer}">
									<h5 class="card-title">${comm.title}</h5>
									<p class="card-text">${comm.content}</p>
								</a>
									<div class="row mt-2 mx-0">
										<div class="col-sm-3 px-0">
											<c:choose>
												<c:when test="${comm.userLiked == 'true'}"><%--사용자가 좋아요를 한 경우 --%>
													<c:set var="btnClass" value="btn-primary"/>
												</c:when>
												<c:otherwise>
													<c:set var="btnClass" value="btn-light"/>
												</c:otherwise>
											</c:choose>
											<div class="btn ${btnClass} like">
												<i class="uil uil-thumbs-up"></i>
											</div>
											<span>${comm.likeCnt}</span>
										</div>
										<div class="col-sm-3">
											<c:choose>
												<c:when test="${comm.userDisliked == 'true'}">
													<c:set var="btnClass" value="btn-primary"/>
												</c:when>
												<c:otherwise>
													<c:set var="btnClass" value="btn-light"/>
												</c:otherwise>
											</c:choose>
											<div class="btn ${btnClass} disLike">
												<i class="uil uil-thumbs-down"></i>
											</div>
										</div>
										<div class="col-sm-3">
										</div>
										<div class="col-sm-3">
											<div class="btn btn-light comment" data-toggle="modal" data-target="#commentWriteModal">
												<i class="uil uil-comment-dots mx-1"></i>
												${comm.commentCnt}
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>
		</div>
	</c:if>

	<!-- 박스오피스 순위 -->
	<c:if test="${not empty movieList}">
		<div class="row mt-3">
			<div class="col-md-12">
				<h5 class="mb-2"><b>박스오피스 순위</b></h5>
				<!-- Swiper1 -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
		   				<c:forEach var="movie" items="${movieList}" varStatus="status">
							<div class="swiper-slide">
								<a class="text-dark" href="<c:url value="/movie/contents.do?media_id=${movie.mediaId}"/>">
									<div class="image-container">
										<img src="${movie.imgSrc}" alt="${movie.mediaName}" onerror="this.src='<c:url value="/images/no-img.jpg"/>';">
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
												<fmt:formatNumber type="number" value="${movie.audiAcc}"/>명
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

	<!-- tv카테고리별 순위 -->
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

<!-- 댓글 작성 모달창 -->
<div class="modal fade" id="commentWriteModal" tabindex="-1" role="dialog" aria-labelledby="commentWriteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="commentWriteModalLabel">게시물 댓글</h5> (<span id="commentCnt">0</span>)
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		
      </div>
    </div>
  </div>
</div>

<!-- js파일 임포트 -->
<script src="<c:url value="/js/davogo/comm.js"/>"></script>