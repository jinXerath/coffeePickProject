<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.cp.user.member.vo.MemberVO" %>
    <%@ page import="com.cp.user.corp.vo.CorpVO" %>
    
    <%
// 세션에서 로그인된 사용자 정보 가져오기
MemberVO member = (MemberVO) session.getAttribute("member");
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
	
			        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/include/css/styles.css" rel="stylesheet" />     
	
	
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<script>
		$(function(){
	 	    $("#logout").click(function(){
	 	    	 // location.reload(true);//새로고침
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
			    }); 
			    $("#loginPageMove").click(function () {
		            window.location.href = "/member/loginForm"; // 로그인 페이지 URL로 변경
		        });					    
				 //회원 데이터 삭제
				$("#member_data_delete").click(function(){
					console.log("클릭됨");
					 var result = confirm('회원탈퇴 후 동일 아이디,이메일,핸드폰번호로 재가입이 불가능합니다,삭제하시겟습니까?');
					 if(result){
						window.location.href="/member/user_delete_check";
							}
						}); 		
					//회원 정보 수정 버튼
				  $(document).ready(function() {
				        $("#user_data_update").click(function() {
				            <%-- 세션에 있는 객체가 member인지 corp인지 확인하고 처리 --%>
				            <c:choose>
				                <c:when test="${not empty member}">
				                    window.location.href="/member/member_data_update_page";
				                </c:when>
				                <c:when test="${not empty corp}">
				                    window.location.href="/corp/corp_data_update_page";
				                </c:when>
				                <c:otherwise>
				                    alert("세션에 로그인 정보가 없습니다.");
				                </c:otherwise>
				            </c:choose>
				        });
				    });	  
				});//스크립트 끝부분
				
		</script>
		
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		
<title>Insert title here</title>
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
<!-- 지훈코드 -->
<c:choose>
    <c:when test="${not empty member}">
        <!-- Member 정보 출력 -->
        <h1>로그인 성공!, <%= member.getMember_name() %>님 환영합니다.</h1>
        <p>Your email is <%= member.getMember_email() %>.</p>
        <h3>${member.getMember_name()}님 환영합니다.</h3><br/>
        <h3>이메일은${member.getMember_email()} 입니다.</h3><br/>
        <h3>닉네임은${member.getMember_nickname()} 입니다.</h3><br/>
    </c:when>
    <c:when test="${not empty corp}">
        <!-- Corp 정보 출력 -->
        <h1>로그인 성공!, <%= corp.getCorp_name() %>님 환영합니다.</h1>
        <p>Your email is <%= corp.getCorp_email() %>.</p>
        <!-- Corp의 다른 정보 출력 -->
        <!-- ... -->
    </c:when>
    <c:otherwise><!-- 조건에 해당되는 것이 없을시 c:otherwise출력 -->
        <!-- 세션이 없을 때 표시할 내용 -->
        <h3>데이터가 없습니다.</h3>
    </c:otherwise>
</c:choose>
<button type="button" id="logout"name="logout">로그아웃버튼</button>
<button type="button" id="member_data_delete" name="member_data_delete">회원 탈퇴</button>
<button type="button" id="user_data_update" name="user_data_update">회원 정보 수정</button>
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