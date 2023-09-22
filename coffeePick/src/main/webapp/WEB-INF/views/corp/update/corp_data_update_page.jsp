<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%@ page import="com.cp.user.corp.vo.CorpVO" %>
    
    <%
// 세션에서 로그인된 사용자 정보 가져오기
    CorpVO corp = (CorpVO) session.getAttribute("corp");
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
    		var corp_id = "<%= corp.getCorp_id() %>";
			var corp_name = "<%= corp.getCorp_name() %>";
			var corp_email="<%= corp.getCorp_email() %>";;
			var corp_addr = "<%= corp.getCorp_addr() %>";;
			var corp_phone = "<%= corp.getCorp_phone() %>";;	
			var corp_registration_number="<%= corp.getCorp_registration_number()%>";
      	  var emailFront;//이메일 앞부분
          var emailBack;//이메일 뒷부분
          var corpEmail; //이메일 앞+@+뒷부분 합치는 변수
          var emailrandomNumber;//이메일인증번호 저장변수

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
	    	corpPhone=$("#corp_phone").val();
	    	phone_check();
	    });
    	//핸드폰번호 중복체크
    	function phone_check(){
    		corpPhone=$("#corp_phone").val();
    		$.ajax({
    			type:"GET",
    			url:"/corp/phone_check",
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
    			corp_phone=$("#new_corp_phone").val();
    			console.log("핸드폰인증"+corp_phone);
    		}else{
    			alert("인증번호가 틀립니다.");
    		}		
    	});
	//이메일 인증번호 발송
    $("#email_Number_Btn").click(function(e){
        e.preventDefault(); // 폼의 기본 동작을 막습니다.
        // 이메일 값을 가져와서 변수에 저장합니다.
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        corpEmail = emailFront + "@" + emailBack;   
		email_check();
    });
	 //이메일중복 확인
    function email_check(){
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        corpEmail = emailFront + "@" + emailBack;   
    	$.ajax({
    		url:"/corp/email_check",
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
	
	
  	//인증번호 확인버튼 누르면 인증번호 맞는지 확인
	$("#email_check_btn").click(function(){
		if($("#email_check").val()==emailrandomNumber){
			alert("인증되었습니다");
			corp_email=corpEmail;
			console.log(corp_email);
		}else{
			alert("인증번호가 틀립니다.");
		}		
	});
    
  	//회원정보 수정버튼
	$("#next").click(function(){
		corp_name=$("#corp_name").val();
		corp_nickname=$("#corp_nickname").val();
		corp_addr=$("#corp_addr").val();		
		corp_registration_number=$("#corp_registration_number").val();
		$.ajax({
			url:"/corp/corp_data_update",
			type:"GET",
			data:{corp_id:corp_id,
				corp_name:corp_name,
				corp_registration_number:corp_registration_number,				
				corp_email:corp_email,
				corp_addr:corp_addr,
				corp_phone:corp_phone},
				success:function(result){
					if(result==1){
					alert("회원정보 변경에 성공하였습니다");
					logout();
					window.location.href="/corp/loginForm";
					}
					if(result==0){
					alert("회원정보 변경에 실패하였습니다.");
					
					}
				},error:function(error){
					alert("에러가 발생하였습니다");
				}
		});
	})
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
  	
});//스크립트 함수 끝부분!!!!!!!!!
</script>		
<title>Insert title here</title>
</head>
<body>
<p>코프수정페이지</p>
<form id="form">
   <label>아이디 : </label><input type="text" id="corp_id" name="corp_id" value="<%= corp.getCorp_id() %>"disabled="true"><br/>
   <label>이름 : </label><input type="text" id="corp_name" name="corp_name" value="<%= corp.getCorp_name() %>"><br/>
   <label>주소</label><input type="text" id="corp_addr" name="corp_addr" value="<%= corp.getCorp_addr() %>"><br/>
   <label>전화번호</label><input type="text" id="corp_phone" name="corp_phone" value="<%= corp.getCorp_phone() %>" disabled="true"><br/>
   <label>변경할 전화번호</label><input type="text" id="new_corp_phone" name="new_corp_phone">
   <button type="button" id="phoneNumberMsg" name="phoneNumberMsg">인증번호 발송</button> 
   <br/>
<label>핸드폰 인증번호</label><input type="text" id="phone_number_check">
  <button type="button" id="phone_number_check_btn">확인</button><br/>
   <label>이메일</label><input type="text" id="corp_email" name="corp_email" value="<%= corp.getCorp_email() %>" disabled="true"><br/>
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
  	<button type="button" id="email_check_btn">확인</button><br/>
   <label>사업자 등록번호</label>
   <input type='text' id="corp_registration_number" name="corp_registration_number" value="<%= corp.getCorp_registration_number()%>"><br/>
   <h3>${corp.getCorp_name()}님 환영합니다.</h3><br/>
   <h3>이메일은${corp.getCorp_email()} 입니다.</h3><br/>

   <button type="button" id="next" name="next">변경하기</button>



</form>
</body>
</html>