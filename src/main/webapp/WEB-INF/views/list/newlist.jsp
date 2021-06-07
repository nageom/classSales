<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 페이지</title>
</head>
<body>
	<h1>신규클라스</h1>

	<a href="<c:url value="/" />">메인</a>

	<div>
		<a href="<c:url value="/onofflist?on_off=1" />">온라인</a> / <a
			href="<c:url value="/onofflist?on_off=2" />">오프라인</a>
	</div>

	<br><br><a href="<c:url value="/write"/>">새글</a>
	
	<br><br>
	<div>
		<button name="login" onClick="location.href='<c:url value="/login"/>'">로그인</button>
		<button name="logout"
			onClick="location.href='<c:url value="/logout"/>'">로그아웃</button>
		<button name="regForm"
			onClick="location.href='<c:url value="/register"/>'">회원가입</button>
	</div>
	<br><br>

	<div>
		<a href="<c:url value="/newlist?on_off=${param.on_off}" />">신규클래스</a> / 
		<a href="<c:url value="/onofflist?on_off=1" />">인기클래스</a> / 
		<a href="<c:url value="/arealist?area=서울&on_off=${param.on_off}" />">지역별클래스</a> / 
		<a href="<c:url value="/onofflist?on_off=1" />">입점문의</a>
	</div>

	<div>
		<c:forEach var="board" items="${newlist}" varStatus="loop">
			<div style='width: 20%; float: left'>
				<table border="1">
					<c:choose>
						<c:when test="${board.cthumbnail ne null}">
							<tr>
								<td><img src="${board.cthumbnail}" width=100 height=100></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td><img src="/board/resources/images/basicPic.jpg"
									width=100 height=100></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td>${board.cid}</td>
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
	
	<div>
		<a href="<c:url value="/write" />">새 글</a>
	</div>
	
</body>

</html>