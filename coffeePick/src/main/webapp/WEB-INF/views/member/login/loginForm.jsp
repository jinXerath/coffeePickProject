<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%@ page import="com.cp.user.member.vo.MemberVO" %>
<%@ page import="com.cp.user.corp.vo.CorpVO" %>
    
    <%
// 세션에서 로그인된 사용자 정보 가져오기
MemberVO member = (MemberVO) session.getAttribute("member");
    CorpVO corp = (CorpVO) session.getAttribute("corp");
%>
	<link rel="stylesheet" href="../resources/include/css/login.css">
    <script type="text/javascript">
    
    
    
    $(function(){
     	 var userLogin=1;
    	 var errorMessage = "${errorMessage}"; // errorMessage를 가져와서 JavaScript 변수에 할당
    	 var loginfail="${loginfail}";
    	 if(loginfail!=""){
    		 alert("아이디 혹은 비밀번호가 틀립니다.");
    	 }
 	    if (errorMessage && errorMessage !== "") { // 에러 메시지가 비어있지 않다면
 	        alert(errorMessage); // alert를 띄움
 	    }
    	
 	   $("#memberLogin").click(function() {
 		    userLogin = 1;
 		    console.log(userLogin);
 		    $("#corpLogin").css("background-color", "darkgray"); // 여기서 whine가 아닌 #f8f9fa로 수정
 		    $("#memberLogin").css("background-color", "white"); // 여기서 whine가 아닌 white로 수정
 		});
 		// 사업자 로그인 클릭 시
 		$("#corpLogin").click(function() {
 		    userLogin = 2;
 		    console.log(userLogin);
 		    $("#memberLogin").css("background-color", "darkgray"); // 여기서 whine가 아닌 #f8f9fa로 수정
 		    $("#corpLogin").css("background-color", "white"); // 여기서 whine가 아닌 white로 수정
 		});
 	    
      /*   $("#login").click(function(){
            if(!chkData("#id","아이디를"))return;
            if(!chkData("#pw","비빌번호를"))return;
            else{
                $(".login_form").attr({
                    "method":"post",
                    "action":"/member/login"
                });
                $(".login_form").submit();
            }
        }); */
        
        $("#login").click(function(){
            if(!chkData("#id","아이디를"))return;
            if(!chkData("#pw","비빌번호를"))return;
            if(userLogin==1){
             $(".login_form").attr({
                    "method":"post",
                    "action":"/member/login"
                });
                $(".login_form").submit();
            }
            if(userLogin==2){
                $(".login_form").attr({
                       "method":"post",
                       "action":"/corp/login"
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
    
    


        <div class="content">
        	<div class="logo_box">
         		<h1 class="logo_name">CoffeePick</h1>
         	</div>
            <form class="login_form">
                <div class="login_change" style="text-align: center;    margin: auto;
                display: table;">
                	<ul class="menu_wrap">
                   <!--  	<li style="background-color: #fff;"><a href="#" id="memberLogin">사용자 로그인</a></li>
                    	<li><a href="#" id="corpLogin">사업자 로그인</a></li> -->
                    	<button type="button" class="btn" id="memberLogin">사용자 로그인</button>
                    	<button type="button" class="btn" id="corpLogin">사업자 로그인</button>                    	
                	</ul>
            	</div>
                <!-- <div class="panel_inner"> -->
                    
                <div class="id_pw_block">
                    <input type="text" id="id" name="id" placeholder="아이디"
                     	title="아이디" class="input_text" maxlength="41" value=""
                     	style="  border-collapse: collapse ; margin-bottom: 20px">
                    
                     <input type="password" id="pw" name="pw" 
                     	placeholder="비밀번호" title="비밀번호"
                     	autocomplete="off"
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
               	<li><a href="/member/dataIdFind">아이디 찾기</a></li>
                <li><a href="/member/dataPwFind">비밀번호 찾기</a></li>          
                <li><a href="/member/memberJoinForm">회원가입</a></li>
            </ul>
        </div>
	
