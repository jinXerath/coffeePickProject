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
			<script src="/resources/include/js/common.js"></script>
	
	
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
	
		<script>
		$(function(){			
			   var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
			   if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
			       alert(errorMessage); // alert를 띄움
			     }	
			
	    	var randomNum;//인증번호 저장변수  
	    	// 핸드폰 인증번호 발송
		    $("#phoneNumberMsg").click(function(){
		    	var memberPhone=$("#member_phone").val();
		    	//phoneNumberMsg();
		    	console.log("실행");
		    	//핸드폰 인증번호 발송
		    	  $.ajax({
	    	          type: "GET",
	    	          url: "/member/phoneNumberMsg",
	    	          data: { member_phone: memberPhone },
	    	          success: function (randomNumber) {
	    	        	  alert("전송 성공");
	    	               randomNum=randomNumber; // 랜덤 넘버(인증번호)를 받아 변수에 저장합니다.
	    	              console.log("jsp쪽에서 받은 인증번호는" + randomNumber);
	    	          },
	    	          error: function () {
	    	              console.log("에러 발생");
	    	          }	  	          
		    	  });    	
		    });
	    	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
	    	$("#phone_number_check_btn").click(function(){
	    		if($("#phone_number_check").val()==randomNum){
	    			$("#phoneNumberCheck").text("인증되었습니다");
	    			$("#next").prop("disabled",false);
	    		}else{
	    			$("#phoneNumberCheck").text("인증번호가 틀립니다");
	    		}		
	    	});
	    	
	    	//비밀번호 데이터 있는지 확인
	    	$("#next").click(function(){
	            if(!chkData("#member_id","아이디를"))return;
	            if(!chkData("#member_name","이름을"))return;
	            if(!chkData("#member_phone","핸드폰 번호를"))return;
	            else{          
	            $("#form").attr({
	                "method":"post",
	                "action":"/member/memberPwFind_phone"
	            });
	            $("#form").submit();	    		
	    		}
	    	});
	});
		</script>
<title>Insert title here</title>
</head>
<body>
	<form id="form" class="form">
<label>id</label>	<input type="text" id="member_id" name="member_id" placeholder="ID" value="${param.member_id}"/> <br/> 		
<label>이름</label>  	<input type="text" id="member_name" name="member_name" placeholder="성함" value="${param.member_name}"/><br/>
<label>핸드폰 번호</label>	<input type="text" id="member_phone" name="member_phone" placeholder="핸드폰 번호" value="${param.member_phone}"/>
<button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호</button> <br/>     
<label>인증번호</label>	<input type="text" id="phone_number_check" placeholder="인증번호">
<button type="button" id="phone_number_check_btn">확인하기</button><br/>
    <div id="phoneNumberCheck">
    <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
    </div><br/>
<button type="button" id="next" name="next" disabled="true">다음</button>   	
    </form>
</body>
</html>