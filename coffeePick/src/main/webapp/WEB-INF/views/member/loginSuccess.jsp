<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
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
		  
		/*     $("#logout").click(function(){
     			
	                $("#logout").attr({
	                    "method":"get",
	                    "action":"/member/logout"
	                });
	            
	            
	        });
		     */
		    
		    $("#loginPageMove").click(function () {
	            window.location.href = "/member/loginForm"; // 로그인 페이지 URL로 변경
	        });

		    
		});
		</script>
<title>Insert title here</title>
</head>
<body>
 <h1>로그인성공., <%= member.getMember_name() %>!</h1>
     <p>Your email is <%= member.getMember_email() %>.</p>
<br/>
 	  <c:if test="${not empty member }">
      	<h3>${member.getMember_name()}님 환영합니다.</h3><br/>
      	<h3>이메일은${member.getMember_email()} 입니다.</h3><br/>
      	<h3>닉네임은${member.getMember_nickname()} 입니다.</h3><br/>
      </c:if>

		<c:if test="${empty member}">
			<h3>${member.getMember_name()}님 환영합니다.</h3><br/>
			<h3>현재 로그아웃되어 있습니다</h3>	
		</c:if>
<button type="button" id="logout"name="logout">로그아웃버튼</button>
<button id="loginPageMove">로그인페이지 이동</button>
</body>
</html>