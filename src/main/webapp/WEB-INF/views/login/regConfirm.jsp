<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	가입된 정보가 없습니다. 회원가입 하시겠습니까?
	<a href='<c:url value="/registerPage"/>'>회원가입</a>
	<a href='<c:url value="/main"/>'>로그인</a>
	<a href='<c:url value="/"/>'>홈으로 가기</a>
</body>
</html>