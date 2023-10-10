<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="ko">
	<head>
		<title>Sign In | 다보고</title>
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
		<div class="row justify-content-center mt-10">
			<div class="col-md-7 col-lg-5">
				<div class="login-wrap p-4 p-md-5">
					<div class="icon d-flex align-items-center justify-content-center">
						<a href="<c:url value="/"/>">
					        <span><img src="<c:url value="/images/Davogo_Logo.jpg"/>" alt="" height="80"></span>
					    </a>
					</div>
					<h3 class="text-center mb-4">Sign In</h3>
					<form id="loginForm" action="/login.do" class="login-form" method="post">
						<label for="email" class="form-label">이메일 주소</label>
						<div class="form-group">
							<input type="text" id="email" name="email" class="form-control rounded-left" placeholder="Email Address" required>
						</div>
						<label for="password" class="form-label">비밀번호</label>
						<div class="form-group d-flex">
							<input type="password" id="password" name="password" class="form-control rounded-left" placeholder="Password" required>
						</div>
						<div class="form-group">
							<button type="submit" class="form-control btn btn-primary rounded submit px-3">Login</button>
						</div>
						<div class="form-group d-md-flex">
							<div class="w-50">
								<label class="checkbox-wrap checkbox-primary">Remember Me
									<input type="checkbox" checked> <span class="checkmark"></span>
								</label>
							</div>
							<div class="w-50 text-md-right">
								<a href="#">Forgot Password</a>
							</div>
						</div>
					</form>
					<div class="row">
                    <div class="col-12 text-center">
                        <p class="text-muted">Don't have an account? <a href="/signUp.do" class="text-muted ml-1"><b>Sign Up</b></a></p>
                    </div>
                </div>
				</div>
			</div>
		</div>
		</div>
		</section>
		<script src="<c:url value="/js/vendor/jquery/jquery.min.js"/>"></script>
		<script src="<c:url value="/js/popper.js"/>"></script>
		<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/js/main.js"/>"></script>
		<script defer
			src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854"
			integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg=="
			data-cf-beacon='{"rayId":"80bbf8bbefa3830a","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2023.8.0","si":100}'
			crossorigin="anonymous"></script>

		<footer class="footer footer-alt text-center">
		    <script>document.write(new Date().getFullYear())</script> © DAVOGO. All RIGHTS RESERVED.
		</footer>
		
		<!-- Validation js -->
		<script src="<c:url value="/js/vendor/jquery-validation/jquery.validate.js"/>"></script>
		<script src="<c:url value="/js/vendor/jquery-validation/localization/messages_ko.js"/>"></script>
		<script type="text/javascript">
			$(document).ready(function() {
	
				if ("${error}" == "true") {
					alert("로그인에 실패하였습니다");
				}
	
				$("#loginForm").validate({
					rules : {
						email : {
							required : true,
							email : true
						},
						password : {
							required : true
						}
					},
					messages : {
						email : {
							required : "이메일 주소는 필수 입력입니다.",
							email : "이메일 형식을 확인해주세요."
						},
						password : {
							required : "비밀번호는 필수 입력입니다."
						}
					}
				});
			});
		</script>
	</body>
	
	
</html>
