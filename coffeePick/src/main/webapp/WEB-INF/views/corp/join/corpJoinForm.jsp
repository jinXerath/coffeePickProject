<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/common.jspf" %>

        <style type="text/css">



</style>          
	<script type="text/javascript" src="/resources/include/js/user/memberJoinCheck.js"></script>
     
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
          var idStatus=0;//아이디 상태
          var pwStatus=0;//비밀번호상태
          var corpRegistrationNumberStatus=0;//사업자등록번호상태
          var pwChkNumber;//비밀번호확인변수
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
        $("#corp_pw").on('input',function(){
        	if(pwChkData("#member_pw")==true){
       		 $("#pw_checkerResult").html("<sub>현재 입력된 비밀번호는 영문대소문자랑 숫자 혼합해서 6~15자 입니다 </sub>").css("color","blue");   		     	  			     		  
       		pwChkNumber=1;
        	}
        	if(pwChkData("#member_pw")==false){
  				console.log(pwChkData());
  			 $("#pw_checkerResult").html("<sub>비밀번호는 영문대소문자랑 숫자 혼합해서 6~15자로 만들어주세요 </sub>").css("color","red"); 
  			pwChkNumber=0;
  			}
        });
        
        $("#pw_checker").on('input',function(){
        	if(pwChkNumber=1){
       			pwCheck();
        	}
        	if(pwChkNumber=0){ 	
  			 $("#pw_checkerResult").html("<sub>비밀번호는 영문대소문자랑 숫자 혼합해서 6~15자로 만들어주세요 </sub>").css("color","red");   		
  			}
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
    	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
    	$("#phone_number_check_btn").click(function(){
    		if($("#phone_number_check").val()==randomNum){
    			$("#phoneNumberCheck").text("인증되었습니다");
    			phoneRandomNumberCheck=1;
    			console.log(phoneRandomNumberCheck);
    		}else{
    			$("#phoneNumberCheck").text("인증번호가 틀립니다");
    		}		
    	});

    //회원가입버튼
    $("#join").click(function(){
        if(!chkData("#corp_id","아이디를"))return;
        if(!idChkData("#corp_id")){
        	alert("아이디를 확인해주세요");
        	return;
        }
        if(!chkData("#corp_pw","비빌번호를"))return;
        if(!chkData("#email_front","이메일을"))return;
        if(!chkData("#email_back","이메일을"))return;
        if(!chkData("#corp_registration_number","사업자 등록번호를"))return;
        else{//이메일칸 입력되있으면 이메일값 앞뒤합쳐서 전송하려고 준비하는 함수
       	   emailFront = $("#email_front").val();
           emailBack = $("#email_back").val();
           memberEmail = emailFront + "@" + emailBack;   
            $("#corp_email").attr({"value": memberEmail});
      }
  /*       if(emailRandomNumberCheck==0){
        	alert("이메일을 인증하지 않았습니다");
        	return;
        }        */
        if(!chkData("#corp_addr","주소를"))return;
        if(!chkData("#corp_phone","핸드폰 번호를"))return;
   /*      if(phoneRandomNumberCheck==0){
        	alert("핸드폰 번호를 인증하지 않았습니다");
        	return;
        } */
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
<!-- Container 시작 -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form class="form">

                <!-- ID 입력 -->
                <div class="form-group">
                    <label for="corp_id">ID</label>
                    <input type="text" class="form-control" id="corp_id" name="corp_id" placeholder="ID" value="${param.corp_id}">
                    <div id="idCheckResult"></div>
                </div>

                <!-- 비밀번호 입력 -->
                <div class="form-group">
                    <label for="corp_pw">비밀번호</label>
                    <input type="password" class="form-control" id="corp_pw" name="corp_pw" placeholder="비밀번호" value="${param.corp_pw}">
                </div>

                <!-- 비밀번호 확인 입력 -->
                <div class="form-group">
                    <label for="pw_checker">비밀번호 확인</label>
                    <input type="password" class="form-control" id="pw_checker" name="pw_checker" placeholder="비밀번호 확인">
                    <div id="pw_checkerResult"></div>
                </div>

                <!-- 이름 입력 -->
                <div class="form-group">
                    <label for="corp_name">이름</label>
                    <input type="text" class="form-control" id="corp_name" name="corp_name" placeholder="성함" value="${param.corp_name}">
                </div>

                <!-- 이메일 입력 -->
                         <input type="hidden" value="" id="corp_email" name="corp_email"><!-- 이거 있어야 회원가입가능-->
                <div class="form-group">
                    <label>이메일</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="email_front" name="email_front" value="${param.email_front}">
                        <div class="input-group-append">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="email_back" name="email_back" value="${param.email_back}">
                    </div>
                    <select name="emailaddr" id="emailaddr" class="form-control mt-2">
                        <option value="">직접입력</option>
                        <option value="daum.net">daum.net</option>
                        <option value="empal.com">empal.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="msn.com">msn.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                    </select>
                </div>
                <div class="form-group">
                <!-- 발송버튼 -->
                  <div class="input-group mt-2">
                        <button type="button" id="email_Number_Btn" class="btn btn-primary">발송</button>
              
                    </div>
                            <!-- 이메일 인증 -->
                <div class="form-group">
                                      <input type="text" id="email_check" class="form-control" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
           
                    <button type="button" id="email_check_btn" class="btn btn-primary mt-2">인증</button>
                    <div id="email_check_text" class="text-danger"></div>
                </div>
                    <div id="email_check_text" class="text-danger"><!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 --></div>
                </div>
             
                <!-- 주소 입력 -->
                <div class="form-group">
                    <label for="corp_addr">주소</label>
                    <input type="text" class="form-control" id="corp_addr" name="corp_addr" placeholder="주소" value="${param.corp_addr}">
                </div>

                <!-- 핸드폰 번호 입력 -->
                <div class="form-group">
                    <label for="corp_phone">핸드폰 번호</label>
                    <input type="text" class="form-control" id="corp_phone" name="corp_phone" placeholder="핸드폰 번호" value="${param.corp_phone}">
                    <button type="button" class="btn btn-primary" id="phoneNumberMsg">인증번호</button>
                </div>

                <!-- 핸드폰 인증번호 입력 -->
                <div class="form-group">
                    <label for="phone_number_check">핸드폰 인증번호</label>
                    <input type="text" class="form-control" id="phone_number_check" disabled="disabled" placeholder="인증번호 6자리를 입력해주세요!">
                    <button type="button" class="btn btn-primary" id="phone_number_check_btn">인증</button>
                    <div id="phoneNumberCheck"></div>
                </div>

                <!-- 사업자 등록번호 입력 -->
                <div class="form-group">
                    <label for="corp_registration_number">사업자 등록번호</label>
                    <input type="text" class="form-control" id="corp_registration_number" name="corp_registration_number" placeholder="사업자 등록번호" value="${param.corp_registration_number}">
                </div>

                <!-- 가입하기 버튼 -->
                <div class="form-group">
                    <button type="button" class="btn btn-primary" id="join">가입하기</button>
                </div>

                <!-- 일반 회원가입 링크 -->
                <div class="form-group">
                    <p>일반 회원이신가요?</p>
                    <a href="/member/memberJoinForm" class="btn btn-link">일반 회원가입</a>
                </div>

            </form>
        </div>
    </div>
</div>
<!-- Container 끝 -->


    </body>
</html>
