<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<div class="manageList">
	<div>
		<label for="on_off">On/Off</label>
		<select id="on_off_option" name="on_off" size="1">
			<option value="">선택</option>
			<option value="1">온라인</option>
			<option value="2">오프라인</option>
		</select>
		
		<label>판매자 검색</label>
		
		<input type="text" id="search" name="search" >
		
		<input type="button" value="검색" onclick="aMovePage1('/board/manager/search')">
	</div>
	<div>
		<table board="1">
			<tr>
				<th>대분류</th>
				<th>소분류</th>
				<th>On/Off</th>
				<th>클래스 타이틀</th>
				<th>판매자 이름</th>
				<th>참여 인원</th>
				<th>가격</th>
				<th>판매시작 일</th>
			</tr>
			<c:forEach var="manage" items="${manage}" varStatus="loop">

					<tr>
						<td>${manage.cid}</td>
						<td>${manage.big_name}</td>
						<td>${manage.small_name}</td>
						<c:choose>
						<c:when test="${manage.on_off == 1}">
						<td>온라인</td>
						</c:when>
						<c:otherwise>
						<td>오프라인</td>
						</c:otherwise>
						</c:choose>
						<td><a href='<c:url value="contentRead/${manage.cid }"/>'>${manage.title}</a></td>
						<td>${manage.nickName}</td>
						<td>${manage.att_num}</td>
						<td>${manage.price}</td>
						<td>${manage.condate}</td>
						<td><input type="button" id="delete" value="삭제" onclick="aMovePage2('/board/manager/delete', '${manage.cid}')"></td>
						
					</tr>
					
			</c:forEach>
		</table>
	</div>
	</div>
</body>
<script>
    function aMovePage1(url){
    	
    	var clickData1 = $("#search").val();
    	var clickData2 = $("#on_off_option").val();
    	console.log(clickData1);
    	
      
       var allData = {value: clickData1, on_off_option: clickData2}
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                data: allData,
                cache : false
        };
        	
        $.ajax(ajaxOption).done(function(data){
        	$(".manageList").children().remove();
            $(".manageList").html(data);
        

        });
    }
    
 function aMovePage2(url, cid){
    	
    
    	var clickData2 = $("#delete").val();
    
    	console.log(clickData2);
    	console.log(cid);
      
       var allData = {value: cid};
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                data: allData,
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
        	$(".manageList").children().remove();
            $(".manageList").html(data);
      
            
        });
    }
       
 
</script>
</html>