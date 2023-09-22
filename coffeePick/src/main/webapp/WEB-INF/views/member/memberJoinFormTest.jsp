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
        <link href="/resources/include/css/styles.css" rel="stylesheet" />      
        
  
        <style type="text/css">

div,sub,p,h1{
    padding: 0;
    margin: 0;
}
nav{
    height: 50px;
    background-color: red;

}

.container{
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
}
.memberjoin{
    text-align: center;
}

</style>
        
    
    <script>    
    $(function () {
       // 닉네임 중복 체크,
        function nickNameCheck() {
            var memberNick = $("#member_nick").val();

            $.ajax({
                type: "GET",
                url: "/member/nick_check",
                data: { member_nick: memberNick },
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

        // 닉네임 중복 체크,
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
  		function pwdCheck(){
  			if($("#member_pwd").val() !== $("#pwd_checker").val()) {
  		       $("#pwd_checkerResult").text("비밀번호가 같지않습니다");
  		     $("#join").prop("disabled", true);//회원가입 버튼 비활성화
  		    }
  			if($("#member_pwd").val() == $("#pwd_checker").val()) {
   		       $("#pwd_checkerResult").text("비밀번호가 확인되었습니다");
   		    $("#join").prop("disabled", false);// 회원가입 버튼활성화
   		    }
   			
        }
        
  	   // 포커스 아웃 이벤트 처리
        $("#pwd_checker").focusout(function () {
        	pwdCheck();
        });

        // keyup 이벤트 처리
        $("#pwd_checker").keyup(function () {
        	pwdCheck();
        });
        // 포커스 아웃 이벤트 처리
        $("#member_nick").focusout(function () {
            nickNameCheck();
        });

        // keyup 이벤트 처리
        $("#member_nick").keyup(function () {
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
	
       
    	
    	
    $("#join").click(function(){
        if(!chkData("#member_id","아이디를"))return;
        if(!chkData("#member_pwd","비빌번호를"))return;
        if(!chkData("#member_nick","닉네임을"))return;
        if(!chkData("#member_email","이메일을"))return;
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
});
    

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
                        <button class="btn btn-outline-dark" type="button">로그인</button>
                        <button class="btn btn-outline-dark" type="button">회원가입</button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Body-->
         <div class="container">
    <form class="memberjoin">
      
   id    <input type="text" id="member_id" name="member_id" placeholder="ID" value="${param.member_id}"/>
  			 <div id="idCheckResult"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 -->
       
       		</div>
        <br/>
  pw      <input type="password" id="member_pwd" name="member_pwd" placeholder="비밀번호" value="${param.member_pwd}"/>
        <br/>
        비밀번호 확인: <input type="password" id="pwd_checker" name="pwd_checker" placeholder="비밀번호 확인">
        <div id="pwd_checkerResult"><!--비밀번호 체크 확인결과 출력하는 메세지 넣을곳 -->
        
        </div>
        <br/>
  이름    <input type="text" id="member_name" name="member_name" placeholder="성함" value="${param.member_name}"/>
        <br/>
   닉네임    <input type="text" id="member_nick" name="member_nick" placeholder="닉네임" value="${param.member_nick}"/>
   
      
       <div id="nickCheckResult"><!--닉네임 중복 확인결과 출력하는 메세지 넣을곳 -->
       
       </div>
        <br/>
 이메일       <input type="text" id="member_email" name="member_email" placeholder="이메일" value="${param.member_email}"/>
        <div><sub>이 주소로 이메일이 발송되어 회원가입을 인증하게 됩니다</sub></div>
        <br/>
   주소    <input type="text" id="member_addr" name="member_addr" placeholder="주소" value="${param.member_addr}"/>
        <br/>
  핸드폰    <input type="text" id="member_phone" name="member_phone" placeholder="핸드폰 번호" value="${param.member_phone}"/>
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
