<%@ page import="com.test.board.service.MypageService"%>
<%@ page import="com.test.board.service.MypageServiceImpl"%>
<%@ page import="com.test.board.domain.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${contentVO.title}&nbsp내용</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- 달력 flatpickr -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!--  step1 - 라이브러리 추가  -->
<!--  제이쿼리  -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>

<div style="border:1px solid #444444;margin-left:200px ; margin-right:200px ;">

	<div style="float: right;">

		<div>

			<c:choose>

				<c:when test="${contentVO.on_off == 1}">
				<div style="border:1px solid #444444; margin-right:50px ;text-align:center;">
					<%@ include file="/WEB-INF/views/board/onPay.jsp"%>
				</div>
				</c:when>

				<c:when test="${contentVO.on_off == 2}">
				<div style="border:1px solid #444444; margin-right:50px ;text-align:center;">
					<%@ include file="/WEB-INF/views/board/offPay.jsp"%>
				</div>
				</c:when>



				<c:otherwise>
						잘못된 정보입니다. 
					</c:otherwise>

			</c:choose>


		</div>
	</div>

		<div>
			<div>${contentVO.title}&nbsp&nbsp &nbsp &nbsp &nbsp 판매자: &nbsp
				${VendorNickname} &nbsp &nbsp &nbsp &nbsp &nbsp 작성일: &nbsp
				${contentVO.condate}</div>
		</div>



		<div>
			<table style="border:1px solid #444444;margin-left:50px ; margin-right:50px ;text-align:left;  ">
				<tr>
					<th>상품 설명</th>
					<td>${contentVO.content}<c:forEach var="name"
							items="${images}" varStatus="status">
							<div>
								<p>
									<img src="<spring:url value="/image/${name}"/>" style="width: 300px; height: 200px" /> 
								</p>
								<br>

							</div>
						</c:forEach>
					</td>

				</tr>
			</table>
		</div>




		<div>
			<c:choose>
				<c:when test="${contentVO.on_off == 1}">
					<%@ include file="/WEB-INF/views/board/onRead.jsp"%>
				</c:when>

				<c:when test="${contentVO.on_off == 2}">
					<%@ include file="/WEB-INF/views/board/offRead.jsp"%>
				</c:when>

				<c:otherwise>
					<tr>
						<th>무슨 클래스게~?</th>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>

		<div>
			<c:choose>
				<c:when test="${sessionId.verification == 3}">
					<!-- 관리자일 경우	:	글 수정/삭제 버튼 + 목록 버튼 -->
					<a href="<c:url value="/edit/${contentVO.cid}"/>">수정</a>
					<a href="<c:url value="/delete/${contentVO.cid}"/>">삭제</a>
					<a href="<c:url value="/"/>">목록</a>
				</c:when>
			
				
				
			</c:choose>
		</div>

	<h4>생생후기</h4>
	후기달기
		<div>
			<%@ include file="/WEB-INF/views/reply/repList.jsp"%>
		</div>
</div>
</body>
</html>