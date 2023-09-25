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
		   <link href="/resources/include/css/styles.css" rel="stylesheet" />     
	<script>
		$(function(){		
			 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
	    	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
	    	        alert(errorMessage); // alert를 띄움
	    	    }   
			
			 
	    	    var deleteTarget;
	    	    var member_id = '<%= (member != null) ? member.getMember_id() : "" %>';
	    	    var corp_id = '<%= (corp != null) ? corp.getCorp_id() : "" %>';

		$("#next").click(function(){
			console.log("버튼클릭");
			console.log(member_id);
			console.log(corp_id);
			  var pw = $("#pw").val(); //
			if(member_id!=""){
				$.ajax({
					url:"/member/memberPwCheck",
					type:"GET",
					data: { member_id: member_id, member_pw: pw },
					success:function(result){
						if(result==1){
						alert("성공");
						deleteTarget=1;//삭제하는 테이블함수 실행할 대상이이 member인지corp인지 구분하는 변수
					    $("#delete").prop("disabled", false); //삭제버튼 활성화
						}else{
							alert("비밀번호가 맞지않습니다");
						}						
					},error:function(){
						alert("에러가 발생했습니다.");
					}	
				});				
				}
			if(corp_id!=""){
				$.ajax({
					url:"/corp/corp_pw_check",
					type:"GET",
					data:{corp_id:corp_id,corp_pw:pw},
					success:function(result){
						if(result==1){
						alert("성공");
						deleteTarget=2;//삭제하는 테이블함수 실행할 대상이이 member인지corp인지 구분하는 변수
					    $("#delete").prop("disabled", false); //삭제버튼 활성화						
						}else{
							alert("비밀번호가 맞지않습니다");
						}						
					},error:function(){
						alert("에러가 발생했습니다.");
					}
				});
			}	
		})//버튼 클릭후 함수끝

		//최종삭제버튼실행
		$("#delete").click(function(){		
			var result=confirm("정말 회원탈퇴 하시겠습니까?");		
			if(result){//삭제확인			
				if(deleteTarget==1){//1이면 멤버삭제					
				member_delete();
				}
			 	if(deleteTarget==2){//2이면 corp삭제
				corp_delete();
				} 
			}		
		});//최종버튼 삭제끝부분
		
		//회원데이터삭제
		function member_delete(){	
			pw = $("#pw").val();//이부분 필수다,지우면안되
			$.ajax({
				url:"/member/memberDelete",
				type:"GET",
				data: { member_id: member_id, member_pw: pw },
				success:function(result){
					alert("회원탈퇴 하였습니다");
					logout();//자동로그아웃처리
					window.location.href="/member/loginForm";
				}
				
			});			
		}//회원데이터삭제끝부분
		
		//사업자 데이터삭제
		function corp_delete(){	
			pw = $("#pw").val();//이부분 필수다,지우면안되
			$.ajax({
				url:"/corp/corpDelete",
				type:"GET",
				data: { corp_id: corp_id, corp_pw: pw },
				success:function(result){
					alert("회원탈퇴 하였습니다");
					logout();//자동로그아웃처리
					window.location.href="/member/loginForm";
				}
				
			});			
		}//회원데이터삭제끝부분
		
		
		//회원탈퇴후 로그아웃처리하는함수
		function logout(){
	        $.ajax({
	            url: "/member/logout", // 로그아웃 컨트롤러의 URL
	            type: "get",
	            success: function(data) {
                alert("로그아웃 되었습니다.");           
	            },
	            error: function() {
	                alert("로그아웃 실패");
	            }
	        });
			}
		
		
	});
			
	</script>		
<title>Insert title here</title>
</head>
<body>
<style>
.middleBox{
 text-align: center; /* 폼을 수평으로 가운데 정렬합니다. */
  max-width: 400px; /* 폼의 최대 너비를 설정합니다. */
  margin: 0 auto; /* 가운데 정렬을 위한 자동 마진 설정합니다. */
  margin-top: 150px;
  }
  .btnx{
    display: flex; /* 버튼을 수평으로 배치합니다. */
  gap: 10px; /* 버튼 사이의 간격을 설정합니다. */
  
  }
  .btn.blue {box-shadow: 0px 4px #74a3b0;}
  
</style>

  
<!-- 지훈 -->
<form id="form">
<div class="middleBox">
<h2>비밀번호 확인</h2><br/>
	<label>pw</label><input type="password" id="pw" name="pw" placeholder="비밀번호"/>
 	<br/><br/>
 		<div class="btns">
 	<button type="button" id="next" class="btn btn-primary">확인</button>
 	<button type="button" id="delete" disabled="ture" class="btn btn-primary">삭제</button>
 		</div>
 	</div>
</form> 

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
</body>
</html>