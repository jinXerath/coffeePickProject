<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- 네비게이션 시작 -->

<div class="container px-4 px-lg-5">
	<a class="navbar-brand" href="/">CoffeePick</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">개인서비스</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="/menu/list">주문하기</a></li>
					<li><a class="dropdown-item" href="">주문내역</a></li>
					<li><a class="dropdown-item" href="/cart/list">장바구니</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="/store/storeInfoRead">매장서비스</a></li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">이벤트</a></li>
					<li><a class="dropdown-item" href="#!">공지사항</a></li>
					<li><a class="dropdown-item" href="#!">상담/문의</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
		</ul>
		<form class="d-flex">
			<button class="btn btn-outline-dark" type="submit">
				<i class="bi-cart-fill me-1"></i> Cart <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
			</button>
			<button class="btn btn-outline-dark" type="button">로그인</button>
			<button class="btn btn-outline-dark" type="button">회원가입</button>
		</form>
	</div>
</div>
<!--네비게이션 끝-->
