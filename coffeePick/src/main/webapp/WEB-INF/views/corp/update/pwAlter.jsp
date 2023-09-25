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
		 $(function () { 
	    	 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
	    	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
	    	        alert(errorMessage); // alert를 띄움
	    	    }
	    	   console.log("${vo.corp_id}");
	    	   console.log("${vo.corp_name}");
	    	   var corp_id = "${vo.corp_id}"; // vo 객체에서 필요한 값을 가져옴
	    	   var corp_pw = $("#corp_pw").val(); // 새로운 비밀번호 입력값
			   var corp_name="${vo.corp_name}";
			   var corp_phone="${vo.corp_phone}"
	    
	    	    //비밀번호 중복확인함수
	      		function pwCheck(){
	      			if($("#corp_pw").val() !== $("#pw_checker").val()) {
	      		       $("#pw_checkerResult").text("비밀번호가 같지않습니다");
	      		     $("#end").prop("disabled", true);//회원가입 버튼 비활성화
	      		    }
	      			if($("#corp_pw").val() == $("#pw_checker").val()) {
	       		       $("#pw_checkerResult").text("비밀번호가 확인되었습니다");
	       		    $("#end").prop("disabled", false);// 회원가입 버튼활성화
	       		    }  			
	            }       
	      	   // 포커스 아웃 이벤트 처리
	            $("#pw_checker").focusout(function () {
	            	pwCheck();
	            });
	            // keyup 이벤트 처리
	            $("#pw_checker").keyup(function () {
	            	pwCheck();
	            });
		 
	          //비밀번호 변경함수
		 	$("#end").click(function(){
		 	
		 	   corp_Id = "${vo.corp_id}"; // vo 객체에서 필요한 값을 가져옴
	    	   corp_pw = $("#corp_pw").val(); // 새로운 비밀번호 입력값	 
	    		 console.log("클리됨");  
		 		  // Ajax 요청 설정
			    $.ajax({
			        url: "/corp/pwAlter", // 요청을 보낼 URL
			        type: "POST", // HTTP 요청 방식 (POST)
			        data: {
			            corp_id: corp_id,
			            corp_pw: corp_pw
			        },
			        success: function(result) { // Ajax 요청이 성공했을 때 실행되는 함수
			            // 로그인 페이지로 이동
			            window.location.href = "/corp/loginForm"; // loginForm 페이지로 이동
			        },
			        error: function() { // Ajax 요청이 실패했을 때 실행되는 함수
			            alert("비밀번호 변경에 실패했습니다.");
			        }
			    });
		 	});	 	  
		 });
		</script>
		
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		
<title>Insert title here</title>
</head>
<body>
<p>비밀번호변경페이지</p>
<p>회원 아이디: ${vo.corp_id}</p>
<br/>
<p>회원 비밀번호: ${vo.corp_pw}</p>
<br/>
<p>회원 이름: ${vo.corp_name}</p>
<br/>
<form id="form">
<label>새 비밀번호</label><input type="password" id="corp_pw" name="corp_pw" placeholder="비밀번호" value="${param.corp_pw}"/>
        		<br/>
<label>새 비밀번호 확인</label><input type="password" id="pw_checker" name="pw_checker" placeholder="비밀번호 확인">
        			<div id="pw_checkerResult"><!--비밀번호 체크 확인결과 출력하는 메세지 넣을곳 -->
        
        			</div>
       			 <br/> 
	<button type="button" id="end" disabled="true">확인</button>
</form>
</body>
</html>