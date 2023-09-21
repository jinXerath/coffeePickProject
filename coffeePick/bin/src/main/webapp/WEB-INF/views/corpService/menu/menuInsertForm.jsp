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
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript"
	src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script>

$(function() {
	
	  //메뉴 등록 버튼 제어
	  $("#menuInsertBtn").click(function(e) {

	    $("#menuInsertForm").attr({
	      "method": "post",
	      //"enctype": "multipart/form-data",
	      "action": "/menu/menuInsert"
	    });

	    $("#menuInsertForm").submit();
	  });
	  
	  //메뉴 취소 버튼 제어
	  $("#menuCancelBtn").click(function() {
		  location.href = '/menu/menuList?store_id=${param.store_id}';
		});	
});
	
	
	
	
 /*    $(document).ready(function() {
        $("#menuInsertBtn").click(function(e) {
            // 기본 폼 제출을 막습니다.
           	alert("확인")
            e.preventDefault();
            
         // Gather data from form fields.
            var menuName = $("#menuName").val();
            var menuPrice = $("#menuPrice").val();
            var menuInfo = $("#menuInfo").val();
            var store_id = $("#store_id").val();
            
            
            // Check which radio button is selected.
            var selectedCategory = $("input[name='menu_category']:checked").val();

            // Create a JSON object.
            var jsonData = {
                "menu_name": menuName,
                "menu_price": menuPrice,
                "menu_content": menuInfo,
                "menu_category": selectedCategory,
                "store_id":store_id
            };
			console.log(jsonData);
            // AJAX POST 요청을 보냅니다.
            $.ajax({
                url: '/menu/menuInsert', // 여기에 실제 서버 엔드포인트 URL을 입력해주세요.
                type: 'POST',
                contentType: 'application/json', // JSON 형식으로 보낼 것을 명시합니다.
                data: JSON.stringify(jsonData), // JSON 객체를 문자열로 변환합니다.
                success: function(response) {
                    // 성공적으로 데이터를 전송했을 때 할 일을 여기에 작성합니다.
                    alert("메뉴가 성공적으로 등록되었습니다.")
                },
                error: function(error) {
                    // 에러가 발생했을 때 할 일을 여기에 작성합니다.
                    alert("메뉴 등록에 실패했습니다.");
                }
            });
        });
    });
}); */
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
					<h2>원하는 메뉴를 등록해주세요</h2>
				</div>
				<h4 class="mb-3">메뉴 종류</h4>

				<form class="needs-validation" novalidate id="menuInsertForm"
					name="menuInsertForm">
					<input type="hidden" id="store_id" name="store_id"
						value="${param.store_id}">
					<!--메뉴종류 선택 시작-->
					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="coffee" value="coffee" checked> <label
							class="form-check-label" for="flexRadioDefault1">coffee</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="nonCoffee" value="nonCoffee"> <label
							class="form-check-label" for="flexRadioDefault2">nonCoffee</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="dessert" value="dessert"> <label
							class="form-check-label" for="flexRadioDefault2">dessert</label>
					</div>
					<hr />
					<!--메뉴종류 선택 끝-->

					<!--메뉴 이름 작성 시작-->
					<div class="row">
						<div class="col-4">
							<label for="address" class="form-label">메뉴 이름</label> <input
								type="text" class="form-control" id="menu_name" name="menu_name"
								placeholder="메뉴 이름을 입력해주세요" required>
						</div>
					</div>
					<hr />
					<!--메뉴 이름 작성 끝-->

					<!--메뉴 가격 작성 시작-->
					<div class="row">
						<div class="col-4">
							<label for="address" class="form-label">메뉴 가격</label> <input
								type="text" class="form-control" id="menu_price" name="menu_price"
								placeholder="가격을 입력해주세요" required>
						</div>
					</div>
					<hr />
					<!--메뉴 가격 작성 끝-->

					<!--메뉴 설명 작성 시작-->
					<div class="row">
						<div class="col-6">
							<label for="address" class="form-label">메뉴 설명</label>
							<textarea class="form-control" id="menu_content" name="menu_content"
								placeholder="메뉴 설명을 입력해주세요" required></textarea>
						</div>
					</div>
					<hr />
					<!--메뉴 설명 작성 끝-->

					<!--메뉴 이미지 작성 시작-->
					<div class="row">
						<div class="col-6">
							<label for="address" class="form-label">메뉴 이미지</label> <input
								type="text" class="form-control" id="menu_img" name="menu_img"
								required>
						</div>
					</div>
					<hr />
					<!--메뉴 이미지 작성 끝-->
				</form>
				<!-- 메뉴 등록,취소 버튼 시작 -->
				<div class="row mb-4">
					<div class="col-4 mx-auto">
						<button class="w-100 btn btn-primary btn-lg" id="menuInsertBtn"
							name="menuInsertBtn" type="submit">메뉴 등록</button>
					</div>

					<div class="col-4 mx-auto">
						<button class="w-100 btn btn-primary btn-lg" id="menuCancelBtn"
							name="menuCancelBtn" type="button">취소</button>
					</div>
				</div>
				<!-- 메뉴 등록,취소 버튼 끝 -->
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
	<script
		src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/js/color-modes.js"></script>
	<script src="/resources/include/js/sidebars.js"></script>
	<!--사이드바 부트스트랩 관련 스크립트-->
	<script src="/resources/include/js/scripts.js"></script>



</body>

</html>