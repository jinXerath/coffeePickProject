<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	
			<script type="text/javascript" src="/resources/dist/js/jquery-3.7.0.min.js"></script>		
			<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
	
	
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		<script>
		$(function(){
			var memberEmail = $("#memberEmail").val();
			var emailrandomNumber;//이메일인증번호 저장변수
			
			//이메일 인증번호 발송
		    $("#go").click(function(e){
		        e.preventDefault(); // 폼의 기본 동작을 막습니다.

		        // 이메일 값을 가져와서 변수에 저장합니다.
		        memberEmail = $("#memberEmail").val();
			   // AJAX 요청을 보냅니다.
		        $.ajax({
		            type: 'post',
		            url: '/member/mail',
		            data: { memberEmail: memberEmail }, // 이메일 값을 서버로 전달합니다.
		            success: function(response) {
		                // 성공 시 동작
		                alert("전송 성공");
		                console.log('서버 응답:', response);
		                console.log("이메일인증번호는"+response);
		                emailrandomNumber=response;//받아온 인증번호를 이메일랜덤번호에 저장
		                console.log("이메일인증번호는 저장한값은"+emailrandomNumber);
			                
		            },
		            error: function(error) {
		                // 에러 시 동작
		                console.error('에러:', error);
		            }
		        });
		    });
		  	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
	    	$("#emailCheckBtn").click(function(){
	    		if($("#emailCheck").val()==emailrandomNumber){
	    			$("#email_number_check").text("인증되었습니다");
	    		}else{
	    			$("#email_number_check").text("인증번호가 틀립니다");
	    		}		
	    	});
		    
		});
/* 		    //이메일 인증번호 발송
     $('#email_check_btn').click(function() {
	   emailFront = $("#email_front").val();
           emailBack = $("#email_back").val();
           memberEmail = emailFront + "@" + emailBack; 
		console.log('완성된 이메일 : ' + memberEmail); // 이메일 오는지 확인
		var checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '/member/mailCheck', // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			data:{memberEmail:memberEmail},//memberEmail이란 이름으로 내용물은email데이터를보낸다
			success : function (data) {
				console.log("이메일발송성공");
			//	checkInput.attr('disabled',false);		
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil  */
		</script>
		
<title>Insert title here</title>
</head>
<body>
  <form id="exform">
        <input type="text" name="memberEmail" id="memberEmail" placeholder="받는 사람 입력">    
        <input type="submit" value="전송" id="go">
        <br>  
        <lable>이메일인증번호</lable><input type="text" name="emailCheck" id="emailCheck">
        <button type="button" id="emailCheckBtn" name="emailCheck">인증하기</button>
         <div id="email_number_check">
       <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
       	</div>
        
        
    </form>
</body>
</html>