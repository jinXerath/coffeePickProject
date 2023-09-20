<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.cp.user.member.vo.MemberVO" %>

    
    <%
// 세션에서 로그인된 사용자 정보 가져오기
MemberVO member = (MemberVO) session.getAttribute("member");
%>
    
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
    		var member_id = "<%= member.getMember_id() %>";
			var member_name = "<%= member.getMember_name() %>";
			var member_nickname = "<%= member.getMember_nickname() %>";;
			var member_email="<%= member.getMember_email() %>";;
			var member_addr = "<%= member.getMember_addr() %>";;
			var member_phone = "<%= member.getMember_phone() %>";;	
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
                data: { member_nickname:$("#new_member_nickname").val()},
                success: function (result) {
                    if (result == 0) {
                    	console.log("성공후alert뜨기전"+member_nickname);
                        alert("사용 가능한 닉네임입니다.");
                        member_nickname=$("#new_member_nickname").val();
                    	console.log("성공후alert뜨기후"+member_nickname);
                    } else {
                    	 alert("중복된 닉네임입니다.");
                    	 member_nickname = "<%= member.getMember_nickname() %>";
                    	 console.log("닉네임중복있음"+member_nickname);                   	 
                    }                 
                },
                error: function () {
                   	alert("서버 오류가 발생하였습니다.");
                }
            });
        }
	
       //변경할 닉네임 중복 확인
  		$("#nickNameCheck_btn").click(function(){
  			nickNameCheck();
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
    			url:"/member/phone_check",
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
    			alert("인증되었습니다");
    			member_phone=$("#new_member_phone").val();
    			console.log("핸드폰인증"+member_phone);
    		}else{
    			alert("인증번호가 틀립니다.");
    		}		
    	});

  
    //이메일중복 확인
    function email_check(){
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        memberEmail = emailFront + "@" + emailBack;   
    	$.ajax({
    		url:"/member/email_check",
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

  	
	//로그아웃함수
	function logout(){
        $.ajax({
            url: "/member/logout", // 로그아웃 컨트롤러의 URL
            type: "get",
            success: function(data) {
                // 로그아웃이 성공했을 때 실행할 코드
                // 예를 들어, 로그아웃 성공 메시지를 표시하거나 다른 작업을 수행할 수 있습니다
                alert("로그아웃 되었습니다.");
               // location.reload(); // 페이지를 새로고침
                window.location.href = "/member/loginForm"; // 로그아웃 후 로그인 화면으로 이동
              
            },
            error: function() {
                alert("로그아웃 실패");
            }
        });		    
		}
  	
  	//회원정보 수정버튼
	$("#next").click(function(){
		member_name=$("#member_name").val();
		member_nickname=$("#member_nickname").val();
		member_addr=$("#member_addr").val();		
		$.ajax({
			url:"/member/member_data_update",
			type:"GET",
			data:{member_id:member_id,
				member_name:member_name,
				member_nickname:member_nickname,				
				member_email:member_email,
				member_addr:member_addr,
				member_phone:member_phone},
				success:function(result){
					if(result==1){
					alert("회원정보 변경에 성공하였습니다");
					logout();
					window.location.href="/member/loginForm";
					}
					if(result==0){
					alert("회원정보 변경에 실패하였습니다.");
					
					}
				},error:function(error){
					alert("에러가 발생하였습니다");
				}
		});
	})
  	
  	
});//스크립트 함수 끝부분!!!!!!!!!
</script>		
<title>Insert title here</title>
</head>
<body>
<p>멤버수정페이지</p>
<form id="form">
   <label>아이디 : </label><input type="text" id="member_id" name="member_id" value="<%= member.getMember_id() %>"disabled="true"><br/>
   <label>이름 : </label><input type="text" id="member_name" name="member_name" value="<%= member.getMember_name() %>"><br/>
   <label>닉네임</label><input type="text" id="member_nickname" name="member_nickname" value="<%= member.getMember_nickname() %>"><br/>
   <label>변경할 닉네임</label><input type="text" id="new_member_nickname" name="new_member_nickname">
   <button type="button" id="nickNameCheck_btn">닉네임 중복 확인</button>
   <br/>
   <label>주소</label><input type="text" id="member_addr" name="member_addr" value="<%= member.getMember_addr() %>"><br/>
   <label>전화번호</label><input type="text" id="member_phone" name="member_phone" value="<%= member.getMember_phone() %>" disabled="true"><br/>
   <label>변경할 전화번호</label><input type="text" id="new_member_phone" name="new_member_phone">
   <button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호 발송</button> 
   <br/>
<label>핸드폰 인증번호</label><input type="text" id="phone_number_check">
  <button type="button" id="phone_number_check_btn">확인</button><br/>
   <label>이메일</label><input type="text" id="member_email" name="member_email" value="<%= member.getMember_email() %>" disabled="true"><br/>
   <label>변경할 이메일</label>
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
       <button type="button" id="email_Number_Btn">인증번호 발송</button>
        	  <br/>
 이메일 인증번호<input type="text" id="email_check" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
  	<button type="button" id="email_check_btn">확인</button>
   <h3>${member.getMember_name()}님 환영합니다.</h3><br/>
   <h3>이메일은${member.getMember_email()} 입니다.</h3><br/>
   <h3>닉네임은${member.getMember_nickname()} 입니다.</h3><br/>
   <button type="button" id="next" name="next">변경하기</button>



</form>
</body>
</html>