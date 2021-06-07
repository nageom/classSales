<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
<c:when test = "${sessionId == null}">
	<div style=" margin-right:100px ;">
<button name="login" onClick="location.href='<c:url value="/login"/>'">로그인</button>
<button name="regForm" onClick="location.href='<c:url value="/registerPage"/>'">회원가입</button>
</div>
</c:when>

<c:when test = "${sessionId.verification == 1}">
	<div style="margin-right:100px ;">
	 ${sessionId.nickname}님 환영 합니다. <button name="mypage" onClick="location.href='<c:url value="/mypage/mypageMain"/>'">마이페이지</button>
	<button name="logout" onClick="location.href='<c:url value="/logout"/>'">로그아웃</button>	
</div></c:when>



<c:when test = "${sessionId.verification == 2}">
	<div style="margin-right:100px ;">
	 ${sessionId.nickname}님 환영 합니다. <button name="mypage" onClick="location.href='<c:url value="/mypage/mypageMain"/>'">구매마이페이지</button>
	 									<button name="mypage" onClick="location.href='<c:url value="/seller/myClass/${sessionId.uid}"/>'">판매마이페이지</button>
	 									
	<button name="logout" onClick="location.href='<c:url value="/logout"/>'">로그아웃</button>	
</div></c:when>


</c:choose>