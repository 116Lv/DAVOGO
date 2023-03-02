<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
	
<!-- Start Content-->
<div class="container-fluid">
    
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">직원 상세</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
    <style>
 		div.content {
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
	    
    </style>
    
    <form>
    	<div class="content">
    		<div class="left">
	    		<h2>기본정보</h2>
	    		<hr>
				<label for="staff_name"><b>직원명</b></label>
				<p>${item.staffName}</p>
				
				<label for="id"><b>아이디</b></label>
				<p>${item.id}</p>
				
				<label for="password"><b>비밀번호</b></label>
				<p>${item.password}</p>
				
				<label for="email"><b>이메일</b></label>
				<p>${item.email}</p>
				
				<label for="phone_number"><b>전화번호</b></label>
				<p>${item.phoneNumber}</p>
				
				<label for="address"><b>주소</b></label>
				<p>${item.address}</p>
				
				<label for="entering_date"><b>입사일자</b></label>
				<p>${item.enteringDate}</p>
				
	    	</div>
    	</div>
    </form>
    
</div>