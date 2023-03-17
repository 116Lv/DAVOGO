<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
	<!-- DEFAULT -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="Location" content="REPUBLIC OF KOREA" />
	<meta name="Cache-control" content="No-Cache" />
	<meta name="Pragma" content="no-cache" /> 
	<meta name="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="Content-Type" content="text/html; charset=utf-8" />
	
    <!-- App favicon -->
    <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" />

	<title>HOME | 게임 포탈 시스템</title>

<!-- 	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="<c:url value="/css/common.css"/>">

	<!-- Daterangepicker css -->
    <link rel="stylesheet" href="<c:url value="/js/vendor/daterangepicker/daterangepicker.css"/>">

    <!-- Datatables css -->
    <link href="<c:url value="/js/vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/js/vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/js/vendor/datatables.net-fixedcolumns-bs5/css/fixedColumns.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/js/vendor/datatables.net-fixedheader-bs5/css/fixedHeader.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/js/vendor/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/js/vendor/datatables.net-select-bs5/css/select.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/js/vendor/datatables.net-keytable-bs5/css/keyTable.bootstrap5.min.css"/>" rel="stylesheet" type="text/css" />

	<!-- Theme Config Js -->
    <script src="<c:url value="/js/hyper-config.js"/>"></script>
    
     <!-- Vendor js -->
    <script src="<c:url value="/js/vendor.min.js"/>"></script>

<!--     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->

    <!-- App css -->
    <link href="<c:url value="/css/app-saas.min.css"/>" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="<c:url value="/css/icons.min.css"/>" rel="stylesheet" type="text/css" />
    
    <!-- 시간 Timer css -->
    <link href="<c:url value="/js/vendor/flatpickr/flatpickr.min.css"/>" rel="stylesheet" type="text/css" />
    
	<!-- Plugin css -->
    <link rel="stylesheet" href="<c:url value="/js/vendor/jquery-toast-plugin/jquery.toast.min.css"/>">
    <link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet" />

</head>

