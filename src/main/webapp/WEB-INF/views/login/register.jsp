<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
	<form action ="<c:url value = "register"/>" method="POST" onsubmit="return jbSubmit();">
		
				<div class="mail_wrap">
					<div>이메일</div>
					<div class="mail_input_box">
						<input name = "email" class="mail_input" required>
					</div>
				<div class="mail_check_wrap">
                    <div class="mail_check_input_box" id="mail_check_input_box_false">
                        <input class="mail_check_input" disabled="disabled">
                    </div>
                    <div class="mail_check_button">
                      <button type="button">인증번호 보내기</button>
                    </div>
                    <div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
                </div>
                <div>
                	<div>
						<div>이름</div>
						<div><input name="name" required></div>
					</div>
                </div>
               </div>
	
		
		<div>
			<div>비밀번호</div>
			<div><input type="password" name="password" required></div>
		</div>
		<div>
			<div>닉네임</div>
			<div><input name="nickname" required></div>
		</div>
		
		<div class="check_register">
			<input type="submit" value="회원가입">
			
		</div>
		<div>
			<a href="<c:url value="naverLogin"/>">취소</a>
		</div>
		
		
	</form>
	<script>
		var code="";

		 
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function(){
		    
		    var email = $(".mail_input").val();        // 입력한 이메일
		    var checkBox = $(".mail_check_input");
		    var boxWrap= $(".mail_check_input_box");
		    
		    $.ajax({
		        
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	 //console.log("data : " + data);
		        	checkBox.attr("disabled", false);
		        	boxWrap.attr("id", "mail_check_input_box_true");
		        	code=data;
		        }
		    });
		    
		});
		$(".mail_check_input").blur(function(){
			var inputcode = $(".mail_check_input").val();
			var checkResult = $("#mail_check_input_box_warn");
			var checkRegister = $("#check_register");
			if(inputcode == code){
				checkResult.html("인증번호 일치");
				checkResult.attr("class", "correct");
			}
			if(inputcode != code){
				checkResult.html("인증번호 불일치");
				checkResult.attr("class", "incorrect");		
			
			}
			});
		
		function jbSubmit() {
	         var inputcode = $(".mail_check_input").val();
	         if (inputcode == null){
	            alert("인증번호를 확인해주세요");
	            return false;
	         }
	         if (inputcode != code) {

	            alert("인증번호를 확인해주세요");
	            return false;
	         }
	         if(!check){
	            alert("이메일 중복을 확인해주세요");
	            return false;
	         }
	         if(check == null){
	            alert("이메일중복을 확인해 주세요");
	            return false;
	         }
	      }
		
		//이메일 중복 체크 부분
	      $(".check_overlab").click(function() {
	         $.ajax({

	            type : "GET",
	            url : "checkOverlab?email=" + email,
	            success : function(data) {
	               check = data;
	               if(!check){
	                  alert("이미 등록되어 있는 이메일입니다.");
	               }
	               alert("사용가능한 이메일입니다.");
	            }
	         });

	      });
		</script>
</body>
</html>