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
<title>Shop Item - Start Bootstrap Template</title>
<!-- 헤더 푸터 부트스트랩 관련 링크-->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!--사이드바 부트스트랩 관련 링크-->
<link href="/resources/include/css/sidebars.css" rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		//메뉴 수정 버튼 제어
		$("#menuUpdateBtn").click(function(e) {

			$("#menuUpdateForm").attr({
				"method" : "post",
				//"enctype": "multipart/form-data",
				"action" : "/menu/menuUpdate"
			});

			$("#menuUpdateBtn").submit();
		});

		//메뉴 취소 버튼 제어
		$("#menuCancelBtn").click(function() {
			location.href = '/menu/menuList?store_id=${param.store_id}';
		});
		//메뉴 종류 데이터 제어
		const updateData = {
			// 서버에서 받아온 데이터 (이 부분을 실제 서버의 데이터로 대체)
			menuCategory : 'coffee' // 예를 들어 "coffee", "nonCoffee", "dessert" 중 하나
		};

		// 이름이 'menu_category'인 라디오 버튼을 찾아서 반복 처리
		$('input[name="menu_category"]').each(function() {
			if ($(this).val() === updateData.menuCategory) {
				$(this).prop('checked', true);
				return false; // each 반복을 종료
			}
		});

	});
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


	<!--사이드바 + 메뉴 등록폼 묶어 줌-->
	<div>
		<!-- 사이드바 시작-->
		<div class="d-flex flex-nowrap">
			<div class="flex-shrink-0 p-3" style="width: 280px;">
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

			<!--메뉴 등록 폼 시작-->
			<div class="container">
				<div class="py-5 text-center">
					<h2>원하는 메뉴를 수정해주세요</h2>
				</div>
				<h4 class="mb-3">메뉴 종류</h4>
				<form class="needs-validation" novalidate id="menuUpdateForm"
					name="menuUpdateForm">
					<input type="hidden" id="store_id" name="store_id"
						value="${param.store_id}">
					<input type="hidden" id="menu_no" name="menu_no"
						value="${updateData.menu_no}" />

					<!--메뉴종류 선택 시작-->
					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="coffee" value="coffee"> <label
							class="form-check-label" for="flexRadioDefault1"> Coffee
						</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="nonCoffee" value="nonCoffee"> <label
							class="form-check-label" for="flexRadioDefault2">
							Non-Coffee </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="dessert" value="dessert"> <label
							class="form-check-label" for="flexRadioDefault2"> Desert
						</label>
					</div>
					<hr />
					<!--메뉴종류 선택 끝-->

					<!--메뉴 이름 작성 시작-->
					<div class="row">
						<div class="col-4">
							<label for="address" class="form-label">메뉴 이름</label> <input
								type="text" class="form-control" id="menu_name" name="menu_name"
								placeholder="메뉴 이름을 입력해주세요" value="${updateData.menu_name}"
								required>
						</div>
					</div>
					<hr />
					<!--메뉴 이름 작성 끝-->

					<!--메뉴 가격 작성 시작-->
					<div class="row">
						<div class="col-4">
							<label for="address" class="form-label">메뉴 가격</label> <input
								type="text" class="form-control" id="menu_price"
								name="menu_price" placeholder="가격을 입력해주세요"
								value="${updateData.menu_price}" required>
						</div>
					</div>
					<hr />
					<!--메뉴 가격 작성 끝-->

					<!--메뉴 설명 작성 시작-->
					<div class="row">
						<div class="col-6">
							<label for="address" class="form-label">메뉴 설명</label>
							<textarea class="form-control" id="menu_content"
								name="menu_content" placeholder="메뉴 설명을 입력해주세요" required>${updateData.menu_content}</textarea>
						</div>
					</div>
					<hr />
					<!--메뉴 설명 작성 끝-->

					<!--메뉴 이미지 작성 시작-->
					<div class="row">
						<div class="col-6">
							<label for="address" class="form-label">메뉴 이미지</label> <input
								type="text" class="form-control" id="menu_img" name="menu_img"
								value="${updateData.menu_img}" required>
						</div>
					</div>
					<hr />
					<!--메뉴 이미지 작성 끝-->

				</form>
				<!--메뉴 수정,취소 버튼 시작-->
				<div class="row mb-4">
					<div class="col-4 mx-auto">
						<button class="w-100 btn btn-primary btn-lg" id="menuUpdateBtn"
							name="menuUpdateBtn" type="submit">메뉴 수정</button>
					</div>

					<div class="col-4 mx-auto">
						<button class="w-100 btn btn-primary btn-lg" type="submit"
							id="menuCancelBtn" name="menuCancelBtn">취소</button>
					</div>
				</div>
				<!--메뉴 수정,취소 버튼 끝-->
			</div>
			<!--메뉴 등록 폼 끝-->
		</div>
		<!-- 사이드바 끝-->
	</div>
	<!--사이드바 + 메뉴 등록폼 묶어 줌-->


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
	<!-- 헤더,푸터 부트스트랩 관련 스크립트-->
	<script src="/resources/include/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/js/color-modes.js"></script>
	<script src="/resources/include/js/sidebars.js"></script>
	<!--사이드바 부트스트랩 관련 스크립트-->
	<script src="/resources/include/js/scripts.js"></script>
</body>

</html>