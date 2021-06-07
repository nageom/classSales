<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 후기</title>
</head>
<body>
	

	<%@ include file="/WEB-INF/views/mypage/test.jsp" %>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
					
				<div class="container">
					<div class="row">
						<table border="1">
			<tr>
						<th style="border: 1px solid #444444;">NO</th>
						<th style="border: 1px solid #444444;">후기상품</th>
						<th style="border: 1px solid #444444;">후기내용</th>
						<th style="border: 1px solid #444444;">등록일자</th>
						<th style="border: 1px solid #444444;"> </th>
						
			
				</tr>
	
	
<div>	
	<% int count = 1; %>
		<c:forEach var="reply" items="${repList}" varStatus="loop">
	<div>
			
					<tr>
						<td><%=count++ %></td>
					
				
						<td>${reply.title}</td>
					
					
						<td>${reply.repcontent}</td>
					
					
						<td>${reply.repdate}</td>
						
						<td>  <button onClick="location.href='<c:url value="/mypage/repDelete/${reply.rid}"/>'">삭제</button>  </td>
						
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