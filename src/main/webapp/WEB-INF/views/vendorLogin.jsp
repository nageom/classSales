<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="spring" uri= "http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
<div style="border: 1px solid #48BAE4; height: auto; width: 650px; text-align:center;">
관리자 로그인을 해주세요. 
	<form:form commandName="loginCommand">
	
	<p>
		<label>
		Email :
		<form:input path="email" />
		<form:errors path="email" />
		</label>
	</p>
	<p>
		<label>
			비밀번호 : 
			<form:password path="password" />
			<form:errors path="password" />
			
		
		</label>
	</p>
	
	<input type="submit" value="로그인">
	</form:form>

</div>

</body>
</html>