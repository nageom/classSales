<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">

<form action="/board/payStep1" method="post" onSubmit="goStep1(lastAmount)">
<!-- <form action="${pageContext.request.contextPath}/reserveComplete" method="post"> -->
<div class="reservation">
  	<h2>결제정보</h2>

  	<br>
  
  	<br>상품개수선택 
  	
	<select id="quantity" name="quantity" onchange="changeSelect()">
		<option value="" selected disabled>개수 선택</option>
    	<option value="1">1</option>
    	<option value="2">2</option>
    	<option value="3">3</option>
    	<option value="4">4</option>
	</select><br><br>

	결제금액  : <div id="pay" class="pay"></div>
	<br><br>
	<input type="submit" value="결제하기"/>
	
	<input type="hidden" id="amount" name="amount" value="" />
	<input type="hidden" id="cid" name="cid" value="${contentVO.cid}"/>
<!-- <input type="hidden" id="uid" name="uid" value=1/>  -->
	<input type="hidden" id="title" name="title" value="${contentVO.title}"/>
	
	


</div>
</form>

<script>


//submit 시에 hidden 으로 총 금액 amount 에 value가 들어감 
function goStep1(lastAmount) {
	var lastAmountt = $(".pay").val();
	document.getElementById('amount').value=lastAmount;
}


//선택 개수에 따라 결제금액 바꿔줌
var pay = document.querySelector('#pay');
var price= ${contentVO.price};
var lastAmount;

function changeSelect() {
	var langSelect = document.getElementById("quantity");
	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	
	
	pay.innerHTML = selectValue*price;
	lastAmount = selectValue*price;
	console.log(lastAmount);
	
	
}











</script>

