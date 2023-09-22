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
 	    
		 $("#loginPageMove").click(function () {	
		    	console.log("입력");
		        $.ajax({
		            url: "/member/loginForm", // 로그아웃 컨트롤러의 URL
		            type: "get",
		            success: function(data) {
		               window.location.href = "/member/loginForm"; // 로그아웃 후 로그인 화면으로 이동
		              
		            },
		            error: function() {
		                alert("이동 실패");
		            }
		        });
		 });	
		
	<%-- 	  //회원 데이터 삭제
		$("member_data_delete").click(function(){
			console.log("클릭됨");
			 var result = confirm('정말 삭제하시겠습니까?');
			 if(result){
			$.ajax({
				url:"/member/member_data_delete",
				type:"post",
				data: {
				    member_id: '<%= member.getMember_id() %>',
				    member_pw: '<%= member.getMember_pw() %>'
				},success:function(result){
					alert("회원이 탈퇴되었습니다");
					window.location.href="/member/loginForm";
							}
						})
					}
				}); 
		 --%>
		 $("#member_data_delete").click(function(){
			 console.log("클릭");
			 var result=confirm("정말 삭제하시겠습니까?");
		 });
	});//끝!
		</script>
<title>Insert title here</title>
</head>
<body>
<form id="form">
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
<button type="button" id="loginPageMove" name="loginPageMove">로그인 이동</button>
<button id="member_data_delete">회원탈퇴</button>
</form>
</body>
</html>