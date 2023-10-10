<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="ko">
<tiles:insertAttribute name="htmlheader" />

<body data-spy="scroll" data-target="#header">

	<script>
		var contextPath = "${pageContext.request.contextPath}";
		var replaceSrc = '<spring:eval expression="@environment.getProperty('file.replaceSrc')"></spring:eval>';
		var replaceTrg = '<spring:eval expression="@environment.getProperty('file.replaceTrg')"></spring:eval>';
		var isLogin = ${not empty loginUser};
	</script>

	<!-- Begin page -->
	<%-- <tiles:insertAttribute name="topbar" /> --%>

	<!-- ============================================================== -->
	<!-- Start Page Content here -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<tiles:insertAttribute name="content" />
	</div>

	<!-- ============================================================== -->
	<!-- End Page content -->
	<!-- ============================================================== -->

	<%-- <tiles:insertAttribute name="footer" /> --%>

	<!-- bootstrap greenfair -->
	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->

	<!--Back To Top-->
	<script src="<c:url value="/js/backtotop.js"/>"></script>

	<!--JQuery Click to Scroll down with Menu-->
<%-- 	<script src="<c:url value="/js/jquery.localScroll.min.js"/>"></script> --%>
<%-- 	<script src="<c:url value="/js/jquery.scrollTo.min.js"/>"></script> --%>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
	
	<!-- Custom JavaScript-->
	<script src="<c:url value="/js/main.js"/>"></script>
</body>
</html>
