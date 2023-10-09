<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko" data-sidenav-size="full">
	<tiles:insertAttribute name="htmlheader" />
	
	<body>
		<script>
		var contextPath = "${pageContext.request.contextPath}";
		</script>
		
		
		<!-- Begin page -->
        <div class="wrapper">
			<tiles:insertAttribute name="topbar" />
			
        	<tiles:insertAttribute name="left" />
        	
            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
        	<div class="content-page">
        		<div class="content">
					<tiles:insertAttribute name="content" />
				</div> <!-- content -->
				<tiles:insertAttribute name="footer" />
			</div>
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
		</div>
		
		<tiles:insertAttribute name="right" />

        <!-- Daterangepicker js -->
        <script src="<c:url value="/js/vendor/daterangepicker/moment.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/daterangepicker/daterangepicker.js"/>"></script>

        <!-- Toast js -->
        <script src="<c:url value="/js/vendor/jquery-toast-plugin/jquery.toast.min.js"/>"></script>
        
        <!-- Datatables js -->
        <script src="<c:url value="/js/vendor/datatables.net/js/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-fixedcolumns-bs5/js/fixedColumns.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-buttons/js/buttons.flash.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-buttons/js/buttons.print.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-keytable/js/dataTables.keyTable.min.js"/>"></script>
        <script src="<c:url value="/js/vendor/datatables.net-select/js/dataTables.select.min.js"/>"></script>

		<!-- 내가 추가한 파일들 -->
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js" integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>    
		<script src="<c:url value="/js/ui/jquery.ui.touch-punch.min.js"/>"></script>
		<script src="<c:url value="/js/ui/jquery.tmpl.min.js"/>"></script>
<%--         <script src="<c:url value="/js/game/common.js"/>"></script> --%>
        <script src="<c:url value="/js/vendor/jquery-cookie/js.cookie.js"/>"></script>
        
        <!-- Form js -->
        <script src="<c:url value="/js/vendor/jquery-form/jquery.form.min.js"/>"></script>
        
        <!-- Validation js -->
		<script src="<c:url value="/js/vendor/jquery-validation/jquery.validate.min.js"/>"></script>
		<script src="<c:url value="/js/vendor/jquery-validation/localization/messages_ko.js"/>"></script>
        
        <!-- Dynatree js -->
		<script src="<c:url value="/js/vendor/dynatree/jquery.dynatree.min.js"/>"></script>
		<script src="<c:url value="/js/vendor/dynatree/jquery.contextMenu-custom.js"/>"></script>
        
        <!-- 시간 timer -->
		<script src="<c:url value="/js/vendor/flatpickr/flatpickr.min.js"/>"></script>
        
        <!-- App js -->
        <script src="<c:url value="/js/app.min.js"/>"></script>
	</body>
</html>
