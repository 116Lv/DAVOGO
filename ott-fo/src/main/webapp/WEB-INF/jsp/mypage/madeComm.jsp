<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="col">
		<div class="card mt-5">
			<div class="card-body">
				<div class="card-title font-weight-bold">
					내가 작성한 커뮤니티 게시글 확인
				</div>
				<div class="card-text">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">순서</th>
								<th scope="col">커뮤니티 분류</th>
								<th scope="col">제목</th>
								<th scope="col">좋아요수</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list}">
								<c:forEach var="item" items="${list}" varStatus="status">
									<tr>
										<td scope="row">${status.index+1}</td>
										<td>
											<c:choose>
												<c:when test="${item.commDiv eq 1}">
													투표
												</c:when>
												<c:otherwise>
													월드컵
												</c:otherwise>
											</c:choose>
										</td>
										<td>${item.title}</td>
										<td>${item.likeCnt}</td>
										<td>
											<a class="text-dark" href="/mypage/deleteComm.do?comm_id=${item.commId}&comm_div=${item.commDiv}">
												<i class="uil uil-trash">삭제</i>
											</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>