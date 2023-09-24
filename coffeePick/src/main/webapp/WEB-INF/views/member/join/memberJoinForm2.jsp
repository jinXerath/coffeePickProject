<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript" src="/resources/include/js/user/memberJoinCheck.js"></script>
    <script>     
    $(function () { 
    	 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
    	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
    	        alert(errorMessage); // alert를 띄움
    	    }
    	 var randomNum;//인증번호 저장변수  
      	  var emailFront;//이메일 앞부분
          var emailBack;//이메일 뒷부분
          var memberEmail; //이메일 앞+@+뒷부분 합치는 변수
          var emailrandomNumber;//이메일인증번호 저장변수
          var memberPhone;
          var emailRandomNumberCheck=0;// 이메일 인증번호확인여부
          var phoneRandomNumberCheck=0;// 핸드폰 인증번호확인여부
          var idStatus=0;//아이디 상태
          var pwStatus=0;//비밀번호상태
          var nickNameStatus=0;//닉네임상태
          
       // 닉네임 중복 체크,
        function nickNameCheck() {
            var memberNick = $("#member_nickname").val();
           
            $.ajax({
                type: "GET",
                url: "/member/nickCheck",
                data: { member_nickname: memberNick },
                success: function (result) {
                    if (result == 0) {                  	
                        $("#nickCheckResult").text("사용 가능한 닉네임입니다.");
                        $("#join").prop("disabled", false);//회원가입 버튼 비활성화
                        nickNameStatus=1;
                        console.log(nickNameStatus);
                    } else {
                        $("#nickCheckResult").text("이미 사용 중인 닉네임입니다.");
                        $("#join").prop("disabled", true);//회원가입 버튼 비활성화
                    }                 
                },
                error: function () {
                    $("#nickCheckResult").text("서버 오류가 발생했습니다.");
                }
            });
        }

        // 아이디 중복 체크,
        function idCheck() {
            var memberID = $("#member_id").val();
            $.ajax({
                type: "GET",
                url: "/member/idCheck",
                data: { member_id: memberID },
                success: function (result) {
                    if (result == 0) {
                   //     $("#idCheckResult").text("사용 가능한 아이디 입니다.").css("color","blue");
                         $("#idCheckResult").html("<sub>사용 가능한 아이디 입니다.</sub>").css("color", "blue");
                        $("#join").prop("disabled", false);// 회원가입 버튼활성화
                    } else {
                      //  $("#idCheckResult").text("이미 사용 중인 아이디 입니다.").css("color", "red");
                         $("#idCheckResult").html("<sub>이미 사용 중인 아이디 입니다.</sub>").css("color", "red");             
                        $("#join").prop("disabled", true);//회원가입 버튼 비활성화
                    }                
                },
                error: function () {
                    $("#idCheckResult").text("서버 오류가 발생했습니다.");
                }
            });
        }       
        //회원가입 버튼 활성화 함수
        function joinButtonStatus(){
        	   $("#join").prop("disabled", false);// 회원가입 버튼활성화
        }
        //비밀번호 중복확인함수
  		function pwCheck(){
  			if($("#member_pw").val() !== $("#pw_checker").val()&&$("#member_pw").val()!=="") {
  		       $("#pw_checkerResult").html("<sub>비밀번호가 같지않습니다</sub>").css("color","red");
  		     $("#join").prop("disabled", true);//회원가입 버튼 비활성화
  		    }
  			if($("#member_pw").val() == $("#pw_checker").val()&&$("#member_pw").val()!=="") {
   		       $("#pw_checkerResult").html("<sub>비밀번호가 확인되었습니다</sub>").css("color","blue");
   		    $("#join").prop("disabled", false);// 회원가입 버튼활성화
   		    }  			
        }       
        //아이디 글자제한 확인
        $("#member_id").on('input',function(){
        //	idChkData("#member_id");
        	if(idChkData("#member_id")==true){
        		idCheck();
        	}
        	if(idChkData("member_id"==false)){
                $("#idCheckResult").text("아이디는 영문 대소문자 또는 숫자로 이루어진 4~15자리로 만들어주세요").css("color", "red");
        	}
        });
/*         // 포커스 아웃 이벤트 처리
        $("#member_id").focusout(function () {
        	idCheck();
        }); */
/*         // keyup 이벤트 처리
        $("#member_id").keyup(function () {
        	idCheck();
        }); */
        //텍스트 필드 내용 변경될떄 처리
  		$("#member_pw, #pw_checker").on('input', function () {
  			if(pwChkData==true){
  		    pwCheck();
  			}
  			if(pwChkData==false){
  			 $("#pw_checkerResult").html("<sub>비밀번호는 영문대소문자랑 숫자 혼합해서 6~15자로 만들어주세요 </sub>").css("color","red");   		   
  			}
  		});
        $("#member_pw").focusout(function(){
    		if(pwChkData==true){
      		    pwCheck();
      			}
      			if(pwChkData==false){
      			 $("#pw_checkerResult").html("<sub>비밀번호는 영문대소문자랑 숫자 혼합해서 6~15자로 만들어주세요 </sub>").css("color","red"); 	   		   
      			}
        })
          // keyup 이벤트 처리
        $("#member_pw").keyup(function () {
    		if(pwChkData==true){
      		    pwCheck();
      			}
      			if(pwChkData==false){
      			 $("#pw_checkerResult").html("<sub>비밀번호는 영문대소문자랑 숫자 혼합해서 6~15자로 만들어주세요 </sub>").css("color","red"); 	   		   
      			}
        });
  	   // 포커스 아웃 이벤트 처리
        $("#pw_checker").focusout(function () {
        	pwCheck();
        });
        // keyup 이벤트 처리
        $("#pw_checker").keyup(function () {
        	pwCheck();
        });
        // 닉네임 글자제한 처리
        $("#member_nickname").on('input',function () {
        
        	if(nickNameChkData("#member_nickname")==true){
            nickNameCheck();
        	}
        	if(nickNameChkData("#member_nickname")==false){
        	     $("#nickCheckResult").html("<sub>닉네임은 한글 영어 혼합 2자이상 8자 이하 로 만들어주세요</sub>").css("color","red");
        	}
        });
        // 닉네임 글자제한 처리
        $("#member_nickname").focusout(function () {
        
        	if(nickNameChkData("#member_nickname")==true){
            nickNameCheck();
        	}
        	if(nickNameChkData("#member_nickname")==false){
        	     $("#nickCheckResult").html("<sub>닉네임은 한글 영어 혼합 2자이상 8자 이하 로 만들어주세요</sub>").css("color","red");
        	}
        });
      /*   // keyup 이벤트 처리
        $("#member_nickname").keyup(function () {
            nickNameCheck();
        }); */
    
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
    	// 핸드폰 인증번호 발송시 먼저 핸드폰중복 체크실행하고 인증번호전송하게만듬
	    $("#phoneNumberMsg").click(function(){
	    	memberPhone=$("#member_phone").val();
	    	phone_check();
	    });
    	//핸드폰번호 중복체크
    	function phone_check(){
    		memberPhone=$("#member_phone").val();
    		$.ajax({
    			type:"GET",
    			url:"/member/phoneCheck",
    			data:{member_phone:memberPhone},
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
    		memberPhone=$("#member_phone").val();;
	    	//핸드폰 인증번호 발송
	    	  $.ajax({
    	          type: "GET",
    	          url: "/member/phoneNumberMsg",
    	          data: { member_phone: memberPhone },
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
    		}else{
    			$("#phoneNumberCheck").text("인증번호가 틀립니다");
    		}		
    	});
	//회원가입버튼
    $("#join").click(function(){
        if(!chkData("#member_id","아이디를"))return;
        if(!idChkData("#member_id")){
        	alert("아이디를 확인해주세요");
        	return;
        }
        if(!chkData("#member_pw","비빌번호를"))return;
        if(!chkData("#member_nickname","닉네임을"))return;
        if(!chkData("#email_front","이메일을"))return;
        if(!chkData("#email_back","이메일을"))return;
        else{//이메일칸 입력되있으면 이메일값 앞뒤합쳐서 전송하려고 준비하는 함수
       	   emailFront = $("#email_front").val();
           emailBack = $("#email_back").val();
           memberEmail = emailFront + "@" + emailBack;   
            $("#member_email").attr({"value": memberEmail});
      }
        if(emailRandomNumberCheck==0){
        	alert("이메일을 인증하지 않았습니다");
        	return;
        }         
        if(!chkData("#member_addr","주소를"))return;
        if(!chkData("#member_phone","핸드폰 번호를"))return;
        if(phoneRandomNumberCheck==0){
        	alert("핸드폰 번호를 인증하지 않았습니다");
        	return;
        }
        else{
            $(".memberjoin").attr({
                "method":"post",
                "action":"/member/memberJoin"
            });
            $(".memberjoin").submit();
        }
    });
    //
    
    //로그인 버튼 클릭 시 특정 펭
    $("#loginFormMove").click(function () {
        window.location.href = "/member/loginForm"; // 로그인 페이지 URL로 변경
    });

    // 회원가입 버튼 클릭 시 특정 페이지로 이동
    $("#joinPageMove").click(function () {
        window.location.href = "/member/memberJoinForm"; // 회원가입 페이지 URL로 변경
    });
   
    //이메일중복 확인
    function email_check(){
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        memberEmail = emailFront + "@" + emailBack;   
    	$.ajax({
    		url:"/member/emailCheck",
    		type:"GET",
    		data:{member_email:memberEmail},
    		success:function(result){
    			if(result==1){//중복 이메일이 있을시
    				alert("중복된 이메일이 존재합니다");
    				return;
    			}else{
    				sendEmail();
    			}
    		}
    	})
    }		
	//이메일 인증번호 발송
    function sendEmail() {
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        memberEmail = emailFront + "@" + emailBack; 
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
        memberEmail = emailFront + "@" + emailBack;   
        email_check();//이메일중복있는지 사전체크
    });
  	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
	$("#email_check_btn").click(function(){
		if($("#email_check").val()==emailrandomNumber){
			$("#email_check_text").text("인증되었습니다");
			emailRandomNumberCheck=1;
		}else{
			$("#email_check_text").text("인증번호가 틀립니다");
		}		
	});
    
});//스크립트 함수 끝부분!!!!!!!!!
</script>
<!-- Container 시작 -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form class="memberjoin">

                <!-- ID 입력 -->
                <div class="form-group">
                    <label for="member_id">ID</label>
                    <input type="text" class="form-control" id="member_id" name="member_id" placeholder="ID" value="${param.member_id}">
                    <div id="idCheckResult" class="text-danger"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 --></div>
                </div>

                <!-- 비밀번호 입력 -->
                <div class="form-group">
                    <label for="member_pw">Password</label>
                    <input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password" value="${param.member_pw}">
                </div>

                <!-- 비밀번호 확인 -->
                <div class="form-group">
                    <label for="pw_checker">Password Confirm</label>
                    <input type="password" class="form-control" id="pw_checker" name="pw_checker" placeholder="Password Confirm">
                    <div id="pw_checkerResult" class="text-danger"><!--비밀번호 체크 확인결과 출력하는 메세지 넣을곳 --></div>
                </div>

                <!-- 이름 입력 -->
                <div class="form-group">
                    <label for="member_name">Name</label>
                    <input type="text" class="form-control" id="member_name" name="member_name" placeholder="Name" value="${param.member_name}">
                </div>

                <!-- 닉네임 입력 -->
                <div class="form-group">
                    <label for="member_nickname">Nickname</label>
                    <input type="text" class="form-control" id="member_nickname" name="member_nickname" placeholder="Nickname" value="${param.member_nickname}">
                    <div id="nickCheckResult" class="text-danger"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 --></div>
                </div>

                <!-- 이메일 입력 -->
                <div class="form-group">
                    <label>Email</label>
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
                    <div class="input-group mt-2">
                        <button type="button" id="email_Number_Btn" class="btn btn-primary">발송</button>
                    </div>
                    <div id="email_check_text" class="text-danger"><!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 --></div>
                </div>

                <!-- 주소 입력 -->
                <div class="form-group">
                    <label for="member_addr">Address</label>
                    <input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="Address" value="${param.member_addr}">
                </div>

                <!-- 핸드폰 입력 -->
                <div class="form-group">
                    <label for="member_phone">Phone Number</label>
                    <input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="Phone Number" value="${param.member_phone}">
                </div>

                <!-- 핸드폰 인증 -->
                <div class="form-group">
                    <button type="button" id="phoneNumberMsg" name="phoneNumberMsg" class="btn btn-primary">인증번호</button>
                    <input type="text" id="phone_number_check" class="form-control d-inline-block w-50" disabled="disabled" placeholder="인증번호 6자리를 입력해주세요!">
                    <button type="button" id="phone_number_check_btn" class="btn btn-primary">인증</button>
                    <div id="phoneNumberCheck" class="text-danger"><!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 --></div>
                </div>

                <!-- 회원가입 버튼 -->
                <div class="form-group">
                    <button id="join" class="btn btn-primary">가입하기</button>
                </div>

                <!-- 사업자 회원가입 링크 -->
                <div class="form-group">
                    <p>혹시 사업자 이신가요?</p>
                    <a href="/corp/corpJoinForm">사업자 회원가입</a>
                </div>

            </form>
        </div>
    </div>
</div>
<!-- Container 끝 -->