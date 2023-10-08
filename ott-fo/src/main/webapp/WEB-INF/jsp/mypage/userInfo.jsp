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
				<div class="card-title font-weight-bold">
					비밀번호 변경
				</div>
				<form id="userForm" name="userForm" action="/mypage/saveUserInfo.do" method="post" onsubmit="return false" autocomplete="off">
					<div class="card-text">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="width: 300px;">사용자 Email</th>
									<td>${loginUser.email}</td>
								</tr>
								<tr>
									<td>현재 비밀번호</th>
									<td><input type="password" class="form-control" id="password" name="password" /></td>
								</tr>
								<tr>
									<td>새로운 비밀번호</th>
									<td><input type="password" class="form-control" id="newPassword" name="newPassword" /></td>
								</tr>
								<tr>
									<td>새로운 비밀번호 확인</th>
									<td><input type="password" class="form-control" id="newPasswordConfirm" name="newPasswordConfirm" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="text-right">
						<button type="submit" class="btn btn-primary btn-save">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 
<script type="text/javascript">
$(document).ready(function() {
	if ("${resultCode}" == "fail") {
		alert("오류가 발생했습니다. [reason=${resultMessage}]");
	} else if ("${resultCode}" == "success") {
		alert("저장되었습니다.");
	}
});
</script> -->