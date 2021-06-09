<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/WEB-INF/views/seller/menu.jsp" %>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<br>
<c:choose>
<c:when test="${on_off eq 1}" >
<%@ include file="/WEB-INF/views/seller/cancleOn.jsp" %>

</c:when>
<c:when test="${on_off eq 2 }">
	<%@ include file="/WEB-INF/views/seller/cancleOff.jsp" %>

</c:when>
</c:choose>


</main>





	</div>
	</div>
	
</body>
</html>