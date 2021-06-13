<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!--  step1 - 라이브러리 추가  -->
<!--  제이쿼리  -->
<script type="text/javascript"
						src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
<!--  iamport.payment.js -->
<script type="text/javascript"
						src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>paystep1</title>
</head>
<body>


	<!-- contetnts.on_off가 2이면 인원수체크, 금액 체크 -->
	<c:choose>
		<c:when test="${contentVO.on_off == 1}">
		<div style="text-align:center">
		<h2>오프라인 상품구매</h2>
			<div style="border:1px solid #444444; margin-bottom:90px ;margin-left:500px ;margin-right:500px ;text-align:center;" >
				상품명 : ${contentVO.title} <br>
				수량 : ${OrderVO.quantity} 개 <br>
				배송지 확인 : <input type="text" id="address" value="${sessionId.area}">
			</div>
			
		

				<h4>결제 금액</h4>
			<h2>${OrderVO.amount} </h2> 
			  	<button onclick="offDeliver()" style="font-size: 30px; padding: 30px 50px;"> 결제하기 </button> 
		</div>
	

		
		
		</c:when>
		<c:when test="${contentVO.on_off == 2}">
		<div style="text-align:center">
		<h2>오프라인 상품구매</h2>
			<div style="border:1px solid #444444; margin-bottom:90px ;margin-left:500px ;margin-right:500px ;text-align:center;" >
				상품명 : ${contentVO.title} <br>
				인원 : ${OrderVO.quantity} 명 <br>
				예약일 : ${OrderVO.resday} <br>

			</div>
			
				<h4>결제 금액</h4>
			<h2>${OrderVO.amount} </h2> 
			  	<button onclick="onDeliver()" style="font-size: 30px; padding: 30px 50px;"> 결제하기 </button> 
		</div>
		</c:when>
		
		<c:otherwise>
						잘못된 정보입니다. 
		</c:otherwise>
		
		
	</c:choose>




<!--  ${contents.on_off}==1이면 고객 주소 확인 -->



<script type="text/javascript">
var deliver ='';

function onDeliver() {
	deliver = $(".address").val();
	requestPay();
}
function offDeliver() {
	deliver = '없음';
	requestPay();
}


</script>







  	
  	
<script>
/* 결제부분 script */
//step1 - 라이브러리 추가
//step2 - 가맹점 식별하기
var IMP = window.IMP; // 생략가능
IMP.init('imp94173102'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var msg;

//step3 - 결제창 호출코드 추가하기 
//IMP.request_pay(param, callback)을 호출합니다. 함수의 첫번째 인자인 param에 결제 요청에 필요한 속성과 값을 담습니다. 
function requestPay() {
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '아이디어스결제',
        amount : '${OrderVO.amount}',
        buyer_email : '${sessionId.email}',
        buyer_name : '${sessionId.name}'
		
       // buyer_addr : '<!%=address%>',
       // buyer_postcode : '123-456',
        
        
        //m_redirect_url : 'http://www.naver.com'	
         //m_redirect_url : '/paySuccess'
        
    
//step 가맹점 서버에 쿼리 파라메터 전달하기 ↓
    }, function(rsp) {  //콜백
    	if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
    		//jQuery로 HTTP 요청
    		var form = {
    			oid: rsp.imp_uid,
    			uid:'${OrderVO.uid}',
    			cid: '${OrderVO.cid}',
    			amount: rsp.paid_amount,
    			quantity:'${OrderVO.quantity}',
    			resday: '${OrderVO.resday}',
    			title: '${OrderVO.title}',
    			deliver: deliver
    			//resdate : lastResdate
    		}
    
    		jQuery.ajax({
    		url: "<%=request.getContextPath()%>/payComplete", // 가맹점 서버
     		//url: "https://www.myservice.com/payments/complete", // 가맹점 서버
     		method: "POST",
      		headers: { "Content-Type": "application/json" },
      		data: JSON.stringify(form)
      		/*data: {
            	oid: rsp.imp_uid,
            	merchant_uid: rsp.merchant_uid 
      			}
      		}*/
      		
  		}).done(function (data) {
    		// 가맹점 서버 결제 API 성공시 로직

            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            alert(msg);
          //location.href 어쩌구 자리
            
  		})

        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
    
       //alert(msg);
        
    });
    
    
    
    
    
}






</script>





</body>
</html>