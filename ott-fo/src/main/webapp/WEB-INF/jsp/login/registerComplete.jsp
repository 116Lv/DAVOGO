<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
    <head>
        <title>Sign Up | 다보고</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style_login.css">
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
					<h4 class="text-dark-50 text-center pb-0 fw-bold">${user.email}님의 회원가입을 축하드립니다</h4>
					<form action="/signIn.do" method="post">
						<div class="form-group mt-3 text-center">
							<button class="btn btn-primary" type="submit">로그인화면으로</button>
						</div>
					</form>
					<form action="/main.do" method="post">
						<div class="form-group mt-3 text-center">
							<button class="btn btn-primary" type="submit">메인화면으로</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
        <script src="js/vendor/jquery/jquery.min.js"></script>
		<script src="js/popper.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/main.js"></script>
		<script defer
			src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854"
			integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg=="
			data-cf-beacon='{"rayId":"80bbf8bbefa3830a","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2023.8.0","si":100}'
			crossorigin="anonymous"></script>
        
        <footer class="footer footer-alt">
            <script>document.write(new Date().getFullYear())</script> © DAVOGO. All RIGHTS RESERVED.
        </footer>
        
    </body>
</html>
