<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VENDOR </title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Fifth navbar example">

		<a class="navbar-brand" href="#">VENDOR</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsExample04" aria-controls="navbarsExample04"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample04">
			<ul class="navbar-nav me-auto mb-2 mb-md-0">
				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="/board/">메인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/onofflist?on_off=1" />">온라인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/onofflist?on_off=2" />">오프라인</a></li>
			</ul>
			<a class="btn btn-sm btn-outline-secondary" href="<c:url value="/mypage/logout" />">로그아웃</a> <span></span>

		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="<c:url value="/vendor/myClass/${sessionId.uid}" />"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-home">
									<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
									<polyline points="9 22 9 12 15 12 15 22"></polyline></svg> MY클래스
						</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/vendor/myOrder/${sessionId.uid}"/>"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-file">
									<path
										d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
									<polyline points="13 2 13 9 20 9"></polyline></svg> 클래스별 주문확인
						</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/vendor/cancleList/${sessionId.uid}" />"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-shopping-cart">
									<circle cx="9" cy="21" r="1"></circle>
									<circle cx="20" cy="21" r="1"></circle>
									<path
										d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
									환불 신청
						</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/vendor/changeComment/${sessionId.uid}" />"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-file">
									<path
										d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
									<polyline points="13 2 13 9 20 9"></polyline></svg> 정보수정
						</a></li>
						
						<li class="nav-item"><a class="nav-link" href="<c:url value="/vendor/request" />"> <svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-file">
									<path
										d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
									<polyline points="13 2 13 9 20 9"></polyline></svg> 게시판 등록 요청
						</a></li>
					</ul>

				</div>
			</nav>
			
			
			
			
			
			
			
			
	