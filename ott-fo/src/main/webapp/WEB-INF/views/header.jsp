<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
	<!-- DEFAULT -->
	<%-- 
    <!-- App favicon -->
    <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" />

	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
	
    <!-- third party css -->
	<link href="<c:url value="/css/vendor/dataTables.bootstrap5.css"/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/css/vendor/responsive.bootstrap5.css"/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/css/vendor/buttons.bootstrap5.css"/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/css/vendor/select.bootstrap5.css"/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/css/vendor/fixedHeader.bootstrap5.css"/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/css/vendor/fixedColumns.bootstrap5.css"/>" rel="stylesheet" type="text/css" />
    <!-- third party css end -->

   	<!-- App css -->
    <link href="<c:url value="/css/icons.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/app.css"/>" rel="stylesheet" type="text/css" id="light-style" />
    <link href="<c:url value="/css/app.min.css"/>" rel="stylesheet" type="text/css" id="light-style" />
    <link href="<c:url value="/css/app-dark.min.css"/>" rel="stylesheet" type="text/css" id="dark-style" />
    
	<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="<c:url value="/css/game/common.css"/>" rel="stylesheet" type="text/css" />

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	--%>
	
	
	<!-- bootstrap greenfair템플릿 사용 -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="Location" content="REPUBLIC OF KOREA" />
	<meta name="Cache-control" content="No-Cache" />
	<meta name="Pragma" content="no-cache" /> 
	<meta name="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="Content-Type" content="text/html; charset=utf-8" />

    <title>HOME | DAVOGO</title>

    <!--Fontawesom-->
    <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">

    <!--Animated CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/animate.min.css"/>">

    <!-- Bootstrap -->
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
    
    <!--Bootstrap Carousel-->
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/carousel.css"/>" />

	<!-- isotope -->
    <link rel="stylesheet" href="<c:url value="/css/isotope/style.css"/>">

    <!--Main Stylesheet-->
    <link href="<c:url value="/css/style.css"/>" rel="stylesheet">
    <!--Responsive Framework-->
    <link href="<c:url value="/css/responsive.css"/>" rel="stylesheet">

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%-- 	<script src="<c:url value="/js/jquery-1.12.3.min.js"/>"></script> --%>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<!-- icon -->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">

	<!-- Validation js -->
	<script src="<c:url value="/js/vendor/jquery-validation/jquery.validate.js"/>"></script>
	<script src="<c:url value="/js/vendor/jquery-validation/localization/messages_ko.js"/>"></script>
	
	<!-- Dropzone -->
	<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
	
	<!-- star-rating -->
	<link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.0.7/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.0.7/js/star-rating.js" type="text/javascript"></script>
	
	<link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.0.7/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.0.7/themes/krajee-svg/theme.js"></script>
</head>

