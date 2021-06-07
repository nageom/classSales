<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<% int count =1; %>
<body>
<h2>MAIN</h2>
<div>
	<a href="<c:url value="/onofflist?on_off=1" />"><h4>온라인</h4></a> 
	<a href="<c:url value="/onofflist?on_off=2" />"><h4>오프라인</h4></a>
</div>
<div style="border:1px ; float: left ">
<%@ include file="/WEB-INF/views/list/loginCheck.jsp"%>

</div>
<br><br>

<div>
	<c:forEach var="board" items="${list}" varStatus="loop">
      <div style='width: 20%; float: left'>
         <table border="1">
	         <c:choose>
	         	<c:when test="${board.cthumbnail ne null}">
	         		<tr>
	            		<td><img src="<spring:url value="/image/${board.cthumbnail}"/>" style="width: 150px; height: 150px" /></td>
	            	</tr>
	         	</c:when>
	         	<c:otherwise>
	         		<tr>
						<td><img src="/board/resources/images/basicPic.jpg" width=100 height=100></td>
					</tr>
	         	</c:otherwise>
	         </c:choose>
            <tr>
               <td><%= count++ %></td>
            </tr>
            <tr>
               <td><a href="<c:url value="/contentRead/${board.cid}" />">${board.title}
               </a></td>
            </tr>
            <tr>
               <td>${board.big_name}</td>
            </tr>
            <tr>
               <td>${board.small_name}</td>
            </tr>
            <tr>
               <td>${board.area}</td>
            </tr>
            
         </table>
      </div>
   </c:forEach>
</div>

</body>

</html>