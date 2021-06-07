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
	<form action="<c:url value = "register"/>" method="POST">
		<c:choose>
			<c:when test="${sessionId != null}">
				<div>이메일</div>
				<div>
					<input name="email" value="${sessionId}" disabled="disabled">
					<input type="hidden" name="email" value="${sessionId}">
				</div>
			</c:when>
		</c:choose>
		<div>
			<div>이름</div>
			<div>
				<input name="name" required>
			</div>
		</div>
		
		<div>
			<div>비밀번호</div>
			<div>
				<input type="password" name="password" required>
			</div>
		</div>
		<div>
			<div>닉네임</div>
			<div>
				<input name="nickname" required>
			</div>
		</div>

		<div class="check_register">
			<input type="submit" value="회원가입">

		</div>
		<div>
			<a href="<c:url value="naverLogin"/>">취소</a>
		</div>


	</form>
</body>
</html>