<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<style>
	div.center {
      width: 100%;
      display:flex;
    }
    
    div.left {
      width: 50%;
      padding: 30px;
      float: left;
      box-sizing: border-box;
      border: 1px solid;
    }
    
    div.right {
      width: 50%;
      padding: 30px;
      float: right;
      box-sizing: border-box;
      /* border: 1px solid; */
    }
    
  	input[type=text] {
	  width: 100%;
	  padding: 15px;
	  margin: 5px 0 22px 0;
	  display: inline-block;
	  border: none;
	}
	
</style>

<!-- 플러그인에서 제공해주는 css 로딩 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />
<!-- jquery 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.js"></script>
<!-- 플러그인 javascript 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	
	
<!-- Start Content-->
<div class="container-fluid">

    <form id="staffForm" action="/staff/save.do" method="post">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
            	<div class="page-title-right">
	            	<a href="<c:url value="/staff.do"/>" class="btn btn-primary btn-sm">목록</a>
	               	<button type="submit" class="btn btn-primary btn-sm">저장</button>
	            </div>
                <h4 class="page-title">직원 등록/수정</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
    	<div class="center">
    		<div class="left">
	    		<h2>기본정보</h2>
	    		<hr>
	    		<label for="staff_name"><b>직원명</b></label>
	    		<input type="hidden" name="staff_id" value="${item.staffId}"/>
	    		<input type="text" placeholder="직원명" name="staff_name" id="staff_name" value="${item.staffName}" required>
	    		
	    		<label for="id"><b>아이디</b></label>
	    		<input type="text" placeholder="아이디" name="id" id="id" value="${item.id}" required>
	    		
	    		<label for="password"><b>비밀번호</b></label>
	    		<input type="text" placeholder="비밀번호" name="password" id="password" value="${item.password}" required>
	    		
	    		<label for="email"><b>이메일</b></label>
	    		<input type="text" placeholder="이메일" name="email" id="email" value="${item.email}" required>
	    		
	    		<label for="phone_number"><b>전화번호</b></label>
	    		<input type="text" placeholder="전화번호" name="phone_number" id="phone_number" value="${item.phoneNumber}" required>
	    		
	    		<label for="address"><b>주소</b></label>
	    		<input type="text" placeholder="주소" name="address" id="address" value="${item.address}" required>
	    		
	    		<label for="entering_date"><b>입사일자</b></label>
	    		<input name="entering_date" id="entering_date" type="text" placeholder="날짜 입력..." value="${item.enteringDate}"/>
			   	<script>
			      	$("#entering_date").datetimepicker();
			   	</script>
			   	
	    	</div>
    	</div>
    </form>
    
</div>