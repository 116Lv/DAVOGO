<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <title>Log In | 게임 관리 시스템</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description" />
        <meta content="Coderthemes" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>">

        <!-- Theme Config Js -->
        <script src="<c:url value="/js/hyper-config.js"/>"></script>

        <!-- App css -->
        <link href="<c:url value="/css/app-saas.min.css"/>" rel="stylesheet" type="text/css" id="app-style" />

        <!-- Icons css -->
        <link href="<c:url value="/css/icons.min.css"/>" rel="stylesheet" type="text/css" />
    </head>

    <body class="authentication-bg">
        <div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xxl-4 col-lg-5">
                        <div class="card">

                            <!-- Logo -->
                            <div class="card-header py-4 text-center bg-primary">
                                <a href="<c:url value="/"/>">
                                    <span><img src="<c:url value="/images/white_logo.png"/>" alt="" height="80"></span>
                                </a>
                            </div>

                            <div class="card-body p-4">
                                
                                <div class="text-center w-75 m-auto">
                                    <h4 class="text-dark-50 text-center pb-0 fw-bold">로그인</h4>
                                    <p class="text-muted mb-4">사용자ID와 비밀번호를 입력하십시오.</p>
                                </div>

                                <form action="/login.do" method="post">

                                    <div class="mb-3">
                                        <label for="userId" class="form-label">사용자 ID</label>
                                        <input class="form-control" type="text" id="staffId" name="staffId" required="true" placeholder="사용자 ID를 입력하세요">
                                    </div>

                                    <div class="mb-3">
                                        <a href="javascript:alert('준비중입니다');" class="text-muted float-end"><small>비밀번호를 잊었나요?</small></a><!-- pages-recoverpw.html -->
                                        <label for="password" class="form-label">비밀번호</label>
                                        <div class="input-group input-group-merge">
                                            <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">
                                            <div class="input-group-text" data-password="false">
                                                <span class="password-eye"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="checkbox-signin" checked>
                                            <label class="form-check-label" for="checkbox-signin">Remember me</label>
                                        </div>
                                    </div>

                                    <div class="mb-3 mb-0 text-center">
                                        <button class="btn btn-primary" type="submit"> Log In </button>
                                    </div>

                                </form>
                            </div> <!-- end card-body -->
                        </div>
                        <!-- end card -->

						<%-- 
                        <div class="row mt-3">
                            <div class="col-12 text-center">
                                <p class="text-muted">Don't have an account? <a href="pages-register.html" class="text-muted ml-1"><b>Sign Up</b></a></p>
                            </div> <!-- end col -->
                        </div>
                         --%>
                        <!-- end row -->

                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end page -->

        <footer class="footer footer-alt">
            <script>document.write(new Date().getFullYear())</script> © DAVOGO. All RIGHTS RESERVED.
        </footer>

        <!-- bundle -->
        <script src="<c:url value="/js/vendor.min.js"/>"></script>
        <script src="<c:url value="/js/app.min.js"/>"></script>
        
    </body>
</html>
