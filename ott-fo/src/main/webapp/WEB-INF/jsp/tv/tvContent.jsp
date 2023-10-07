<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="" style="height: 100px; background-color: #888888;">
	</div>
</div>
<div class="row mb-4">
	<div class="col-2">
		<img class="rounded float-left img-thumbnail " src="${image.imgSrc}">
	</div>
	<div class="col-10">
		<h5 class="font-weight-bold">${content.mediaName}</h5>
		<p class="font14">${content.period} - ${content.channel} - ${content.genre}</p>
		<hr/>
		<!-- 평점 -->
		<hr/>
		<div class="row">
			<div class="col-4">
				<label class="text-center">평가하기</label>
				<input class="rating" id="input-5 assess_rate" name="assess_rate" value="${item.assessRate}" data-theme="krajee-svg" data-show-clear="false" data-show-caption="false" data-min="0" data-max="5" data-step="0.5" data-size="lg">
			</div>
			<div class="col-8">
				<div class="row">
					<div class="col">
						<i class="uil uil-plus">보고싶어요</i>
					</div>
					<div class="col">
						<i class="uil uil-pen">코멘트</i>
					</div>
					<div class="col">
						<i class="uil uil-eye">보는중</i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<hr class="my-5" />
<div class="row mb-2">
	<div class="col-9">
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
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<p><!-- 배우, 감독, 작가 정보 하나씩 풀어야함 --></p>
						<p></p>
					</li>
				</ul>
			</div>
			<hr/>
			<div class="card-body">
				<h5 class="card-title">코멘트</h5>
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<div class="col-sm-3">
								<i class="uil uil-user-circle"></i>${comment.writer}
							</div>
							<div class="col-sm-9 float-right"><!-- 우측정렬 필요 -->
								<!-- 별점 -->
							</div>
						</div>
						<hr>
						<div class="card-text">
							<p>${comment.comment}</p>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<div class="btn like">
									<i class="uil uil-thumbs-up mx-1"></i>${comm.likeCnt}
								</div>
							</div>
							<div class="col-sm-6">
								<div class="btn disLike">
									<i class="uil uil-thumbs-down"></i><%-- ${comm.dislikeCnt } --%>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="btn comment" data-toggle="modal" data-target="#commentWriteModal">
									<i class="uil uil-comment-dots mx-1"></i>
									${commentCnt}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-3">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">감상 가능한곳</h5>
				<%-- <c:if test="${not empty content.watchable}">
					<c:choose>
						<c:when test="${fn:replace(content.watchable, '^')}" alt="">
							<div class="row">
								<img src="">
								<p></p>
								<i class="uil uil-angle-right-b"></i>
							</div>
						</c:when>
					</c:choose>
				</c:if> --%>
			</div>
		</div>
	</div>
</div>