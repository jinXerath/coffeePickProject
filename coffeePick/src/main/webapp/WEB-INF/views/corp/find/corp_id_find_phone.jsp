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
		
		<script>
		$(function(){
			 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
	    	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
	    	        alert(errorMessage); // alert를 띄움
	    	    }   	 
			
	    	var randomNum;//인증번호 저장변수  
	    	// 핸드폰 인증번호 발송
		    $("#phoneNumberMsg").click(function(){
		    	console.log("실행됨");
		    	var corpPhone=$("#corp_phone").val();
		    	//phoneNumberMsg();
		    	console.log("실행");
		    	//핸드폰 인증번호 발송
		    	  $.ajax({
	    	          type: "GET",
	    	          url: "/corp/phoneNumberMsg",
	    	          data: { corp_phone: corpPhone },
	    	          success: function (randomNumber) {
	    	        	  alert("전송 성공");
	    	               randomNum=randomNumber; // 랜덤 넘버(인증번호)를 받아 변수에 저장합니다.
	    	              console.log("jsp쪽에서 받은 인증번호는" + randomNumber);
	    	          },
	    	          error: function () {
	    	        	  alert("전송에 실패하였습니다");
	    	              console.log("에러 발생");
	    	          }	  	          
		    	  });    	
		    });
		 	 //인증번호 확인버튼 누르면 인증번호 맞는지 확인
			$("#phone_number_check_btn").click(function(){
	    		if($("#phone_number_check").val()==randomNum){
	    			//alert("인증되었습니다");
	    		    var corpPhoneNumber = $("#corp_phone").val();     
	    			$.ajax({
	    				url:"/corp/corpIdFind_phone",
	    				type:"GET",
	    				data: { corp_phone: corpPhoneNumber},
	    				success:function(result){ //널값을 반환받으면 result는null이아니라 그냥 비어있음 ""상태임	
	    					if(result!=""){//만약 회원이 아닐떄
	    						alert("아이디는"+result+"입니다")
	    					$("#phoneNumberCheck").text("아이디는["+result+"]입니다.");
	    					}
	    					if(result==""){
	    						$("#phoneNumberCheck").text("없는회원입니다.");
	    						alert("아이디가 없습니다.");
	    					}
	    				},error:function(){
	    					alert("오류가 발생하였습니다,다시 시도해 주세요");
	    				}
	    			})    				
	    	   	}else{
	    			alert("인증번호가 틀립니다");
	    			}		
	    		});
	   	
	});
		</script>
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		
<title>Insert title here</title>
</head>
<body>
	<form id="form">
	<p>사업자 아이디찾기 폰</p><br/>
 핸드폰    <input type="text" id="corp_phone" name="corp_phone" placeholder="핸드폰 번호" value="${param.corp_phone}"/>
      	<button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호</button> 
        <br/>
  인증번호 확인      <input type="text" id="phone_number_check">
  <button type="button" id="phone_number_check_btn">확인하기</button>
         <div id="phoneNumberCheck">
       <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
       	</div>
    </form>
</body>
</html>