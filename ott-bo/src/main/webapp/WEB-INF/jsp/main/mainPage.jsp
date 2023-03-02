<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">홈</h4>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xl-5">
			<div class="row">
				<div class="col-sm-4">
					<div class="card widget-flat">
						<div class="card-body">
							<h5 class="text muted fw-normal mt-0" title="Number Of Users">Users</h5>
							<!-- Unum은 고객수 -->
							<h3 class="mt-3 mb-3">${Unum}777</h3>
						</div>
					</div>
				</div>
<!-- 				<div class="col-sm-4"> -->
<!-- 					<div class="card widget-flat"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h5 class="text muted fw-normal mt-0" title="Number Of Staffs">Staffs</h5> -->
<!-- 							Snum은 직원수, 추가로 일단 직원으로 설정했지만 추후 변경가능 -->
<%-- 							<h3 class="mt-3 mb-3">${Snum}</h3> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="col-sm-4">
					<div class="card widget-flat">
						<div class="card-body">
							<h5 class="text muted fw-normal mt-0" title="Number Of Movies">Movies</h5>
							<!-- Mnum은 현재 관리되고 있는 영화수 -->
							<h3 class="mt-3 mb-3">${Mnum}777</h3>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card widget-flat">
						<div class="card-body">
							<h5 class="text muted fw-normal mt-0" title="Number Of TV Programs">TV Programs</h5>
							<!-- Tnum은 현재 관리되고 있는 tv프로그램수 -->
							<h3 class="mt-3 mb-3">${Tnum}777</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			</div>
		</div>
		<div class="col-xl-7">
			<div class="card">
				<div class="card-header">
					<h4 class="header-title">사내게시판</h4>
				</div>
				<div class="card-body">
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xl-6">
			<div class="card">
				<div class="card-header">
					<!-- 최근 5~10개정도의 리뷰 노출 -->
					<h4 class="header-title">Recent Customer's Review</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-centered table-no-wrap table-hover mb-0">
							<thead>
								<tr class="text-center">
									<th scope="col">리뷰ID</th>
									<th scope="col">작성자</th>
									<th scope="col">미디어명</th>
									<th scope="col">작성일자</th>
									<th scope="col">평점</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="item" items="${list}" varStatus="status">
									<tr>
										<td>${item.reviewId}</td>
										<td>${item.userId}</td>
										<td>${item.mediaId}</td>
										<td>${item.writingDate}</td>
										<td>${item.rate}</td>
									</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center">데이터가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="card">
				<div class="card-header">
					<h4 class="header-title">최근 미디어 업데이트 현황</h4>
				</div>
				<div class="card-body">
					<!-- 영화,tv프로그램별 업데이트된 날짜 표시 -->
				</div>
			</div>
		</div>
	</div>
</div>
                