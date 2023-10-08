<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<!-- ========== Left Sidebar Start ========== -->
	<div class="leftside-menu">
	
	    <!-- LOGO -->
	    <a href="<c:url value="/"/>" class="logo text-center logo-light">
	        <span class="logo-lg">
	            <img src="<c:url value="/images/Davogo_Logo.png"/>" alt="" height="60">
	        </span>
	        <span class="logo-sm text-white">
	            <img src="<c:url value="/images/logo_sm1.png"/>" alt="" height="45">
	        </span>
	    </a>
	
	    <!-- LOGO -->
	    <a href="<c:url value="/"/>" class="logo text-center logo-dark">
	        <span class="logo-lg">
	            <img src="<c:url value="/images/Davogo_Logo.png"/>" alt="" height="60">
	        </span>
	        <span class="logo-sm text-white">
	            <img src="<c:url value="/images/logo_sm1.png"/>" alt="" height="45">
	        </span>
	    </a>
	
	    <div class="h-100" id="left-side-menu-container" data-simplebar>
	
	        <!--- Sidemenu -->
	        <ul class="side-nav">
	
	            <!-- <li class="side-nav-title side-nav-item">Menu</li> -->
	
	            <li class="side-nav-item">
	                <a href="/main.do" class="side-nav-link">
	                    <i class="uil-home-alt"></i>
	                    <span> Home </span>
	                </a>
	            </li>
	            
	            <li class="side-nav-item">
	                <a href="/movie.do" class="side-nav-link">
	                    <i class="uil-film"></i>
	                    <span> MOVIE </span>
	                </a>
	            </li>
	            
	            <li class="side-nav-item">
	                <a href="/tv.do" class="side-nav-link">
	                    <i class="uil-tv-retro"></i>
	                    <span> TV </span>
	                </a>
	            </li>
	
	            <li class="side-nav-item">
	                <a href="/banner.do" class="side-nav-link">
	                    <i class="uil-image"></i>
	                    <span> BANNER </span>
	                </a>
	            </li>
	
	            <li class="side-nav-item">
	                <a href="/review.do" class="side-nav-link">
	                    <i class="uil-thumbs-up"></i>
	                    <span> Review </span>
	                </a>
	            </li>
	
	            <li class="side-nav-item">
	                <a href="/code.do" class="side-nav-link">
	                    <i class="uil-tag"></i>
	                    <span> CODE </span>
	                </a>
	            </li>
	
	            <li class="side-nav-item">
	                <a href="/user.do" class="side-nav-link">
	                    <i class="uil-user"></i>
	                    <span> USER </span>
	                </a>
	            </li>
	            
	            <li class="side-nav-item">
	                <a href="/staff.do" class="side-nav-link">
	                    <i class="uil-constructor"></i>
	                    <span> STAFF </span>
	                </a>
	            </li>
	            
	            <li class="side-nav-item">
	                <a href="/board.do" class="side-nav-link">
	                    <i class="uil-clipboard-alt"></i>
	                    <span> NOTICE </span>
	                </a>
	            </li>
	
                <!-- <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarStatistics" aria-expanded="false" aria-controls="sidebarStatistics" class="side-nav-link">
                        <i class="uil-chart"></i>
                        <span> 통계 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarStatistics">
	                    <ul class="side-nav-second-level">
	                        <li>
	                            <a href="/stat/page1.do">화면1</a>
	                        </li>
	                        <li>
	                            <a href="/stat/page2.do">화면2</a>
	                        </li>
	                    </ul>
                    </div>
                </li>
	
                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarSystem" aria-expanded="false" aria-controls="sidebarSystem" class="side-nav-link">
                        <i class="dripicons-device-desktop"></i>
                        <span> 시스템 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarSystem">
	                    <ul class="side-nav-second-level">
	                        <li>
	                            <a href="/system/codeTree.do">코드관리</a>
	                        </li>
	                        <li>
	                            <a href="/system/noticeList.do">공지사항</a>
	                        </li>
	                    </ul>
					</div>
                </li> -->
	
	        </ul>
	
	        <!-- End Sidebar -->
	
	        <div class="clearfix"></div>
	
	    </div>
	    <!-- Sidebar -left -->
	
	</div>
	<!-- Left Sidebar End -->
            