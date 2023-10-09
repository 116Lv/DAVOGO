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
                        <li class="breadcrumb-item"><a href="<c:url value="/movie.do"/>">영화관리</a></li>
                        <li class="breadcrumb-item active">영화 목록</li>
                    </ol>
                </div>
                <h4 class="page-title">영화관리</h4>
            </div>
        </div>
    </div>     
    <!-- end page title --> 

    <!-- 검색조건 -->
    <div class="row">
	    <div class="col-12">
		    <div class="card">
			    <div class="card-body">

				    <form id="movieSearchForm" name="movieSearchForm" class="mb-3" action="/movie.do" method="POST">
						<input type="hidden" name="pageIndex" value="${searchParams.pageIndex}"/>
	    
					    <div class="row mb-2">
					        <div class="col-sm-4 col-lg-6">
					            <a href="<c:url value="/movie/edit.do"/>" class="btn btn-info btn-sm btn-rounded mb-2">
					            	<i class="mdi mdi-plus"></i> 영화 등록
					            </a>
					        </div>
					        <div class="col-sm-8 col-lg-6">
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
									<input type="text" id="searchText" name="searchText" class="form-control" value="${searchParams.searchText}" placeholder="영화명 / 감독명 / 장르">
								</div>
							</div>
						</div>

						<div class="row mt-2">
							<div class="col-sm-6 mb-2">
					            <select id="orderColumn" name="orderColumn" class="form-select-sm me-1" onchange="searchList(1);">
					        		<option value="media_id" <c:if test="${searchParams.orderColumn == 'media_id'}">selected</c:if>>미디어ID</option>
					        		<option value="media_name" <c:if test="${searchParams.orderColumn == 'media_name'}">selected</c:if>>영화명</option>
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
						            <th scope="col">미디어ID</th>
						            <th scope="col">영화명</th>
						            <th scope="col">감독명</th>
						            <th scope="col">출연진</th>
						            <th scope="col">제작사</th>
						            <th scope="col">배급사</th>
						            <th scope="col">개봉일</th>
						            <th scope="col">상영시간</th>
						            <th scope="col">상영등급</th>
						            <th scope="col" class="text-center">기타</th>
						        </tr>
						    </thead>
						    <tbody>
						    <c:choose>
						    	<c:when test="${not empty list}">
							    	<c:forEach var="item" items="${list}" varStatus="status">
							    	<tr>
							    		<td>${item.num}</td>
							    		<td>${item.mediaId}</td>
							    		<td>${item.mediaName}</td>
							    		<td>${fnc:shorten(fn:replace(item.director, '^', ', '), 20)}</td>
							    		<td>${fnc:shorten(fn:replace(item.actor, '^', ', '), 20)}</td>
							    		<td>${fnc:shorten(fn:replace(item.producer, '^', ', '), 20)}</td>
							    		<td>${fnc:shorten(fn:replace(item.distributor, '^', ', '), 20)}</td>
							    		<fmt:parseDate var="dt" value="${item.openDate}" pattern="yyyyMMdd"/>
							    		<td><fmt:formatDate value="${dt}" pattern="yyyy.MM.dd"/></td>
							    		<td>${item.runningTime}분</td>
							    		<td>${item.ratingGrade}</td>
							    		<td class="text-center">
											<a class="action-icon text-secondary" href="/movie/view.do?media_id=${item.mediaId}" title="상세보기">
										    	<i class="mdi mdi-eye"></i>
											</a>
											<a class="action-icon text-info" href="/movie/edit.do?media_id=${item.mediaId}" title="수정하기">
										    	<i class="mdi mdi-square-edit-outline"></i>
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
	var frm = $('#movieSearchForm');
	if (pageNo >= 1) {
		frm.find(":hidden[name=pageIndex]").val(pageNo);
	}
	
	frm.submit();
}

//초기화
function searchReset() {
	$('#movieSearchForm').clearForm();
	searchList(1);
}
</script>