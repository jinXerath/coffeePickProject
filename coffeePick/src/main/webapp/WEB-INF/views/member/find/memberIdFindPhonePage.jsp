<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		
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
	    	        	  alert("전송에 실패하였습니다");
	    	              console.log("에러 발생");
	    	          }	  	          
		    	  });    	
		    });
		 	 //인증번호 확인버튼 누르면 인증번호 맞는지 확인
			$("#phone_number_check_btn").click(function(){
	    		if($("#phone_number_check").val()==randomNum){
	    			//alert("인증되었습니다");
	    		    var memberPhoneNumber = $("#member_phone").val();     
	    			$.ajax({
	    				url:"/member/memberIdFindPhone",
	    				type:"GET",
	    				data: { member_phone: memberPhoneNumber},
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
				
		
</head>
<body>
	<form id="form">
	
<label style="font-style:bold">핸드폰 번호</label>   <input type="text" id="member_phone" name="member_phone" placeholder="핸드폰 번호" value="${param.member_phone}"/>
      	<button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호</button> 
        <br/>
  인증번호 확인      <input type="text" id="phone_number_check">
  <button type="button" id="phone_number_check_btn">확인하기</button>
         <div id="phoneNumberCheck">
       <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
       	</div>
       <!-- //////////////////////////////////// -->
       	
       	
       	
       	
    </form>
</body>
</html>