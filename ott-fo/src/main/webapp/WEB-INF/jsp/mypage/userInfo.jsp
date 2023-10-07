<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="col">
		<div class="card mt-5">
			<div class="card-body">
				<div class="card-title">
					사용자 정보 수정
				</div>
				<div class="card-text">
					<form id="userForm" name="userForm" action="/mypage/saveUserInfo.do">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th >사용자 Email</th>
									<td>${loginUser.email}</td>
								</tr>
								<tr>
									<th>현재 비밀번호</th>
									<td><input type="password" class="form-control" id="password" name="password" /></td>
								</tr>
								<tr>
									<th>새로운 비밀번호</th>
									<td><input type="password" class="form-control" id="newPassword" name="newPassword" /></td>
								</tr>
								<tr>
									<th>새로운 비밀번호 확인</th>
									<td><input type="password" class="form-control" id="newPasswordConfirm" name="newPasswordConfirm" /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="text-right">
					<button type="button" class="btn btn-primary" id="saveUserInfo">Save</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- js파일 임포트 -->
<script src="<c:url value="/js/davogo/comm.js"/>"></script>