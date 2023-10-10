<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function pullMovieData() {
	$.ajax({
		type : "post",
		url  : "/main/pullMovieData.do",
		dataType : "json",
		success:function(result){
			
			if(result.resultCode == "fail") {
				alert("예외가 발생하였습니다. 잠시후 다시 시도해주시기 바랍니다");
				return;
			}
			
			alert("최신 영화 정보를 갱신하였습니다.");
		}
	});
}

function pullTvData() {
	$.ajax({
		type : "post",
		url  : "/main/pullTvData.do",
		dataType : "json",
		success:function(result){
			
			//여기에 결과 처리하는 부분 넣기.
			alert(result.resultMsg);
			
		}
	});
}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<h4 class="page-title">홈</h4>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xl-6">
			<div class="row">
				<div class="col-sm-4">
					<div class="card widget-flat">
						<div class="card-body">
							<h5 class="text muted fw-normal mt-0" title="Number Of Users">Users</h5>
							<!-- Unum은 고객수 -->
							<h2 class="mt-3 mb-3">${Unum}</h2>
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
							<div class="float-end">
								<a href="javascript:pullMovieData();"><i class="ri-refresh-line widget-icon"></i></a>
							</div>
							<!-- Mnum은 현재 관리되고 있는 영화수 -->
							<h2 class="mt-3 mb-3">${Mnum}</h2>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card widget-flat">
						<div class="card-body">
							<h5 class="text muted fw-normal mt-0" title="Number Of TV Programs">TV Programs</h5>
							<div class="float-end">
								<a href="javascript:pullTvData();"><i class="ri-refresh-line widget-icon"></i></a>
							</div>
							<!-- Tnum은 현재 관리되고 있는 tv프로그램수 -->
							<h2 class="mt-3 mb-3">${Tnum}</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
		</div>
	</div>
	
	<div class="row">
		<div class="col-xl-6">
			<div class="card">
				<div class="card-header">
					<h4 class="header-title">사내게시판</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-centered table-no-wrap table-hover mb-0">
							<thead>
								<tr class="text-center">
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자명</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="item" items="${list}" varStatus="status">
									<tr class="text-center">
										<td>${item.num}</td>
										<td>
											<a href="/board/view.do?board_id=${item.boardId}">${item.title}</a>
										</td>
										<td>${item.writer}</td>
										<td>${item.saveDate}</td>
									</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="text-center">데이터가 없습니다.</td>
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
					<div class="table-responsive">
						<table class="table table-centered table-no-wrap table-hover mb-0">
							<thead>
								<tr class="text-center">
									<th scope="col">미디어명</th>
									<th scope="col">미디어구분</th>
									<th scope="col">장르</th>
									<th scope="col">공개일자</th>
									<th scope="col">등록일자</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty lists}">
									<c:forEach var="item" items="${lists}" varStatus="status">
									<tr class="text-center">
										<td>${item.mediaName}</td>
										<td>
											<c:choose>
												<c:when test="${item.mediaDiv eq 1}">
													영화
												</c:when>
												<c:otherwise>
													TV
												</c:otherwise>
											</c:choose>
										</td>
										<td>${item.genre}</td>
										<td>${item.openDate}</td>
										<td>${item.saveDate}</td>
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
	</div>
	
	<div class="row">
		<div class="col-xl-12">
			<div class="card">
				<div class="card-header">
					<!-- 최근 5~10개정도의 리뷰 노출 -->
					<h4 class="header-title">고객들의 최근 리뷰</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-centered table-no-wrap table-hover mb-0">
							<thead>
								<tr class="text-center">
									<th scope="col">코멘트ID</th>
									<th scope="col">컨텐츠구분</th>
									<th scope="col">미디어명</th>
									<th scope="col">작성자</th>
									<th scope="col">코멘트</th>
									<th scope="col">평점</th>
									<th scope="col">작성일자</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty commentList}">
									<c:forEach var="comment" items="${commentList}" varStatus="status">
									<tr>
										<td>${comment.commentId}</td>
										<td>
											<c:choose>
												<c:when test="${comment.type eq 'media'}">
													미디어
												</c:when>
												<c:otherwise>
													커뮤니티
												</c:otherwise>
											</c:choose>
										</td>
										<td>${comment.name}</td>
										<td>${comment.writer}</td>
										<td>${comment.comment}</td>
										<td>
											<c:choose>
												<c:when test="${comment.type eq 'media'}">
													${comment.assessRate}
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
										</td>
										<td>${comment.saveDate}</td>
									</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" class="text-center">데이터가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
                