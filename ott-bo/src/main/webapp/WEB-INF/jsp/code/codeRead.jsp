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
                <h4 class="page-title">코드 상세</h4>
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
				<label for="code_group"><b>코드그룹</b></label>
				<p>${item.codeGroup}</p>
				
				<label for="code"><b>코드</b></label>
				<p>${item.code}</p>
				
				<label for="code_name"><b>코드명</b></label>
				<p>${item.codeName}</p>
				
	    	</div>
    	</div>
    </form>
    
</div>