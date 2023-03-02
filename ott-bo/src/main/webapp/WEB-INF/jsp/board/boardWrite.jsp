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
		
	textarea {
		width: 100%;
		height:150px;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
	}
		
	select{
		width:100%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
	}

</style>

	
<!-- Start Content-->
<div class="container-fluid">

    <form id="boardForm" action="/board/save.do" method="post">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                	<a href="<c:url value="/board.do"/>" class="btn btn-primary btn-sm">목록</a>
                	<button type="submit" class="btn btn-primary btn-sm">저장</button>
                </div>
                <h4 class="page-title">공지 등록/수정</h4>
            </div>
        </div>
    </div>     
    <!-- end page title -->
    
    	<div class="center">
    		<div class="left">
	    		<h2>기본정보</h2>
	    		<hr>
	    		<label for="title"><b>공지명</b></label>
	    		<input type="hidden" name="board_id" value="${item.boardId}"/>
	    		<input type="text" placeholder="공지명" name="title" id="title" value="${item.title}" required>
	    		
	    		<label for="writer"><b>작성자</b></label>
	    		<input type="text" placeholder="작성자" name="writer" id="writer" value="${StaffVO.staffId}" required>
	    		
	    		<label for="content"><b>공지내용</b></label>
	    		<input type="text" placeholder="공지내용" name="content" id="content" value="${item.content}" required>
	    		
	    	</div>
    	</div>
    </form>
    
</div>