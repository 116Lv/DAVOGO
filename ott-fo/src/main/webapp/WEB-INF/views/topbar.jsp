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
								<a class="nav-item nav-link mx-2" href="/movie.do">영화</a>
								<a class="nav-item nav-link mx-2" href="/tv.do">TV프로그램</a>
								<a class="nav-item nav-link mx-2" href="/comm.do">커뮤니티</a>
							</div>
						</div>
			            <div class="collapse navbar-collapse justify-content-end" id="navbar2">
			                <div class="navbar-nav">
			                	<a class="nav-item nav-link search mx-2"><i class="fa fa-search"></i></a>
			                	<c:choose>
				                	<c:when test="${empty loginUser}">
					                	<a class="nav-item nav-link mx-2" href="/signIn.do">로그인</a>
					                	<a class="nav-item nav-link mx-2" href="/signUp.do">회원가입</a>
					                </c:when>
					                <c:otherwise>
					                	<a class="nav-item nav-link">${loginUser.userId}</a>
					                	<a class="nav-item nav-link mx-2" href="/myPage.do">마이페이지</a><%-- bootstrap의 Popovers 사용 --%>
					                	<a class="nav-item nav-link mx-2" href="/logout.do">로그아웃</a>
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

