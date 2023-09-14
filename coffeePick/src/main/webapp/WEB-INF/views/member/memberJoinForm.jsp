<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
              <link rel="stylesheet" href="../css/member.css">
	<script type="text/javascript" src="/resources/dist/js/jquery-3.7.0.min.js"></script>		
	<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
      <!--   <link href="/resources/include/css/styles.css" rel="stylesheet" />      
         -->
  <link href="/resources/include/css/styles.css" rel="stylesheet" />      
        
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
          var memberEmail; //이메일 앞+@+뒷부분 합치는 변수
          var emailrandomNumber;//이메일인증번호 저장변수
          
       // 닉네임 중복 체크,
        function nickNameCheck() {
            var memberNick = $("#member_nickname").val();
           
            $.ajax({
                type: "GET",
                url: "/member/nick_check",
                data: { member_nickname: memberNick },
                success: function (result) {
                    if (result == 0) {
                        $("#nickCheckResult").text("사용 가능한 닉네임입니다.");
                        $("#join").prop("disabled", false);//회원가입 버튼 비활성화
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
                url: "/member/id_check",
                data: { member_id: memberID },
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
        //회원가입 버튼 활성화 함수
        function joinButtonStatus(){
        	   $("#join").prop("disabled", false);// 회원가입 버튼활성화
        }
        //비밀번호 중복확인함수
  		function pwCheck(){
  			if($("#member_pw").val() !== $("#pw_checker").val()) {
  		       $("#pw_checkerResult").text("비밀번호가 같지않습니다");
  		     $("#join").prop("disabled", true);//회원가입 버튼 비활성화
  		    }
  			if($("#member_pw").val() == $("#pw_checker").val()) {
   		       $("#pw_checkerResult").text("비밀번호가 확인되었습니다");
   		    $("#join").prop("disabled", false);// 회원가입 버튼활성화
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
        // 포커스 아웃 이벤트 처리
        $("#member_nickname").focusout(function () {
            nickNameCheck();
        });
        // keyup 이벤트 처리
        $("#member_nickname").keyup(function () {
            nickNameCheck();
        });
        // 포커스 아웃 이벤트 처리
        $("#member_id").focusout(function () {
        	idCheck();
        });
        // keyup 이벤트 처리
        $("#member_id").keyup(function () {
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
    		}else{
    			$("#phoneNumberCheck").text("인증번호가 틀립니다");
    		}		
    	});

    $("#join").click(function(){
        if(!chkData("#member_id","아이디를"))return;
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
        if(!chkData("#member_addr","주소를"))return;
        if(!chkData("#member_phone","핸드폰 번호를"))return;
      
        else{
            $(".memberjoin").attr({
                "method":"post",
                "action":"/member/memberjoin"
            });
            $(".memberjoin").submit();
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
   
		
	//이메일 인증번호 발송
    $("#email_Number_Btn").click(function(e){
        e.preventDefault(); // 폼의 기본 동작을 막습니다.
        // 이메일 값을 가져와서 변수에 저장합니다.
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
    });
  	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
	$("#email_check_btn").click(function(){
		if($("#email_check").val()==emailrandomNumber){
			$("#email_check_text").text("인증되었습니다");
		}else{
			$("#email_check_text").text("인증번호가 틀립니다");
		}		
	});
    
});//스크립트 함수 끝부분!!!!!!!!!
</script>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">CoffeePick</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">개인서비스</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">주문하기</a></li>
                                <li><a class="dropdown-item" href="#!">주문내역</a></li>
                                <li><a class="dropdown-item" href="#!">장바구니</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#!">매장서비스</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">이벤트</a></li>
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">상담/문의</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>                        
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                        <button class="btn btn-outline-dark" type="button" id="loginPageMove">로그인</button>
                        <button class="btn btn-outline-dark" type="button" id="joinPageMove">회원가입</button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Body-->
         <div class="container">
    <form class="memberjoin">     
<label>ID</label><input type="text" id="member_id" name="member_id" placeholder="ID" value="${param.member_id}"/>
  					 <div id="idCheckResult"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 -->
       
       				</div>
        		<br/>
<label>pw</label><input type="password" id="member_pw" name="member_pw" placeholder="비밀번호" value="${param.member_pw}"/>
        		<br/>
<label>비밀번호 확인</label><input type="password" id="pw_checker" name="pw_checker" placeholder="비밀번호 확인">
        			<div id="pw_checkerResult"><!--비밀번호 체크 확인결과 출력하는 메세지 넣을곳 -->
        
        			</div>
       			 <br/>     
<label>이름</label><input type="text" id="member_name" name="member_name" placeholder="성함" value="${param.member_name}"/>
        <br/>
<label>닉네임</label><input type="text" id="member_nickname" name="member_nickname" placeholder="닉네임" value="${param.member_nickname}"/>     
     				  <div id="nickCheckResult"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 -->
       
      				 </div>
      			  <br/>
<%--  이메일       <input type="text" id="member_email" name="member_email" placeholder="이메일" value="${param.member_email}"/>
  --%>    
  <input type="hidden" value="" id="member_email" name="member_email">
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
   주소    <input type="text" id="member_addr" name="member_addr" placeholder="주소" value="${param.member_addr}"/>
        <br/>
  핸드폰    <input type="text" id="member_phone" name="member_phone" placeholder="핸드폰 번호" value="${param.member_phone}"/>
      	<button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호</button> 
      	
        <br/>
  인증번호 확인      <input type="text" id="phone_number_check">
  <button type="button" id="phone_number_check_btn">확인하기</button>
         <div id="phoneNumberCheck">
       <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
       	</div>
 		<br/>
        <button id="join">가입하기</button>
        

    </form>
    </div>
        <section class="body">

        </section>

        <!-- Footer-->
        <footer class="py-5 bg-dark"style="position: fixed; bottom: 0;	width: 100%;">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>