<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메뉴 리스트 화면</title>
<!-- 헤더 푸터 부트스트랩 관련 링크-->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!--사이드바 부트스트랩 관련 링크-->
<link href="/resources/include/css/sidebars.css" rel="stylesheet">
<script type="text/javascript"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {
	  $('.menuDeleteBtn').click(function() {
	    var menu_no = $(this).siblings('input[name="menu_no"]').val();
	    
	    $.ajax({
	      type: "POST",
	      url: "/menuDelete",
	      data: {
	        menu_no: menu_no
	      },
	      success: function(response) {
	        if(response === 1) { // 여기에는 서버로부터의 응답을 처리하는 로직이 들어갑니다. 
	          alert('삭제 성공');
	          location.reload();
	        } else {
	          alert('삭제 실패');
	        }
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        alert('에러 발생 ' + textStatus + " " + errorThrown);
	      }
	    });
	  });
	  //메뉴 등록 버튼 제어
	  $("#menuInsert").click(function() {
		  location.href = '/menu/menuInsertForm?store_id=${param.store_id}';
		});
	  //메뉴 수정 버튼 제어
	  $("#menuUpdateBtn").click(function() {
		  location.href = '/menu/menuUpdateForm?store_id=${param.store_id}';
		});
});//end
</script>


</head>

<body>
	<!-- 네비게이션 시작 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">CoffeePick</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">개인서비스</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">주문하기</a></li>
							<li><a class="dropdown-item" href="#!">주문내역</a></li>
							<li><a class="dropdown-item" href="#!">장바구니</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#!">매장서비스</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">이벤트</a></li>
							<li><a class="dropdown-item" href="#!">공지사항</a></li>
							<li><a class="dropdown-item" href="#!">상담/문의</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
					<button class="btn btn-outline-dark" type="button">로그인</button>
					<button class="btn btn-outline-dark" type="button">회원가입</button>
				</form>
			</div>
		</div>
	</nav>
	<!--네비게이션 끝-->




	<!--사이드바+메뉴 리스트 묶어 줌-->
	<div class="d-flex">
		<!-- 사이드바 시작-->
		<div class="flex-shrink-0 p-3" style="width: 280;">
			<a href="/"
				class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
				<svg class="bi pe-none me-2" width="30" height="24">
          <use xlink:href="#bootstrap" />
        </svg> <span class="fs-5 fw-semibold">매장서비스</span>
			</a>
			<ul class="list-unstyled ps-0">
				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#4collapse"
						aria-expanded="true">매장정보관리</button>
					<div class="collapse" id="4collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보조회</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보등록</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#3collapse"
						aria-expanded="false">메뉴관리</button>
					<div class="collapse" id="3collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">메뉴조회</a></li>
						</ul>
					</div>
				</li>

				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#2collapse"
						aria-expanded="false">영업하기</button>
					<div class="collapse" id="2collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">주문접수</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">주문처리내역</a></li>
						</ul>
					</div>
				</li>

				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#1collapse"
						aria-expanded="false">매출관리</button>
					<div class="collapse" id="1collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">매출조회</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!--사이드바 끝-->



	
		<!--메뉴 리스트 폼 시작-->
		<div class="container mt-4">
			<div class="text-end me-5">
				<button type="button" id="menuInsert" name="menuInsert"
					class="btn btn-outline-dark">메뉴 등록</button>
			</div>
			<table class="table caption-top">
				<h2>메뉴 리스트</h2>
				<thead>
					<tr>
						<th scope="col">메뉴종류</th>
						<th scope="col">메뉴이름</th>
						<th scope="col">메뉴 수정</th>
						<th scope="col">메뉴 삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 부분 -->
					<c:forEach var="menu" items="${menuList}">
						<tr>
							<td>${menu.menu_category}</td>
							<td>${menu.menu_name}</td>
							<td>
								<button type="button" id="menuUpdateBtn" name="menuUpdateBtn"
									class="btn btn-outline-dark menuUpdateBtn"
									data-menu-no="${menu.menu_no}">메뉴 수정</button>
							</td>
							<td>
								<form method="post">
									<input type="hidden" name="menu_no" id="menu_no" value="${menu.menu_no}">
									<button type="submit" id="menuDeleteBtn" name="menuDeleteBtn"
										class="btn btn-outline-dark menuDeleteBtn">메뉴 삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>

					<!-- 데이터 출력 끝 -->


				</tbody>
			</table>
		</div>
		<!--메뉴 리스트 폼 끝-->
	</div>
	<!--사이드바+메뉴 리스트 묶어 줌-->



	<!-- 푸터 -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- 푸터 끝-->


	<!-- Bootstrap core JS-->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
	<!-- Core theme JS-->
	<!--헤더 푸터 관련 스크립트-->
	<script
		src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/js/color-modes.js"></script>
	<script src="/resources/include/js/scripts.js"></script>
	<!--사이드바 관련 부트스트랩 스크립트-->
	<script src="/resources/include/js/sidebars.js"></script>


</body>

</html>