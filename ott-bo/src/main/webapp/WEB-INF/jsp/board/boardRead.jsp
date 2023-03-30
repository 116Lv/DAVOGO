<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	
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


<!-- Start Content-->
<div class="container-fluid">
    
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">공지 상세</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
   	<div class="center">
   		<div class="left">
			<label for="title"><b>공지명</b></label>
			<p>${item.title}</p>
			
			<label for="writer"><b>작성자</b></label>
			<p>${item.writer}</p>
			
			<label for="start_date"><b>공지일</b></label>
			<p>${item.saveDate}</p>
			
			<label for="content"><b>공지내용</b></label>
			<p>${item.content}</p>
			
    	</div>
   	</div>
    
</div>