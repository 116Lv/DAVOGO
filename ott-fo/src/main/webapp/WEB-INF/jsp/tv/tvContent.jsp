<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:if test="${not empty content && not empty image}">
	<div class="row">
		<div class="col-lg-12">
			<div class="col-lg-2">
				<img src="${image.imgSrc}">
			</div>
			<div class="col-lg-10">
				<div class="row">
					<h5 class="font-weight-bold">${content.mediaName}</h5>
					<p>${content.period} - ${content.channel} - ${content.genre}</p>
				</div>
				<div class="row">
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
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
			<div class="card-body">
				<h5 class="card-title">출연/제작</h5>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<p><!-- 배우, 감독, 작가 정보 하나씩 풀어야함 --></p>
						<p></p>
					</li>
				</ul>
			</div>
			<div class="card-body">
				<h5 class="card-title">코멘트</h5>
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<div class="col-sm-3">
								<i class="uil uil-user-circle"></i>${comment.writer}
							</div>
							<div class="col-sm-9 "><!-- 우측정렬 필요 -->
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
</c:if>