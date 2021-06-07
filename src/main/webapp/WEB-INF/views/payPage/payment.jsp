<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String name = (String) request.getAttribute("name");
	String email = (String) request.getAttribute("email");
	String phone = (String) request.getAttribute("phone");
	String address = (String) request.getAttribute("address");
	String tmp = (String) request.getAttribute("totalPrice");
	int totalPrice = Integer.parseInt(tmp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  step1 - 라이브러리 추가  -->
<!--  제이쿼리  -->
<script type="text/javascript"
						src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
<!--  iamport.payment.js -->
<script type="text/javascript"
						src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
  <!-- 버튼으로 이벤트 시작  --> 
  <button onclick="requestPay()"> 결제하기 </button>
  
	<script>
	
  //step2 - 가맹점 식별하기
        var IMP = window.IMP; // 생략가능
        IMP.init('imp94173102'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        

  
        
        
  //step3 - 결제창 호출코드 추가하기 
  // IMP.request_pay(param, callback)을 호출합니다. 함수의 첫번째 인자인 param에 결제 요청에 필요한 속성과 값을 담습니다.
  
  	function requestPay() {

        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'KH Books 도서 결제',
            amount : <%=totalPrice%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
           // buyer_addr : '<!%=address%>',
            buyer_postcode : '123-456',
            
            
            //m_redirect_url : 'http://www.naver.com'	
             //m_redirect_url : '/paySuccess'
            
        
//step 가맹점 서버에 쿼리 파라메터 전달하기 ↓
        }, function(rsp) {  //콜백
        	if ( rsp.success ) { //결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        		//jQuery로 HTTP 요청
        		
        		var form = {
        			oid: rsp.imp_uid,
        	//		uid: ${uid},
        	//		cid: ${cid},
        			amount: 1
        	//		quantity: 
        		}
        
        		jQuery.ajax({
        		url: "<%=request.getContextPath()%>/complete", // 가맹점 서버
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
