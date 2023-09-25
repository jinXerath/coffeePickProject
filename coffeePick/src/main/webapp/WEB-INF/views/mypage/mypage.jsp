<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cp.user.member.vo.MemberVO"%>
<%@ page import="com.cp.user.corp.vo.CorpVO"%>

<%
// 세션에서 로그인된 사용자 정보 가져오기
MemberVO member = (MemberVO) session.getAttribute("member");
    CorpVO corp = (CorpVO) session.getAttribute("corp");
%>
<script>
      $(function(){
         
       
              
              $("#pointHistory").click(function(){
                 window.location.href= "/point/history";
              });
           
             $("#loginPageMove").click(function () {
                  window.location.href = "/member/loginForm"; // 로그인 페이지 URL로 변경
              });                   
             //회원 데이터 삭제
            $("#member_data_delete").click(function(){
               console.log("클릭됨");
                var result = confirm('회원탈퇴 후 동일 아이디,이메일,핸드폰번호로 재가입이 불가능합니다,삭제하시겟습니까?');
                if(result){
                  window.location.href="/member/userDeleteCheck";
                     }
                  });       
               //회원 정보 수정 버튼
              $(document).ready(function() {
                    $("#user_data_update").click(function() {
                        <%-- 세션에 있는 객체가 member인지 corp인지 확인하고 처리 --%>
                        <c:choose>
                            <c:when test="${not empty member}">
                                window.location.href="/member/memberDataUpdatePage";
                            </c:when>
                            <c:when test="${not empty corp}">
                                window.location.href="/corp/corpDataUpdatePage";
                            </c:when>
                            <c:otherwise>
                                alert("세션에 로그인 정보가 없습니다.");
                            </c:otherwise>
                        </c:choose>
                    });
                });     
            });//스크립트 끝부분
            
      </script>

<style>
.content-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 65vh;
	flex-direction: column;
	text-align: center;
}

.btns {
	display: inline-block;
}

.data-container {
	margin-bottom: 1rem;
}

.btn-group>.btn {
	margin: 0.5rem; /* 원하는 간격 값으로 조절 */
}
</style>

<div class="content-container">
	<div class="logo-box mb-4">
		<h1 class="logo-name">CoffeePick</h1>
	</div>

	<c:choose>
		<c:when test="${not empty member}">
			<div class="data-container">
				<p class="fw-bold">아이디 : ${member.member_id}</p>
				<p class="fw-bold">이름 : ${member.member_name}</p>
				<p class="fw-bold">닉네임 : ${member.member_nickname}</p>
				<p class="fw-bold">이메일 : ${member.member_email}</p>
				<p class="fw-bold">핸드폰 번호 : ${member.member_phone}</p>
				<p class="fw-bold">가입날짜 : ${member.member_regdate}</p>
			</div>

		</c:when>
		<c:when test="${not empty corp}">
			<div class="data-container">
				<h1 class="fw-bold">${corp.corp_name}님환영합니다.</h1>
				<p class="fw-bold">아이디 : ${corp.corp_id}</p>
				<p class="fw-bold">이름 : ${corp.corp_name}</p>
				<p class="fw-bold">이메일 : ${corp.corp_email}</p>
				<p class="fw-bold">주소 : ${corp.corp_addr}</p>
				<p class="fw-bold">핸드폰 번호 : ${corp.corp_phone}</p>
				<p class="fw-bold">가입날짜 : ${corp.corp_regdate}</p>
			</div>
		</c:when>
		<c:otherwise>
			<h3>데이터가 없습니다.</h3>
		</c:otherwise>
	</c:choose>


	<div class="btns">
		<button type="button" class="btn btn-primary" class="logout"
			name="logout">로그아웃</button>
		<button type="button" class="btn btn-primary" id="member_data_delete"
			name="member_data_delete">회원 탈퇴</button>
		<button type="button" class="btn btn-primary" id="user_data_update"
			name="user_data_update">회원 정보 수정</button>
		<c:choose>
			<c:when test="${not empty member}">
				<button type="button" class="btn btn-primary" id="pointHistory"
					name="pointHistory">포인트 내역조회</button>
				<br />
				<br />
				<%@ include file="/WEB-INF/views/mypage/pickmoneyCharge.jsp"%>
			</c:when>
		</c:choose>


	</div>
</div>
