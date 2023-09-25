<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%@ include file="/WEB-INF/views/common/alertModal.jsp"%>

	 
    

<script>
$(function(){
	let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			MsgBox.Alert(errorMsg);
			errorMsg = "";
		}

	$("#logout").click(function(){
		logout();
	})
	$("#loginPageBtn").click(function(){
		login();
	})
	function logout(){
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
	 }
	 
	 function login(){
		 window.location.href="/member/loginForm";
	 }
	 
});

</script>
<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="/">
            Coffee Pick
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">개인서비스</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/order/storeList">주문하기</a></li>
                            <li><a class="dropdown-item" href="/order/orderHistory">주문내역</a></li>
                            <li><a class="dropdown-item" href="/cart/list">장바구니</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/store/storeInfoRead">매장서비스</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/board/event/evnetList">이벤트</a></li>
                            <li><a class="dropdown-item" href="/board/notice/noticeList">공지사항</a></li>
                            <li><a class="dropdown-item" href="/board/memberQna/memberQnaList">상담/문의 (개인)</a></li>
                            <li><a class="dropdown-item" href="/board/corpQna/corpQnaList">상담/문의 (매장)</a></li>
                        </ul>
                    </li>
                      <li class="nav-item"><a class="nav-link" href="/member/mypage">마이페이지</a></li>
                </ul>
            </div>
           <div class="navbar align-self-center d-flex justify-content-end">
				<a class="nav-icon position-relative text-decoration-none" href="/cart/list">
					<i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span
					class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
				</a>
				<c:if test="${not empty corp}">
					<div>
						<div class="small">${corp.corp_id}님환영합니다.</div>
						<div class="small">
							<input type="button" id="logout" value="로그아웃">
						</div>
					</div>
				</c:if>
				<c:if test="${not empty member}">
					<div>
						<div class="small"
							style="display: inline-block; font-family: 'Arial', sans-serif; font-size: 16px; color: #333;">
							Hello , ${member.member_nickname}</div>
						<div class="small"
							style="display: inline-block; margin-left: 10px;">
							<button type="button" id="logout" class="btn btn-light">
								<i class="fa-solid fa-door-open"></i>로그아웃
							</button>
						</div>
					</div>

				</c:if>
				<c:if test="${empty member && empty corp}">
					
						<a class="nav-icon position-relative text-decoration-none"
							href="/member/loginForm"> <i
							class="fa fa-fw fa-user text-dark mr-3"></i>
						</a>
					
				</c:if>

			</div>
        </div>
    </div>
</nav>
 
 
