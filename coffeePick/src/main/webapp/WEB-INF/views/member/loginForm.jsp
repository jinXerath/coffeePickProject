<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 지훈이  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../resources/include/css/login.css">
    <meta charset="UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<script type="text/javascript" src="/resources/dist/js/jquery-3.7.0.min.js"></script>		
	<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/include/css/styles.css" rel="stylesheet" />      
        
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
    
    
    
    $(function(){
     
    	 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
    	 var loginfail="${loginfail}";
    	 if(loginfail!=""){
    		 alert("아이디 혹은 비밀번호가 틀립니다.");
    	 }
 	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
 	        alert(errorMessage); // alert를 띄움
 	    }
    	
        $("#login").click(function(){
            if(!chkData("#id","아이디를"))return;
            if(!chkData("#pw","비빌번호를"))return;
            else{
                $(".login_form").attr({
                    "method":"post",
                    "action":"/member/login"
                });
                $(".login_form").submit();
            }
        });
      
        $("#loginPageMove").click(function () {
            window.location.href = "/member/loginForm"; // 로그인 페이지 URL로 변경
        });

        // 회원가입 버튼 클릭 시 특정 페이지로 이동
        $("#joinPageMove").click(function () {
            window.location.href = "/member/memberJoinForm"; // 회원가입 페이지 URL로 변경
        });
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
                        <button class="btn btn-outline-dark" type="button" id="loginPageMove">로그인</button>
                        <button class="btn btn-outline-dark" type="button" id="joinPageMove">회원가입</button>
                    </form>
                </div>
            </div>
        </nav>

        <div class="content">
        <div class="logo_box">
         <h1 class="logo_name">CoffeePick</h1>
         </div>
            <form class="login_form">
                <div class="login_change" style="text-align: center;    margin: auto;
                display: table;">
                <ul class="menu_wrap">
                    <li style="background-color: #fff;"><a href="#">사용자 로그인</a></li>
                    <li><a href="#">사업자 로그인</a></li>
                
                </ul>
            </div>
                <!-- <div class="panel_inner"> -->
                    
                    <div class="id_pw_block">
                    <input type="text" id="id" name="id" placeholder="아이디"
                     title="아이디" class="input_text" maxlength="41" value=""
                     style="  border-collapse: collapse ; margin-bottom: 20px">
                    
                     <input type="password" id="pw" name="pw" 
                     placeholder="비밀번호" title="비밀번호"
                      class="input_text" maxlength="16"
                      style="  border-collapse: collapse ;">
                    </div>
              
                
                 <button type="submit" class="btn_login" id="login">
                    <span class="btn_text">로그인</span>
                </button>
            </form>
        </div>


        <div class="data_find_page_move">
            <ul class="search_id_pw">
               	<li><a href="/member/member_id_find">아이디 찾기</a></li>
                <li><a href="/member/member_pw_find">비밀번호 찾기</a></li>          
                <li><a href="/member/memberJoinForm">회원가입</a></li>
            </ul>
        </div>


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