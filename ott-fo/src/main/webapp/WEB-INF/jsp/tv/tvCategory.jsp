<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="custom-container">
	<nav class="navbar navbar-expand-lg">
		<div class="collapse navbar-collapse" id="navbar_3">
			<div class="navbar-nav m-auto">
				<a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '드라마'}"> active</c:if>" genre="드라마">드라마</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '로맨스'}"> active</c:if>" genre="로맨스">로맨스</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '코미디'}"> active</c:if>" genre="코미디">코미디</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '애니메이션'}"> active</c:if>" genre="애니메이션">애니메이션</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '스릴러'}"> active</c:if>" genre="스릴러">스릴러</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '미스터리'}"> active</c:if>" genre="미스터리">미스터리</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '모험'}"> active</c:if>" genre="모험">모험</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '액션'}"> active</c:if>" genre="액션">액션</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '판타지'}"> active</c:if>" genre="판타지">판타지</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == 'SF'}"> active</c:if>" genre="SF">SF</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '공포'}"> active</c:if>" genre="공포">공포</a>
		        <a class="nav-item nav-link btn btn-outline-secondary genre mx-2 <c:if test="${genre == '다큐멘터리'}"> active</c:if>" genre="다큐멘터리">다큐멘터리</a>
			</div>
		</div>
	</nav>
	
	<!-- 커뮤니티처럼 카드로 표현 -->
</div>

<script src="<c:url value="/js/davogo/tv.js"/>"></script>