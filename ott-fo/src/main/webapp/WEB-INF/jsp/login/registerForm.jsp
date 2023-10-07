<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="ko">
	<head>
		<title>Sign Up | 다보고</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
		<meta name="Location" content="REPUBLIC OF KOREA" />
		<meta name="Cache-control" content="No-Cache" />
		<meta name="Pragma" content="no-cache" /> 
		<meta name="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="Content-Type" content="text/html; charset=utf-8" />
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<c:url value="/css/style_login.css"/>">
	</head>
	<body>
		<!-- 위로 공간 확보해야함 -->
		<div class="row justify-content-center">
			<div class="col-md-7 col-lg-5">
				<div class="login-wrap p-4 p-md-5">
					<div class="icon d-flex align-items-center justify-content-center">
						<a href="<c:url value="/"/>"> 
							<span><img src="<c:url value="/images/Davogo_Logo.jpg"/>" alt="" height="80"></span>
						</a>
					</div>
					<h3 class="text-center mb-4">Sign Up</h3>
					<form id="registerForm" name="registerForm" action="/register.do" class="login-form" method="post">
						<label for="email" class="form-label">이메일 주소</label>
						<div class="form-group">
							<input type="text" id="email" name="email" class="form-control rounded-left" placeholder="Email Address">
						</div>
						<label for="password" class="form-label">비밀번호</label>
						<div class="form-group">
							<input type="password" id="password" name="password" class="form-control rounded-left" placeholder="Password">
						</div>
						<label for="passwordConfirm" class="form-label">비밀번호 확인</label>
						<div class="form-group">
							<input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control rounded-left" placeholder="Password Again">
						</div>
						<div class="form-group">
							<button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign up</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer class="footer footer-alt text-center">
			<script>
				document.write(new Date().getFullYear())
			</script>
			© DAVOGO. All RIGHTS RESERVED.
		</footer>

		<script src="<c:url value="/js/vendor/jquery/jquery.min.js"/>"></script>
		<script src="<c:url value="/js/popper.js"/>"></script>
		<script src="<c:url value="/js/bootstrap.min.js"/>"></script>

        <!-- Validation js -->
		<script src="<c:url value="/js/vendor/jquery-validation/jquery.validate.js"/>"></script>
		<script src="<c:url value="/js/vendor/jquery-validation/localization/messages_ko.js"/>"></script>
		<script type="text/javascript">
			$(document).ready(function() {
	
				if ("${error}" == "true") {
					alert("오류가 발생했습니다");
				}
	
				$("#registerForm").validate({
					rules : {
						email : {
							required : true,
							email : true
						},
						password : {
							required : true
						},
						passwordConfirm : {
							required : true,
							equalTo : "#password"
						}
					},
					messages : {
						email : {
							required : "이메일 주소는 필수 입력입니다.",
							email : "이메일 형식을 확인해주세요."
						},
						password : {
							required : "비밀번호는 필수 입력입니다."
						},
						passwordConfirm : {
							required : "비밀번호 확인은 필수 입력입니다.",
							equalTo : "비밀번호와 비밀번호 확인이 서로 다릅니다."
						}
					}
				});
			});
		</script>
	</body>

</html>
