<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대분류 페이지</title>
</head>
<body>
	<h1>빅카테별리스트</h1>

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
							href="<c:url value="/smallcatelist?small_name=한식&on_off=${param.on_off}" />">한식</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=중식&on_off=${param.on_off}" />">중식</a>
							<i></i></li>
						<li class="소분류" active":" id="smallbutton"><a
							href="<c:url value="/smallcatelist?small_name=양식&on_off=${param.on_off}" />">양식</a>
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



	<div>
		<c:forEach var="board" items="${bigcatelist}" varStatus="loop">
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