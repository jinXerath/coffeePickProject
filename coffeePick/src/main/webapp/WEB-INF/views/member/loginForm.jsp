<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
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

