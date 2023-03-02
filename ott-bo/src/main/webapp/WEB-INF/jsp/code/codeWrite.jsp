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
                <h4 class="page-title">코드 등록/수정</h4>
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
	    
	  	input[type=text] {
		  width: 100%;
		  padding: 15px;
		  margin: 5px 0 22px 0;
		  display: inline-block;
		  border: none;
		}
		
    </style>
    
    
    <form action="/code/save.do" method="post">
    	<button type="submit" class="btn btn-primary btn-sm">저장</button>
    	<div class="content">
    		<div class="left">
	    		<h2>기본정보</h2>
	    		<hr>
	    		<label for="code_group"><b>코드그룹</b></label>
	    		<input type="text" placeholder="코드그룹" name="code_group" id="code_group" value="${item.codeGroup}" required>
	    		
	    		<label for="code"><b>코드</b></label>
	    		<input type="text" placeholder="코드" name="code" id="code" value="${item.code}" required>
	    		
	    		<label for="code_name"><b>코드명</b></label>
	    		<input type="text" placeholder="코드명" name="code_name" id="code_name" value="${item.codeName}" required>
	    		
	    	</div>
    	</div>
    </form>
    
</div>