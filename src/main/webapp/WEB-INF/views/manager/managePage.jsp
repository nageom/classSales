<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<div class="changeMenu">
		<button class = "uploadButton" onclick="acyncMovePage1('/board/manager/changeMenu')" >게시물 올리기</button>
		<input type="hidden" id="value1"  value="1">
	</div>
	<div>
		<button class = "manageUser" onclick="acyncMovePage2('/board/manager/changeMenu')" >사용자 관리</button>
		<input type="hidden" id="value2"  value="2">
	</div>
	<div class="changedMenu">
		
	</div>
	
	<a href = ""></a>
	
	
	
<script>
    function acyncMovePage1(url){
    	
    	var clickData1 = $("#value1").val();
    	
    	console.log(clickData1);
    	
      
       var allData = {value: clickData1}
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                data: allData,
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
        	$(".changedMenu").children().remove();
            $(".changedMenu").html(data);
            console.log(data);
      	
            
        });
    }
 function acyncMovePage2(url){
    	
    
    	var clickData2 = $("#value2").val();
    
    	
      
       var allData = {value: clickData2}
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                data: allData,
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
        	$(".changedMenu").children().remove();
        	$(".changedMenu").html(data);
      
            
        });
    }
       
 
</script>


</body>
</html>