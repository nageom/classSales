<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불여부</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/mypage/test.jsp" %>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">



<c:if test="${result eq 0}">
<br>
	<h2>환불 실패</h2>
</c:if>

<c:if test="${result eq 1}">
<br>
	<h2>환불 성공</h2>
</c:if>
</main>

</div>
</div>
</body>
</html>