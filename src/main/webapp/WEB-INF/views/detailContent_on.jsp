<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 클래스 상세 페이지</title>

<style>
      video { max-width: 80%; display: block; margin: 20px auto; }
</style>

</head>
<body>
	<div>
		<table border="1" align="center">
			<tr>
				<th colspan="2">클래스명</th>
				<td>${contentVO.title}</td>
			</tr>
			<tr>
				<td rowspan="2" align="center"><img src="images/nyang.png" alt="SampleImage"></td>
				<td>금액 : ${contentVO.price} </td>
			</tr>
			<tr>
				<td><a href="#"> 결제하기 </a></td>
			</tr>
			<tr>
				<th></th>
				<td colspan="2" align="center">클래스 설명</td>
			</tr>
		</table>
	</div>
	<div>
		<video controls poster="images/nyang.png">
			<source src="videos/samplevideo.mp4" type="video/mp4">
			<strong>Your browser does not support the video tag.</strong>
		</video>
	</div>
	<div>
		<form align="center">
			<p><textarea cols="50" rows="5"></textarea></p>
			<p><input type="submit" value="댓글 등록"></p>
    	</form>
	</div>
	<div>
		<input type="submit" value="등록">&nbsp&nbsp
		<a href="#">목 록</a>
	</div>
</body>
</html>