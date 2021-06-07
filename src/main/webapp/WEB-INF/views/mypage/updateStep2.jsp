<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 관리</h1>

	<a href="<c:url value="/#####" />">메인</a>


	<%@ include file="/WEB-INF/views/mypage/test.jsp" %>


<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<form action="/board/mypage/updateStep3" method="post">

	<p>
		<label>
		이메일(변경불가) : ${member.email}
		</label> <input type="hidden" name="uid" value="${member.uid}">
	</p>

	<p>
		<label>
		닉네임(변경불가) : ${member.email}
		</label>
	</p>
	
	<p>
		<label>
		비밀번호: <input type="password" name="password" value="${member.password}">
		</label>
	</p>
	<p>
		<label>
		연락처 : <input type="text" name="phone" value="${member.phone}">
		</label>
	
	
	<input type="submit" value="수정">
</form>
	
	</main>
	
</div>
</div>
	
</body>

</html>