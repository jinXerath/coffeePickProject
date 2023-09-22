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
      	  var emailFront;//이메일 앞부분
          var emailBack;//이메일 뒷부분
          var Email; //이메일 앞+@+뒷부분 합치는 변수
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
	//이메일 인증번호 발송
    $("#email_Number_Btn").click(function(e){
        e.preventDefault(); // 폼의 기본 동작을 막습니다.
        // 이메일 값을 가져와서 변수에 저장합니다.
        emailFront = $("#email_front").val();
        emailBack = $("#email_back").val();
        Email = emailFront + "@" + emailBack;   
	   // AJAX 요청을 보냅니다.
        $.ajax({
            type: 'post',
            url: '/corp/mail',
            data: { corpEmail: Email }, // 이메일 값을 서버로 전달합니다.
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
			$.ajax({
				type:"GET",
				url:"/corp/corpIdFind_email",
				data:{corp_email:Email},	
				success:function(result){
					if(result!=""){
						alert("아이디는["+result+"]입니다")
						$("#email_check_text").text("아이디는["+result+"]입니다");
					}
					if(result==""){
						alert("아이디가 없습니다.")
						$("#email_check_text").text("아이디가 없습니다.");
					}
				}
			
			})
		}else{			
			$("#email_check_text").text("인증번호가 틀립니다");
			alert("인증번호가 틀립니다.")
		}		
	});
    
});//스크립트 함수 끝부분!!!!!!!!!
</script>	
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		
<title>Insert title here</title>
</head>
<body>
  <form id="exform">
  	<input type="hidden" value="" id="_email" name="_email">  
     <br/>
 	<p>사업자 아이디찾기 이메일</p><br/>
  	<label>이메일</label> <input type='text' id="email_front"name="email_front" value="${param.email_front}">@
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
 	<label>이메일 인증번호</label><input type="text" id="email_check" name="email_check" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
 	<!--disable은 비활성화 활성화시키려면 보통 속성을 제거한다 -->
 	<button type="button" id="email_check_btn">인증</button>
 	<div id="email_check_text">
    <!--핸드폰 인증메세지 확인결과 출력하는 메세지 넣을곳 -->
     </div>
 		<br/>
    </form>
</body>
</html>