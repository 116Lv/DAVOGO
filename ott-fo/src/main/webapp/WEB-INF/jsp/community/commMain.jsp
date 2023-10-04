<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<div class="commMain row justify-content-between">
	<nav class="navbar navbar-expand-lg">
		<div class="collapse navbar-collapse" id="navbar_4">
			<a class="nav-item nav-link btn btn-outline-secondary mx-1 <c:if test="${empty params || params.comm_div == ''}"> active</c:if>" type="comm_div" comm_div="">전체</a>
			<a class="nav-item nav-link btn btn-outline-secondary mx-1 <c:if test="${params.comm_div == '1'}"> active</c:if>" type="comm_div" comm_div="1">투표</a>
	        <a class="nav-item nav-link btn btn-outline-secondary mx-1 <c:if test="${params.comm_div == '2'}"> active</c:if>" type="comm_div" comm_div="2">월드컵</a>
		</div>
	</nav>
	
	<nav class="navbar navbar-expand-lg">
		<div class="collapse navbar-collapse" id="navbar_5">
			<div class="navbar-nav">
				<a class="nav-item nav-link btn btn-outline-info mx-1 <c:if test="${empty params.sort_name || params.sort_name == 'popular'}"> active</c:if>" type="sort_name" sort_name="popular">인기순</a>
		        <a class="nav-item nav-link btn btn-outline-info mx-1 <c:if test="${params.sort_name == 'recent'}"> active</c:if>" type="sort_name" sort_name="recent">최신순</a>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg">
		<form id="searchForm" name="searchForm" method="POST">
			<div class="form-group row mb-0">
				<div class="col-sm-10">
					<input type="hidden" id="comm_div" name="comm_div" value="${params.comm_div}">
					<input type="hidden" id="sort_name" name="sort_name" value="${params.sort_name}">
					<input class="form-control" type="search" id="searchText" name="searchText" value="${params.searchText}" placeholder="제목명 / 작성자명" size="50">
				</div>
				<div class="col-sm-2">
					<button class="btn btn-outline-success" type="submit">검색</button>
				</div>
			</div>
		</form>
	</nav>
	<nav class="navbar navbar-expand-lg">
		<div class="modalVote">
			<a class="btn btn-outline-primary mx-1" href="javascript:openVoteModal();" style="line-height: 1.0;">    <%-- data-toggle="modal" data-target="#voteWriteModal" --%>
				투표 게시글 <br> 작성
			</a>
			<a class="btn btn-outline-primary mx-1" href="<c:url value="/comm/worldInfo.do"/>" style="line-height: 1.0;">
				월드컵 게시글 <br> 작성
			</a>
		</div>
	</nav>
</div>

<c:if test="${not empty list}">
	<div class="row">
		<c:forEach var="comm" items="${list}" varStatus="status">
			<div class="col-md-3 px-2">
				<c:choose>
					<c:when test="${comm.commDiv eq 1}">	<!-- 투표 -->
						<div class="card my-3" commId="${item.commId}">
							<div class="card-body">
								<p class="card-text">${comm.writer}</p>
								<h5 class="card-title">${comm.title}</h5>
								<c:forEach var="item" items="${comm.items}">
									<div class="input-group my-1">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<input type="checkbox" name="vote_id" value="${item.voteId}" commId="${item.commId}">
											</div>
										</div>
										<div class="form-control" id="item${item.voteId}">
											<div class="progress position-relative" style="background-color: white;">
												<div class="progress-bar"></div>
												<div class="justify-content d-flex position-absolute w-100">
												${item.item}
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="row mt-2">
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
					</c:when>
					<c:when test="${comm.commDiv eq 2}">	<!-- 월드컵 -->
						<div class="card">
							<div>
								<input type="hidden" value="${item.writer}">
								<div>
									<div style="background-image:url('${item.image1}')"></div>
									<div style="background-image:url('${item.image2}')"></div>
									<div>${item.imageName1}</div>
									<div>${item.imageName2}</div>
								</div>
							</div>
							<div>
								<p>${item.title}</p>
								<div class="">
									<p>${item.notice}</p>
								</div>
							</div>
							<div>
								<div>
									<button class="like">
										<i></i>
									</button>
									<button class="disLike">
										<i></i>
									</button>
								</div>
								<div class="comment">
									<button>
										<i></i>
									</button>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</c:forEach>
	</div>
</c:if>

<!-- 투표게시글 작성 모달창 -->
<div class="modal fade" id="voteWriteModal" tabindex="-1" role="dialog" aria-labelledby="voteWriteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="voteWriteModalLabel">투표 게시글 작성</h5>
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

<!-- 댓글 작성 모달창 -->
<div class="modal fade" id="commentWriteModal" tabindex="-1" role="dialog" aria-labelledby="commentWriteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="commentWriteModalLabel">게시물 댓글</h5><span id="commentCnt">0</span>
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
<script src="<c:url value="/js/davogo/comm.js"/>"></script>
<script>
/* commMain에서 투표게시글 작성 클릭시 작동 */
function openVoteModal() {
	<c:choose>
		<c:when test="${empty loginUser}">
			alert("로그인이 필요한 서비스입니다.");
		</c:when>
		<c:otherwise>
			$('#voteWriteModal').modal('show');
		</c:otherwise>
	</c:choose>
}
</script>