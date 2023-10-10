<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fnc" uri="/WEB-INF/tlds/fnc.tld"%>

<!-- Start Content-->
<div class="container-fluid">
    
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="<c:url value="/"/>">Home</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value="/comm.do"/>">커뮤니티관리</a></li>
                        <li class="breadcrumb-item active">커뮤니티 게시글 목록</li>
                    </ol>
                </div>
                <h4 class="page-title">커뮤니티 게시글관리</h4>
            </div>
        </div>
    </div>     
    <!-- end page title --> 

    <!-- 검색조건 -->
    <div class="row">
	    <div class="col-12">
		    <div class="card">
			    <div class="card-body">

				    <form id="communitySearchForm" name="communitySearchForm" class="mb-3" action="/comm.do" method="POST">
						<input type="hidden" name="pageIndex" value="${searchParams.pageIndex}"/>
	    
					    <div class="row mb-2">
					        <%-- <div class="col-sm-4 col-lg-6">
					            <a href="<c:url value="/comm/edit.do"/>" class="btn btn-info btn-sm btn-rounded mb-2">
					            	<i class="mdi mdi-plus"></i> 커뮤니티 등록
					            </a>
					        </div> --%>
					        <div class="col-sm-8 col-lg-12">
					            <div class="text-end">
					            	<div class="btn-group btn-group-sm">
					            		
					            	</div>
									<button class="btn btn-sm btn-outline-secondary ms-1" type="button"
									    data-bs-toggle="collapse" href="#searchCollapse"
									    aria-expanded="false" aria-controls="searchCollapse" >
									    <i class="mdi mdi-cog-outline" title="검색 toggle"></i>
									</button>
					            </div>
					        </div>
					    </div>
						    
						<div class="collapse show" id="searchCollapse">
							<div class="form-group row">
								<div class="col">
									<h6 class="font-15 ">검색어</h6>
									<input type="text" id="searchText" name="searchText" class="form-control" value="${searchParams.searchText}" placeholder="제목명 / 작성자명">
								</div>
							</div>
						</div>

						<div class="row mt-2">
							<div class="col-sm-6 mb-2">
					            <select id="orderColumn" name="orderColumn" class="form-select-sm me-1" onchange="searchList(1);">
					        		<option value="comm_id" <c:if test="${searchParams.orderColumn == 'comm_id'}">selected</c:if>>커뮤니티ID</option>
					        		<option value="like_cnt" <c:if test="${searchParams.orderColumn == 'like_cnt'}">selected</c:if>>좋아요 수</option>
					        	</select>
					            <select id="orderType" name="orderType" class="form-select-sm me-1" onchange="searchList(1);">
					        		<option value="DESC" <c:if test="${searchParams.orderType == 'DESC'}">selected</c:if>>내림차순</option>
					        		<option value="ASC" <c:if test="${searchParams.orderType == 'ASC'}">selected</c:if>>오름차순</option>
					        	</select>
					        	<select id="pageUnit" name="pageUnit" class="form-select-sm" onchange="searchList(1);">
					        		<option value="10" <c:if test="${searchParams.pageUnit == '10'}">selected</c:if>>10</option>
					        		<option value="20" <c:if test="${searchParams.pageUnit == '20'}">selected</c:if>>20</option>
					        		<option value="50" <c:if test="${searchParams.pageUnit == '50'}">selected</c:if>>50</option>
					        		<option value="100" <c:if test="${searchParams.pageUnit == '100'}">selected</c:if>>100</option>
					        	</select>
					        </div>
							<div class="col-sm-6">
								<div class="text-sm-end">
									<div class="btn-list ml-1">
					                    <button type="submit" class="btn btn-primary btn-sm" onclick="searchList(1);">검색</button>
					                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="searchReset();">초기화</button>
					                </div>
								</div>
							</div>
						</div>
						
					</form>
					
					<%-- 목록 표시 영역 --%>
					<div class="table-responsive">
						<table id="order-datatable" class="table table-centered table-hover w-100 nowrap dataTable">
						    <thead class="table-light">
						        <tr>
						        	<th scope="col">번호</th>
						            <th scope="col">커뮤니티ID</th>
						            <th scope="col">커뮤니티 구분</th>
						            <th scope="col">제목</th>
						            <th scope="col">작성자</th>
						            <th scope="col">내용</th>
						            <th scope="col">좋아요 수</th>
						            <th scope="col">싫어요 수</th>
						            <th scope="col" class="text-center">기타</th>
						        </tr>
						    </thead>
						    <tbody>
						    <c:choose>
						    	<c:when test="${not empty list}">
							    	<c:forEach var="item" items="${list}" varStatus="status">
							    	<tr>
							    		<td>${item.num}</td>
							    		<td>${item.commId}</td>
							    		<td>
							    			<c:choose>
								    			<c:when test="${item.commDiv == 1}">
								    				투표
								    			</c:when>
								    			<c:otherwise>
								    				월드컵
								    			</c:otherwise>
							    			</c:choose>
							    		</td>
							    		<td>${item.title}</td>
							    		<td>${item.writer}</td>
							    		<td>${item.content}</td>
							    		<td>${item.likeCnt}</td>
							    		<td>${item.dislikeCnt}</td>
							    		<td class="text-center">
											<a class="action-icon text-secondary" href="/comm/view.do?comm_id=${item.commId}" title="상세보기">
										    	<i class="mdi mdi-eye"></i>
											</a>
										</td>
							    	</tr>
							    	</c:forEach>
						    	</c:when>
						    	<c:otherwise>
							    	<tr>
										<td colspan="11" class="text-center">데이터가 없습니다.</td>
									</tr>
						    	</c:otherwise>
						    </c:choose>
						    </tbody>
						</table>
					</div>
					
					<%-- 페이지번호 표시 영역 --%>
					<div class="row">
						<ul class="paging_align">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="searchList" />
						</ul>    
					</div>

				</div>
			</div>
		</div>
	</div>
    <!-- end row-->
    
</div> <!-- container -->

<script>
$(document).ready(function() {
	
});

//목록 조회
function searchList(pageNo) {
	var frm = $('#communitySearchForm');
	if (pageNo >= 1) {
		frm.find(":hidden[name=pageIndex]").val(pageNo);
	}
	
	frm.submit();
}

//초기화
function searchReset() {
	$('#communitySearchForm').clearForm();
	searchList(1);
}
</script>