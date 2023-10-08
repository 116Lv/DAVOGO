<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row mt-4">
	<div class="col-md-12">
		<h5 class="mb-2"><b>"${params.searchInput}"의 검색결과</b></h5>
		
		<c:choose>
		<c:when test="${not empty searchList}">
			<div class="row">
				<c:forEach var="item" items="${searchList}">
					<div class="col-md-15">
						<div class="card my-3">
							<a class="text-dark" href="<c:url value="/tv/contents.do?media_id=${item.mediaId}"/>">
								<img class="card-img-top" src="${item.imgSrc}" alt="${item.mediaName}" onerror="this.src='/images/no-img.jpg';"/>
								<div class="card-body px-10 py-10">
									<h5 class="card-title font15 my-0 text-truncate" title="${item.mediaName}">${item.mediaName}</h5>
									<div class="font13" style="color: #a0a0a0;">${item.period} - ${item.country}</div>
									<div class="font12" style="color: #a0a0a0;">${item.mediaDiv == '1' ? '영화' : 'TV프로그램'}</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col text-center" style="height: 350px; margin-top: 160px;">
					검색 결과가 없어요. 다른 검색어를 입력해보세요.
				</div>
			</div>
		</c:otherwise>
		</c:choose>
	</div>
</div>
		