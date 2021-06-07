<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>
</head>

<%@ include file="/WEB-INF/views/board/writeScript.jsp" %>

<body>
	<form action="write" method="POST" enctype="multipart/form-data">
		<div>
			<table border="1">
				<!-- 온/오르라인 - select(option) & 참여인원  - text & 가격 - text & 지역 - select(option) & 클래스 제목 - text & 클래스 내용 - textarea & 동영상/사진 첨부 - file/img -->
				<tr>
					<th>온/오프라인 선택</th>
					<td>
						<select name="on_off" id="on_off">
							<option value="1">온라인 클래스</option>
							<option value="2">오프라인 클래스</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>카테고리 선택</th>
					<td><select name="big_name" id="big_name" onchange="scateChange()">
							<option>공예</option>
							<option>요리</option>
							<option>뷰티</option>
					</select> <select name="small_name" id="small_name">
							<option>가죽</option>
							<option>유리</option>
							<option>실</option>
					</select></td>
				</tr>
				<tr>
					<th><label>참가 인원</label></th>
					<td><input type="text" name="att_num" /></td>
				</tr>
				<tr>
					<th><label>가격</label></th>
					<td><input type="text" name="price" /></td>
				</tr>
				<tr>
					<th><label>지역</label></th>
					<td>
						<select name="area">
							<option value="서울">서울</option>
							<option value="강원">강원</option>
							<option value="경기">경기</option>
							<option value="경남">경남</option>
							<option value="경북">경북</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="전남">전남</option>
							<option value="전북">전북</option>
							<option value="제주">제주</option>
							<option value="충남">충남</option>
							<option value="충북">충북</option>
							<option value="부산">부산</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label>제 목</label></th>
					<td><input type="text" name="title" /></td>
				</tr>
				
				<tr>
					<th><label>클래스 소개</label></th>
					<td><textarea name="content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<th><label>판매자</label></th>
					<td><input type="text" name="uid" /></td>
				</tr>
				
				<tr>
					<th><label>동영상</label></th>
					<td><input type="text" name="video"/></td>
				</tr>
			</table>
		</div>
		
		<div>
				<label>썸네일 사진</label>
					<input type="file" id="cImg" multiple="multiple" name="file" />
					<div class="select_img"><img src="" style="margin:20;"></div>
				
		</div>
		
		<div>
			<input type="submit" value="등록">&nbsp&nbsp
			<input type="reset" value="리셋">&nbsp&nbsp
			<a href="<c:url value="/"/>">목 록</a>
		</div>
	</form>
	
</body>



</html>