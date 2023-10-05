<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<!-- Topbar Start -->
	<section id="header">
	    <div class="header-area">
			<div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav">
			    <div class="custom-container mt-1">
			        <nav class="navbar navbar-expand-lg justify-content-between">
			        
			            <!-- Brand and toggle get grouped for better mobile display -->
		                <a class="navbar-brand mr-3" href="/"><img src="/images/Davogo_Logo.jpg"></a>
			            <!--End of navbar-header-->

			            <div class="collapse navbar-collapse" id="navbar1">
			            	<div class="navbar-nav">
								<a class="nav-item nav-link text-dark mx-2" href="/movie.do"><h5 class="font-weight-bold">영화</h5></a>
								<a class="nav-item nav-link text-dark mx-2" href="/tv.do"><h5 class="font-weight-bold">TV프로그램</h5></a>
								<a class="nav-item nav-link text-dark mx-2" href="/comm.do"><h5 class="font-weight-bold">커뮤니티</h5></a>
							</div>
						</div>
						
			            <div class="collapse navbar-collapse justify-content-end" id="navbar2">
			                <div class="navbar-nav">
			                	<a class="nav-item nav-link search"><i class="fa fa-search fa-lg"></i></a>
			                	<c:choose>
				                	<c:when test="${empty loginUser}">
					                	<a class="nav-item nav-link text-dark mx-2" href="/signIn.do"><h5 class="font-weight-bold">로그인</h5></a>
					                	<a class="nav-item nav-link text-dark mx-2" href="/signUp.do"><h5 class="font-weight-bold">회원가입</h5></a>
					                </c:when>
					                <c:otherwise>
					                	<a class="nav-item nav-link">${loginUser.userId}</a>
					                	<a class="nav-item nav-link text-dark mx-2" href="/myPage.do"><h5 class="font-weight-bold">마이페이지</h5></a> <%-- bootstrap의 Popovers 사용 --%>
					                	<a class="nav-item nav-link text-dark mx-2" href="/logout.do"><h5 class="font-weight-bold">로그아웃</h5></a>
					                </c:otherwise>
				                </c:choose>
			                </div>
			            </div>
			            <!-- /.navbar-collapse -->
			        </nav>
			        <!--End of nav-->
			    </div>
			    <!--End of container-->
			</div>
			<!--End of header menu-->
		</div>
        <!--end of header area-->
	</section>
	<!--End of Hedaer Section-->
	
	<!-- end Topbar -->

