<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 클래스</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/seller/menu.jsp" %>

	
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="container">
					<div class="row">
						<table border="1">
	<tr>
						<th>NO</th>
						<th>구매상품</th>
						<th>금액</th>
					</tr>
<div>
	<% int count = 1; %>
		<c:forEach var="content" items="${list}" varStatus="loop">
			<div >

					
					<tr>
						<td><%=count++ %></td>
						
						<td><a href="/board/content/${content.cid}"> ${content.title}</a></td>
	
						<td>${content.price}</td>
						
					</tr>

			</div>
		</c:forEach>
				</table>
	</div>

</main>





	</div>
	</div>
	
	


</body>
</html>