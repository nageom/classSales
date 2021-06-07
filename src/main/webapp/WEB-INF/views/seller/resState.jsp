<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스별주문현황step2</title>
</head>
<body>
<%@ include file="/WEB-INF/views/seller/menu.jsp" %>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="container">
					<div class="row">
						<table border="1">
					<tr>
						<th>NO</th>
						<th>구매자uid</th>
						<th>구매상품</th>
						<th>개수</th>
						<th>결제금액</th>
						<th>예약일자</th>
						<th>구매일자</th>
						<th>취소여부</th>
					</tr>

	<% int count = 1; %>
		<c:forEach var="order" items="${list}" varStatus="loop">
			<div >

					
					<tr>
						<td><%=count++ %></td>
						
						<td>${order.uid}</td>
						
						<td>${order.title}</td>
						
						<td>${order.quantity}</td>
					
						<td>${order.amount}</td>
						<c:choose>
							<c:when test="${empty order.resday}">
								<td>예약일x</td>
							</c:when>
							<c:otherwise>
								<td>${order.resday}</td>
							</c:otherwise>
						
						</c:choose>
						
						<td>${order.paydate}</td>
					
						<td>${order.state}</td>
						
					</tr>

			</div>
		</c:forEach>
				</table>
	</div>
</div>
</main>





	</div>
	</div>
	
	


</body>
</html>


>