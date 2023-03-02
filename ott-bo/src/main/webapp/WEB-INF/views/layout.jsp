<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
	<tiles:insertAttribute name="htmlheader" />
	
	<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":true, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
		<script>
		var contextPath = "${pageContext.request.contextPath}";
		</script>
		
		
		<!-- Begin page -->
        <div class="wrapper">
        	<tiles:insertAttribute name="left" />
        	
            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
        	<div class="content-page">
        		<div class="content">
					<tiles:insertAttribute name="topbar" />
					<tiles:insertAttribute name="content" />
				</div> <!-- content -->
				<tiles:insertAttribute name="footer" />
			</div>
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
		</div>
		
		<tiles:insertAttribute name="right" />

        <!-- bundle -->
        <script src="<c:url value="/js/vendor.js"/>"></script>
<%-- 		<script src="<c:url value="/js/game/bootstrap-datepicker.ko.min.js"/>" charset="UTF-8"></script> --%>
		<script src="<c:url value="/js/ui/jquery.tmpl.min.js"/>"></script>
		
		<script src="<c:url value="/js/validation/jquery.form.min.js"/>"></script>
		<script src="<c:url value="/js/validation/jquery.validate.min.js"/>"></script>
		<script src="<c:url value="/js/validation/localization/messages_ko.js"/>"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
		<script src="<c:url value="/js/ui/jquery.ui.touch-punch.js"/>"></script>
		
		<script src="<c:url value="/js/vendor/dropzone.min.js"/>"></script>
		<script src="<c:url value="/js/game/common.js"/>"></script>

		<script src="<c:url value="/js/dynatree/jquery.dynatree.min.js"/>"></script>
		<script src="<c:url value="/js/dynatree/jquery.contextMenu-custom.js"/>"></script>
		<script src="<c:url value="/js/jquery.cookie.js"/>"></script>
		<script src="<c:url value="/js/jquery.fileDownload.js"/>"></script>
		
        <script src="<c:url value="/js/app.js"/>"></script>
        
        <!-- third party js -->
        <script src="<c:url value="/js/vendor/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/dataTables.bootstrap5.js"/>"></script>
        <script src="<c:url value="/js/vendor/dataTables.responsive.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/responsive.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/dataTables.buttons.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/buttons.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/buttons.html5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/buttons.flash.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/buttons.print.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/dataTables.keyTable.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/dataTables.select.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/fixedColumns.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/fixedHeader.bootstrap5.min.js"/>"></script>
	</body>
</html>
