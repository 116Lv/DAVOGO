<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
    <div class="h-100 my-5">

        <div class="list-group" id="mypageMenus">
			<a href="/mypage/userInfo.do" class="list-group-item list-group-item-action">내 정보 수정</a>
			<a href="/mypage/myComment.do" class="list-group-item list-group-item-action">내 미디어 Comment</a>
			<a href="/mypage/madeComm.do" class="list-group-item list-group-item-action">내가 만든 투표&월드컵</a>
			<a href="/mypage/joinComm.do" class="list-group-item list-group-item-action">참여한 투표&월드컵</a>
		</div>

    </div>
