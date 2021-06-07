<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ON / OFF LIST</title>
<% int count =1; %>
</head>
<body>
	<h2>ON / OFF LIST</h2>
	<c:choose>
	<c:when test="${onCheck ==1}">
		<h3>ON CLASS</h3>
	</c:when>
	<c:otherwise>
		<h3>OFF CLASS</h3>
	</c:otherwise>
	</c:choose>
	<a href="<c:url value="/" />">메인</a>

	<div>
		<a href="<c:url value="/onofflist?on_off=1" />">온라인</a> / <a
			href="<c:url value="/onofflist?on_off=2" />">오프라인</a>
	</div>
	

	<%@ include file="/WEB-INF/views/list/loginCheck.jsp"%>
	<br><br>

	<div>
		<a href="<c:url value="/newlist?on_off=${param.on_off}" />">신규클래스</a> / 
		<a href="<c:url value="/onofflist?on_off=1" />">인기클래스</a> / 
		<a href="<c:url value="/arealist?area=서울&on_off=${param.on_off}" />">지역별클래스</a> / 
		<a href="<c:url value="/onofflist?on_off=1" />">입점문의</a>
	</div>

	<div class="aside">
		<nav>
			<ul>
				<!-- js 쓰기 위한 li수정한 곳 -->
				<li class="공예" active":" id="bigbutton"><a
					href="<c:url value="/bigcatelist?big_name=공예&on_off=${param.on_off}" />">공예</a>
					<i></i>

					<ul>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=가죽&on_off=${param.on_off}" />">가죽</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=유리&on_off=${param.on_off}" />">유리</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=금속&on_off=${param.on_off}" />">금속</a>
							<i></i></li>

					</ul></li>

				<li class="요리" active":" id="bigbutton"><a
					href="<c:url value="/bigcatelist?big_name=요리&on_off=${param.on_off}" />">요리</a>
					<i></i>
					<ul>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=베이킹&on_off=${param.on_off}" />">베이킹</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=음료&on_off=${param.on_off}" />">음료</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=한식&on_off=${param.on_off}" />">한식</a>
							<i></i></li>

					</ul></li>
				<li class="요리" active":" id="bigbutton"><a
					href="<c:url value="/bigcatelist?big_name=뷰티&on_off=${param.on_off}" />">뷰티</a>
					<i></i>
					<ul>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=천연화장품&on_off=${param.on_off}" />">천연화장품</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=비누&on_off=${param.on_off}" />">비누</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=향수&on_off=${param.on_off}" />">향수</a>
							<i></i></li>

					</ul></li>
			</ul>
		</nav>
	</div>
<br><br>
	<div>
	<c:forEach var="board" items="${onofflist}" varStatus="loop">
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