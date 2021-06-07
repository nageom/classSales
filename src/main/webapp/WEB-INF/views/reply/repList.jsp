
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.test.board.service.MypageService" %>
<%@ page import="com.test.board.service.MypageServiceImpl" %>
<%@ page import="com.test.board.domain.MemberVO" %>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>




<textarea rows="8" cols="80" placeholder="후기를 작성해주세요." id="replyForm" class="replyForm"> </textarea>

<!-- <button id="regButton" onClick="reigster();" name="regButton">등록</button> -->

<input type="button" id="button1" onclick="uidCheck()" value="후기등록" />

<!--  후기 리스트 부분 -->
<div class="commentList"> 

</div>


</table>
<script type="text/javascript">
var cid = ${contentVO.cid};
var pageNum = 1;
//window.onload = register();
window.onload = commentList(cid, 1);

//로그인 여부 확인 
var sessionExist = sessionCheck();

var repcontent='';

function uidCheck() {
	if (sessionExist) {
		
		var uid= ${sessionId.uid};
		var cid= ${contentVO.cid};
		var ch='';
		
		$.ajax({
			type:"POST",
			url:"/board/uidCheck",
			data: {
				'uid':uid,
				'cid':cid
			},
			dataType:"json",
			
			success: function(data){
				ch = data;
				if (ch ==true) {
					register();
				
					
				}else {
					alert('상품 구매자만 후기를 남길 수 있습니다.')
				}	
			}
		});
		
		
		
	}else {
		alert('로그인이 필요한 서비스입니다.');
	}
	
	
	
}



// 댓글 등록
function register () {
	var regCheck='';

		//'textarea' 안의 값을 어떻게 가져오징
		//repcontent = document.getElementById('replyForm').val();
	repcontent = $(".replyForm").val();
	alert('repcontent:'+ repcontent);
	$.ajax({
		type:"GET",
		url:"/board/repRegister?uid="+${sessionId.uid}+"&cid="+${contentVO.cid}+"&repcontent="+ repcontent,
		success: function(data){
			regCheck = data
			console.log(regCheck);
				
			if (regCheck) {
				alert('후기등록 성공!');
				commentList(cid, pageNum);
			}
		}
	});
		
	
	
}



//session 확인 
//true는 있다. false는 없다.
function sessionCheck() {
	var check='';
	var result = true;
	$.ajax({
		type:"GET",
		url:"/board/sessionCheck",
		success:function(data){
			check = data;
			if (!check) {
				result= check;
			}
		}
	
	});
	
	return result;
}
	
	
	
	
var rid ='';
// 
// 댓글 삭제 
function repDelete(rid) {
	alert('rid:'+ rid);
	$.ajax({
		url:"/board/repDelete",
		type:'POST',
		data : {
			'rid' : rid
		},
		dataType:"json",
		success:function(data){
			check = data;

			if (check) {
				console.log(check);
				alert('후기 삭제 성공');
				commentList(cid, pageNum);
			}else {
				alert('후기 삭제 실패. 관리자에게 문의하세요.');
			}
			
		}
	});
}


function commentList(cid, pageNum) {
    $.ajax({
       url : '/board/commentlist',
       type : 'POST',
       data : {
          'cid' : cid,
          'pageNum' : pageNum
      },
       dataType:"json",
       success : function(data) {
    	   
          		var a = '';
    	   if (data == null) {
    		   a+=' <h2>아직 후기가 없는 게시물입니다.</h2> ';
    		   
    		   
    	   }else {
    	   
         	 	var startPage = data.startPage;
          		var endPage = data.endPage;
          		var repList = data.repList;
          		var pageNum = data.pageNum;
          		var uid = ${sessionId.uid};


          		$.each(repList, function(key, value) {
             		console.log("data : " + repList);
             		console.log(repList);
             		console.log(pageNum + "," + startPage + "," + endPage);
             		console.log("startPage : " + startPage);
             		console.log("endPage : " + endPage);
             		a += '<div class="commentArea" style="solid darkgray; margin-bottom: 30px; border: 1px solid #444444;">';
             		a += '<div class="commentInfo'+value.nickname+'">'+' 작성자 : '+value.nickname+'</div>';
             		a += '<div class="commentContent'+value.repcontent+'"> <p> &nbsp '+value.repcontent +'</p></div>';
             		if (sessionExist) {
            	 		if (value.uid == uid){
                			// a += '<a onclick="repDelete('+value.rid+');"> 삭제 </a> </div>';
                	 		a+= '<input type="button" id="deleteButton" onclick="repDelete('+value.rid+')" value="나의 후기 삭제" /> '
                	 
                 		}	
            	 
             		}
             		a+= '</div>';
             


             
          		});
          
          		for (var num=startPage; num<=endPage; num++) {
             		if (num == pageNum) {
                 		 a += '<a href="#" onclick="commentList(' + cid + ', ' + num + '); return false;" class="page-btn">' + num + '&nbsp </a>';
             		} else {
                 		 a += '<a href="#" onclick="commentList(' + cid + ', ' + num + '); return false;" class="page-btn">' + num + '&nbsp</a>';
            		}
          		}
          
         
    	   } //else 
          
          
          
        $('.commentList').html(a);
     }
  });
}  






</script>


