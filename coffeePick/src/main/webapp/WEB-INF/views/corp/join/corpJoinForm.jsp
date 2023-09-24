<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/common.jspf" %>

        <style type="text/css">



</style>            
    <script>     
    $(function () { 
    	 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
    	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
    	        alert(errorMessage); // alert를 띄움
    	    }  	 
      	  var emailFront;//이메일 앞부분
          var emailBack;//이메일 뒷부분
          var corpEmail; //이메일 앞+@+뒷부분 합치는 변수
          var emailrandomNumber;//이메일인증번호 저장변수
          var corpPhone;
          var emailRandomNumberCheck=0;// 이메일 인증번호확인여부
          var phoneRandomNumberCheck=0;// 핸드폰 인증번호확인여부
        // 아이디 중복 체크,
        function idCheck() {
            var corpID = $("#corp_id").val();
            $.ajax({
                type: "GET",
                url: "/corp/idCheck",
                data: { corp_id: corpID },
                success: function (result) {
                    if (result == 0) {
                        $("#idCheckResult").text("사용 가능한 아이디 입니다.");
                        $("#join").prop("disabled", false);// 회원가입 버튼활성화
                    } else {
                        $("#idCheckResult").text("이미 사용 중인 아이디 입니다.");
                        $("#join").prop("disabled", true);//회원가입 버튼 비활성화
                    }                
                },
                error: function () {
                    $("#idCheckResult").text("서버 오류가 발생했습니다.");
                }
            });
        }       
        //버튼 활성화 함수
        function joinButtonStatus(){
        	   $("#join").prop("disabled", false);// 회원가입 버튼활성화
        }
        //비밀번호 중복확인함수
  		function pwCheck(){
  			if($("#corp_pw").val() !== $("#pw_checker").val()) {
  		       $("#pw_checkerResult").text("비밀번호가 같지않습니다");
  		     $("#join").prop("disabled", true);//회원가입 버튼 비활성화
  		    }
  			if($("#corp_pw").val() == $("#pw_checker").val()) {
   		       $("#pw_checkerResult").text("비밀번호가 확인되었습니다");
   		    $("#join").prop("disabled", false);// 회원가입 버튼활성화
   		    }  			
        }       
  	    //텍스트 필드 내용 변경될떄 처리
  		$("#corp_pw, #pw_checker").on('input', function () {
  		    pwCheck();
  		});
        $("#corp_pw").focusout(function(){
        	pwCheck();
        })
          // keyup 이벤트 처리
        $("#corp_pw").keyup(function () {
        	pwCheck();
        });      
  	   // 포커스 아웃 이벤트 처리
        $("#pw_checker").focusout(function () {
        	pwCheck();
        });
        // keyup 이벤트 처리
        $("#pw_checker").keyup(function () {
        	pwCheck();
        });
        // 포커스 아웃 이벤트 처리
        $("#corp_id").focusout(function () {
        	idCheck();
        });
        // keyup 이벤트 처리
        $("#corp_id").keyup(function () {
        	idCheck();
        });
        // 이메일 리스트 누르면 이메일 추가 함수
        $("#emailaddr").change(function(){ 
            var selectValue = $(this).val(); // 선택한 값 변수에 저장
            if(selectValue !== '') {
            	console.log("선택됨");
                $("#email_back").val(selectValue); // 선택한 값 변경
            } else {
            	console.log("선택됨");
                $("#email_back").val(''); // 직접입력 같은 경우 뒤의 값 초기화
            }
        });
        
    	var randomNum;//인증번호 저장변수  
    	  $("#phoneNumberMsg").click(function(){
  	    	corpPhone=$("#corp_phone").val();
  	    	phone_check();
  	    });
      	//핸드폰번호 중복체크
      	function phone_check(){
      		corpPhone=$("#corp_phone").val();
      		$.ajax({
      			type:"GET",
      			url:"/corp/phoneCheck",
      			data:{corp_phone:corpPhone},
      			success:function(result){
      				if(result!=0){
      					alert("중복된 핸드폰번호가 있습니다");
      					return;
      				}else{
      					send_phone();
      				}
      			}  			
      		});
      	}   	
      	//핸드폰인증번호 발송 메소드
      	function send_phone(){
      		corpPhone=$("#corp_phone").val();;
  	    	//핸드폰 인증번호 발송
  	    	  $.ajax({
      	          type: "GET",
      	          url: "/corp/phoneNumberMsg",
      	          data: { corp_phone: corpPhone },
      	          success: function (randomNumber) {
      	        	  alert("전송 성공");
      	               randomNum=randomNumber; // 랜덤 넘버(인증번호)를 받아 변수에 저장합니다.
      	              console.log("jsp쪽에서 받은 인증번호는" + randomNumber);
      	            $("#phone_number_check").prop("disabled", false); // 이 부분이 추가된 부분입니다. 	            
      	          },
      	          error: function () {
      	        	  alert("전송에 실패하였습니다.");
      	              console.log("에러 발생");
      	          }	  	          
  	    	  });   
      		}
/*     	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
    	$("#phone_number_check_btn").click(function(){
    		if($("#phone_number_check").val()==randomNum){
    			$("#phoneNumberCheck").text("인증되었습니다");
    			phoneRandomNumberCheck=1;
    			console.log(phoneRandomNumberCheck);
    		}else{
    			$("#phoneNumberCheck").text("인증번호가 틀립니다");
    		}		
    	});
 */
    //회원가입버튼
    $("#join").click(function(){
        if(!chkData("#corp_id","아이디를"))return;
        console.log("1");
        if(!chkData("#corp_pw","비빌번호를"))return;
        console.log("2");
        if(!chkData("#email_front","이메일을"))return;
        console.log("3");
        if(!chkData("#email_back","이메일을"))return;
        console.log("4");
        if(!chkData("#corp_registration_number","사업자 등록번호를"))return;
        else{//이메일칸 입력되있으면 이메일값 앞뒤합쳐서 전송하려고 준비하는 함수
       	   emailFront = $("#email_front").val();
           emailBack = $("#email_back").val();
           memberEmail = emailFront + "@" + emailBack;   
            $("#corp_email").attr({"value": memberEmail});
      }
        console.log("5");
        if(!chkData("#corp_addr","주소를"))return;
        console.log("6");
        if(!chkData("#corp_phone","핸드폰 번호를"))return;
        else{
            $(".form").attr({
                "method":"post",
                "action":"/corp/corpJoin"
            });
            $(".form").submit();
        }
    });
    //
    
    //로그인 버튼 클릭 시 특정 펭
    $("#loginPageMove").click(function () {
        window.location.href = "/member/loginForm"; // 로그인 페이지 URL로 변경
    });

    // 회원가입 버튼 클릭 시 특정 페이지로 이동
    $("#joinPageMove").click(function () {
        window.location.href = "/member/memberJoinForm"; // 회원가입 페이지 URL로 변경
    });
   

  	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
	$("#email_check_btn").click(function(){
		if($("#email_check").val()==emailrandomNumber){
			$("#email_check_text").text("인증되었습니다");
			emailRandomNumberCheck=1;
			console.log(emailRandomNumberCheck);
		}else{
			$("#email_check_text").text("인증번호가 틀립니다");
		}		
	});
    
	 //이메일중복 확인
    function email_check(){
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        corpEmail = emailFront + "@" + emailBack;   
    	$.ajax({
    		url:"/corp/emailCheck",
    		type:"GET",
    		data:{corp_email:corpEmail},
    		success:function(result){
    			if(result!=0){//중복 이메일이 있을시
    				alert("중복된 이메일이 존재합니다");
    				return;
    			}else{
    				sendEmail();//중복 없어야실행
    			}
    		}
    	})
    }		 	
	//이메일 인증번호 발송
    function sendEmail() {
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        corpEmail = emailFront + "@" + emailBack; 
 	   // AJAX 요청을 보냅니다.
        $.ajax({
            type: 'post',
            url: '/corp/mail',
            data: { corpEmail: corpEmail }, // 이메일 값을 서버로 전달합니다.
            success: function(response) {
                // 성공 시 동작
                alert("전송 성공");
                console.log('서버 응답:', response);
                console.log("이메일인증번호는"+response);
                emailrandomNumber=response;//받아온 인증번호를 이메일랜덤번호에 저장
                console.log("이메일인증번호는 저장한값은"+emailrandomNumber);
                $("#email_check").prop("disabled", false); // 이 부분이 추가된 부분입니다.
            },
            error: function(error) {
                // 에러 시 동작
                console.error('에러:', error);
            }
        });
    }
	
	//이메일 인증번호 발송 전 이메일중복체크시작하는 버튼
    $("#email_Number_Btn").click(function(e){
        e.preventDefault(); // 폼의 기본 동작을 막습니다.
        // 이메일 값을 가져와서 변수에 저장합니다.
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        corpEmail = emailFront + "@" + emailBack;   
        email_check();//이메일중복있는지 사전체크
    });
	 
});//스크립트 함수 끝부분!!!!!!!!!
</script>
    </head>
    <body>
        <!-- Body-->     
         <div class="container">
    <form class="form">     
<label>ID</label><input type="text" id="corp_id" name="corp_id" placeholder="ID" value="${param.corp_id}"/>
  					 <div id="idCheckResult"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 -->
       
       				</div>
        		<br/>
<label>pw</label><input type="password" id="corp_pw" name="corp_pw" placeholder="비밀번호" value="${param.corp_pw}"/>
        		<br/>
<label>비밀번호 확인</label><input type="password" id="pw_checker" name="pw_checker" placeholder="비밀번호 확인">
        			<div id="pw_checkerResult"><!--비밀번호 체크 확인결과 출력하는 메세지 넣을곳 -->
        
        			</div>
       			 <br/>     
<label>이름</label><input type="text" id="corp_name" name="corp_name" placeholder="성함" value="${param.corp_name}"/>
        		 <br/>     		  
  <input type="hidden" value="" id="corp_email" name="corp_email">
     <div><sub>이 주소로 이메일이 발송되어 회원가입을 인증하게 됩니다</sub></div>
        <br/>
         <input type='text' id="email_front"name="email_front" value="${param.email_front}">@
         <input type='text' id="email_back" name="email_back" value="${param.email_back}">
              <select name="emailaddr" id="emailaddr">
                 <option value="">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select>
         <button type="button" id="email_Number_Btn">발송</button>
        	  <br/>
 이메일 인증번호<input type="text" id="email_check" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
 <!--disable은 비활성화 활성화시키려면 보통 속성을 제거한다 -->
 	<button type="button" id="email_check_btn">인증</button>
 		<div id="email_check_text">
       <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
       	</div>
 		<br/>
 		
 			<br/>
   주소    <input type="text" id="corp_addr" name="corp_addr" placeholder="주소" value="${param.corp_addr}"/>
        <br/>
  핸드폰    <input type="text" id="corp_phone" name="corp_phone" placeholder="핸드폰 번호" value="${param.corp_phone}"/>
      	<button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호</button> 
      	
        <br/>
<label>핸드폰 인증번호</label><input type="text" id="phone_number_check" disabled="disabled" placeholder="인증번호 6자리를 입력해주세요!">
<button type="button" id="phone_number_check_btn">인증</button>
        <div id="phoneNumberCheck">
       <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
       	</div>
 		<br/>

<label>사업자 등록번호</label><input type="text" id="corp_registration_number" name="corp_registration_number" 
placeholder="사업자 등록번호" value="${param.corp_registration_number}">
<br/>
 		
        <button id="join">가입하기</button>
        

    </form>
    </div>
        <section class="body">

        </section>

    </body>
</html>
