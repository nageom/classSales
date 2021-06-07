<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">

	
<form action="/board/payStep1" method="post" id="payClick">
<!-- <form action="${pageContext.request.contextPath}/reserveComplete" method="post"> -->
<div class="reservation">
<h2>결제정보</h2>
  	<p>예약일</p>
  	<input id="resday" name="resday" type="text" class="resday" placeholder="예약일 확인" required/>
  	<br>
  	예약가능 인원 : <h2><div class="getPersonNumber"></div></h2>
  	
  	
  	<br>예약선택  
  	
	<select id="quantity" name="quantity" onchange="changeSelect(code)">
		<option value="" selected disabled>인원 선택</option>
    	<option value="1">1인</option>
    	<option value="2">2인</option>
    	<option value="3">3인</option>
    	<option value="4">4인</option>
	</select><br><br>
	

	결제금액  : <div id="pay" class="pay"></div>
	<br><br>
	<input type="button" value="결제하기" onclick="payStart()"/>
	
	<input type="hidden" id="amount" name="amount" value="" />
	<input type="hidden" id="cid" name="cid" value="${contentVO.cid}"/>
	<!-- <input type="hidden" id="uid" name="uid" value=1/>  -->
	<input type="hidden" id="title" name="title" value="${contentVO.title}"/>
	
	
</div>
</form>

<script>
//submit 시에 hidden 으로 총 금액 amount 에 value가 들어감 

//code는 ajax로 받아온 인원수
var code = "";

function goStep1(lastAmount) {
	var lastAmountt = $(".pay").val();
	document.getElementById('amount').value=lastAmount;
	
}

//4)  선택인원에 따라 결제금액 바꿔줌
var pay = document.querySelector('#pay');
var price= ${contentVO.price};
var lastAmount;

var over='인원수초과';
function changeSelect(code) {
	var langSelect = document.getElementById("quantity");
	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	
	
	pay.innerHTML = selectValue*price;
	lastAmount = selectValue*price;
	console.log(lastAmount);
	if (selectValue > code) {
		alert('인원수가 초과되었습니다. 다시 선택해주세욥');
		pay.innerHTML = '0';
	}
	
}

//1) 달력에 날짜표시
//eable: ["2020-02-18", "2020-02-19", "2020-02-21", "2020-02-20", "2020-02-27", "2020-02-26"] 
var resday = document.querySelector('.resday');
resday.flatpickr(
		{			
			inline: true,
			dateFormat: "Y-m-d",
			enable :  ${dayList}
		} 
);

//2) 클릭 날짜에 따른 이벤트  
//db안에 날짜 받아서 달력에 표시
var clickPart = document.getElementById("resday");
var showNumber=clickPart.addEventListener('change',onClick);


//3)날짜별 예약인원 표시하
//key=날짜, value=인원수 Ajax로 value 를 받아와서 띄어줌 

function onClick() {
	var inputcode = $(".resday").val();
	//cid는 content.jsp에서 vo객체로 받아오는 값을 넣어주기
	var num = $(".getPersonNumber");
	if (inputcode !=null) {
		//var personNum = "${dateMap.inputcode}";
		//document.getElementById('getPersonNumber').innerHTML=personNum;
		$.ajax({
			type:"GET",
			url:"/board/content/getPersonNumber?inputcode="+inputcode+"&cid="+ ${contentVO.cid},
			success:function(data){
				code = data;
				num.html(code);
				console.log(code);
			}
		});
	}
}	


function payStart() {
	if(sessionExist) {
		goStep1(lastAmount);
		document.getElementById('payClick').submit();
		//$('payClick').form.submit();
	}else {
		alert('로그인이 필요한 서비스입니다. ');
	}
	

	
	
}




</script>

