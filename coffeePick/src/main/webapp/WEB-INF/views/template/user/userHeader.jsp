<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

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
                            <li><a class="dropdown-item" href="/menu/list">주문하기</a></li>
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
                            <li><a class="dropdown-item" href="#!">이벤트</a></li>
                            <li><a class="dropdown-item" href="#!">공지사항</a></li>
                            <li><a class="dropdown-item" href="/board/memberQna/memberQnaList">상담/문의 (개인)</a></li>
                            <li><a class="dropdown-item" href="/board/corpQna/cropQnaList">상담/문의 (매장)</a></li>
                        </ul>
                    </li>
                      <li class="nav-item"><a class="nav-link" href="/member/mypage">마이페이지</a></li>
                </ul>
            </div>
            <div class="navbar align-self-center d-flex justify-content-end">
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                </a>
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-user text-dark mr-3"></i>
                </a>
                <c:if test="${not empty corp}">
	                <div>
	            		<div class="small">${corp.corp_id} 님 환영합니다.</div>
	            		<div class="small">
	            			<input type="button" id="logoutBtn" value="로그아웃">
	            		</div>
	        		</div>
        		</c:if>
        		<c:if test="${not empty member}">
	                <div class="sb-sidenav-footer">
	            		<div class="small">Logged in as:</div>
	            			${member.member_nickname}
	        		</div>
        		</c:if>
            </div>
        </div>
    </div>
</nav>
                 