<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>NAVER LOGIN TEST</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<body>

	<h1>Login Form</h1>
	<hr>
	<br>
	<!-- Naver Login -->
	<center>

		<form action="<c:url value="siteLogin"/>" method="post">
			<h2>로그인</h2>
			<input type="text" name="email" id="id" class="w3-input w3-border" placeholder="아이디" > <br> 
				<input type="password" id="pwd" name="pwd" class="w3-input w3-border" placeholder="비밀번호"> <br> <input type="submit"
				value="로그인"> <br>
		</form>
		<br>
		<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align: center">
			<a
				href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=hg_EaXjXCIJ_6Xpo51lT&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fboard%2Fcallback&state=9365c5d6-1fee-4662-acce-05b4e5a34ed3">
				<img width="232"
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
			</a>
		</div>
		<br> <a
			href="https://kauth.kakao.com/oauth/authorize?client_id=f4978b1a2bf3652715a55bc2538a5dc9&redirect_uri=http://localhost:8080/board/kakaoLogin&response_type=code">
			kakao 로그인</a>

	</center>

</body>
</html>