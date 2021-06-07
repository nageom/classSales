<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VENDOR UPDATE</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/seller/menu.jsp" %>


<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<form action="/board/seller/changeComplete" method="post">

	<p>
		<label>
		이메일(변경불가) : ${sessionId.email}
		</label> <input type="hidden" name="uid" value="${sessionId.uid}">
	</p>

	<p>
		<label>
		판매자 주소지 :<input type="text" name="area" value="${vendorVO.area}">
		</label>
	</p>
	
	<p>
		<label>
		프로필 : 첨부파일 <input type="text" name="profile_pic" value="${vendorVO.profile_pic}">
		</label>
	</p>
	<p>
		<label>
		소개글 <br> <textarea rows="8"  name="info_vendor" >${vendorVO.info_vendor}</textarea><br>
		</label>
	</p>
	
	
	<input type="submit" value="수정">
</form>
	
	</main>
	
</div>
</div>
	
</body>

</html>