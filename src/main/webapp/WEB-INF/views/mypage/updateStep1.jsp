<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>

<%@ include file="/WEB-INF/views/mypage/test.jsp" %>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<form action="/board/mypage/updateStep2" method="post">
	<br><br>비밀번호 확인 : <input type="password" name="password">
<input type="submit" value="확인">
</form>
</main>







</div>
</div>

</body>
</html>