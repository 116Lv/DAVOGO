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
					내가 작성한 미디어 코멘트 확인
				</div>
				<div class="card-text">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">순서</th>
								<th scope="col">미디어제목</th>
								<th scope="col">평점</th>
								<th scope="col">내용</th>
								<th scope="col">작성일자</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list}">
								<c:forEach var="item" items="${list}" varStatus="status">
									<tr>
										<td scope="row">${status.index+1}</td>
										<td>${item.mediaName}</td>
										<td>${item.assessRate}</td>
										<td>${item.content}</td>
										<td>
											<c:choose>
												<c:when test="${empty item.updateDate}">
													<fmt:parseDate var="saveDate" value="${item.saveDate}" pattern="yyyyMMddHHmmss"/>
													<fmt:formatDate value="${saveDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
												</c:when>
												<c:otherwise>
													<fmt:parseDate var="updateDate" value="${item.updateDate}" pattern="yyyyMMddHHmmss"/>
													<fmt:formatDate value="${updateDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<div class="row mx-0">
												<div data-toggle="modal" data-target="#mediaUpdateModal" comment_id="${item.commentId}" style="cursor: pointer; width: 30%">
													<i class="uil uil-edit">수정</i>
												</div>
												<a class="text-dark" href="/mypage/deleteMediaComment.do?comment_id=${item.commentId}">
													<i class="uil uil-trash">삭제</i>
												</a>
											</div>
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

<!-- 미디어 평가 모달창 -->
<div class="modal fade" id="mediaUpdateModal" tabindex="-1" role="dialog" aria-labelledby="mediaUpdateModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mediaUpdateModalLabel">코멘트작성</h5>
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
