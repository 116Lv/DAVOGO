<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Start Content-->
<div class="container-fluid">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

    <!-- Demo styles -->
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width:1800px;
    	height:700px;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
		
		/*
         Center slide text vertically 
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
        */
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      
      .mySwiper2{
      	height: 500px;
      }
      
      .mySwiper2 img{
      	height: 300px;
      }
    </style>

    <!-- Swiper1 -->
    <div class="swiper mySwiper1">
      <div class="swiper-wrapper">
      

      	<c:forEach var="image" items="${imageList}">
        <div class="swiper-slide">
      <picture class="loaded css-ovhph3 euf32k20">
	      <source srcset="/attach/${image.bannerImage}" type="image/webp" >
	      <img src="/attach/main/2.jpg" alt="">
      </picture>
        </div>
        </c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
    
    <br>
    
    <h2>#고양이 짤들</h2>
    <!-- Swiper2 -->
    <div class="swiper mySwiper2">
      <div class="swiper-wrapper">
      	<c:forEach var="item" items="${imageList2}">
        <div class="swiper-slide">
        	<div class="item-image">
        		<img src="${item.url}">
        	</div><br>
        	<div class="item-info">
        		${item.title}
        	</div>
        </div>
        </c:forEach>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper1", {
   		rewind: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
      </script>
      
      <script>
      var swiper = new Swiper(".mySwiper2", {
          slidesPerView: 5,
          spaceBetween: 30,
          slidesPerGroup: 5,
          loopFillGroupWithBlank: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });
    </script>
    	    
</div> <!-- container -->
                