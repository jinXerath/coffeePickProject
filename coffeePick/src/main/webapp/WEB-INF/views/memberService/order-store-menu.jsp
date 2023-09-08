<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
</head>
<!-- ////////////// -->
<body>

	<!--메뉴/매장정보 구분 버튼 시작-->
	<div class="d-flex justify-content-center mt-5">
		<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
			<button type="button" class="btn btn-outline-primary">메뉴</button>
			<button type="button" class="btn btn-outline-primary">매장정보</button>
		</div>
	</div>
	<!--메뉴/매장정보 구분 버튼 끝-->




	<!--매장명-->
	<div class="text-center p-3">
		<h1 class="display-5 fw-bold">빽다방</h1>
	</div>
	<!--매장명 끝-->




	<!--로고,영업여부,영업시간,매장전화번호 + 지도,매장 주소 묶어주는 부분 시작-->
	<div class="container py-2">
		<div class="row align-items-md-stretch">
			<!--메장로고,영업여부,영업시간,전화번호 시작-->
			<div class="col-md-6" style="margin-top: -100px;">
				<!--로고 영업 상태,영업시간,매장 전화번호 위 아래 이동 설정-->
				<div class="h-100 p-5 bg-body-tertiary rounded-3">
					<div class="container-fluid py-5">
						<div class="mb-4">
							<!-- 이미지와 영업 여부 사이의 공간 설정 -->
							<!--매장 로고-->
							<img src="/images/빽다방 로고.png" style="object-fit: contain;" class="me-4" width="350" height="200">
						</div>
						<!--영업 여부-->
						<h1>영업 중</h1>
					</div>
					<!--매장 간략 설명-->
					<h1>안녕하세요 빽다방입니다.</h1>
					<!--매장 전화번호-->
					<h4>02-1111-1111</h4>
				</div>
			</div>
			<!--매장로고,영업여부,영업시간,전화번호 끝-->

			<!-- 지도,매장 주소 시작-->
			<div class="col-md-6">
				<div class="h-100 p-5 bg-body-tertiary border rounded-3">
					<div class="mb-3">
						<!--지도와 매장주소 사이의 공간 설정-->
						<img src="/images/빽다방 지도.png">
						<!--매장 지도-->
					</div>
					<!--매장 주소-->
					<p>강남역 4번출구 도보3분거리, 강남역 1번출구 도보5분거리</p>
				</div>
			</div>
			<!-- 지도,매장 주소 끝-->
		</div>
	</div>
	<!--로고,영업여부,영업시간,매장전화번호 + 지도,매장 주소 묶어주는 부분 끝-->




	<!--전체메뉴,커피,논커피,디저트 구분 버튼 시작-->
	<div class="d-flex justify-content-center">
		<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
			<button type="button" class="btn btn-outline-primary">All</button>
			<button type="button" class="btn btn-outline-primary">Coffee</button>
			<button type="button" class="btn btn-outline-primary">Non-Coffee</button>
			<button type="button" class="btn btn-outline-primary">Desert</button>
		</div>
	</div>
	<!--전체메뉴,커피,논커피,디저트 구분 버튼 끝-->




	<!--메뉴 리스트 + 장바구니 시작-->
	<div class="container">
		<!--메뉴 리스트 + 장바구니 row 제어 시작-->
		<div class="row">
			<!--메뉴 리스트 공간 할당 col-8 시작-->
			<div class="col-8">
				<h7 class="fw-bolder mb-4">원하는 메뉴를 장바구니에 담아주세요.</h7>
				<!--메뉴 리스트 출력 갯수,간격 설정 시작-->
				<div class="row gx-5 row-cols-xl-4 justify-content-center">

					<!--메뉴 리스트 시작-->
					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!--메뉴 이미지-->
							<img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200" height="250" style="object-fit: contain;" />

							<div class="card-body p-4">
								<div class="text-center">
									<!-- 메뉴 이름-->
									<h3 class="fw-bolder">아메리카노</h3>
									<!-- 메뉴 가격-->
									<h4>7000원</h4>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center btn-outline-primary mt-auto">
									<button type="button" name="bbtn" id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
								</div>
							</div>
						</div>
					</div>



					<!--메뉴 리스트 끝-->
				</div>
				<!--메뉴 리스트 출력 갯수,간격 설정 끝-->
			</div>
			<!--메뉴 리스트 공간 할당 col-8 끝-->



			<!--추가옵션 선택 창 시작-->
			<!-- 추가옵션 선택 창 (모달) -->
			<div class="modal fade" id="optionsModal" tabindex="-1" aria-labelledby="optionsModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="optionsModalLabel">추가 옵션 선택</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- 여기에 추가 옵션 선택 폼이나 내용을 추가하세요 -->
							<p>옵션을 선택하세요:</p>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="option1"> <label class="form-check-label" for="option1">옵션 1</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="option2"> <label class="form-check-label" for="option2">옵션 2</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">장바구니에 추가</button>
						</div>
					</div>
				</div>
			</div>
			<!--추가옵션 선택 창 끝-->


			<!--장바구니 시작-->
			<div class="col-4">
				<!--장바구니 고정,윗 공간 설정 시작-->
				<div class="sticky-top" style="top: 30px;">
					<!--장바구니 넓이 조절 시작-->
					<div class="col-md-14">
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-primary">장바구니</span>
						</h4>
						<!--장바구니 목록 시작-->
						<ul class="list-group mb-3">
							<!--장바구니에 담을 메뉴 시작-->
							<li class="list-group-item d-flex justify-content-between lh-sm">
								<div>
									<h4 class="my-0">아메리카노</h4>
									<h6 class="text-body-secondary mt-2">얼음 추가</h6>
									<h6 class="text-body-secondary mt-2">얼음 추가</h6>
									<h6 class="text-body-secondary mt-2">얼음 추가</h6>
									<h7 class="text-body-secondary mt-2">얼음 추가</h7>
								</div>
								<button type="button" class="btn btn-outline-primary" style="height: fit-content;">+</button>
								<h4 class="text-center mt-1">1</h4>
								<button type="button" class="btn btn-outline-primary" style="height: fit-content;">-</button>
								<h5 class="text-body-secondary mt-1">7000원</h5>
								<button type="button" class="btn btn-outline-primary" style="height: fit-content;">X</button>
							</li>

							<!--장바구니에 담을 메뉴 끝-->

							<li class="list-group-item d-flex justify-content-between">
								<h2>결제예정금액</h2>
								<h2>
									<strong>28000원</strong>
								</h2>
							</li>
							<div class="text-center mt-4">
								<button type="button" class="btn btn-outline-primary" style="width: 150px;">장바구니 비우기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-outline-primary" style="width: 150px;">결제하기</button>
							</div>
						</ul>
						<!--장바구니 목록 끝-->
					</div>
					<!--장바구니 넓이 조절 끝-->
				</div>
				<!--장바구니 고정,윗 공간 설정 시작-->
			</div>
			<!--장바구니 끝-->
		</div>
		<!--메뉴 리스트 + 장바구니 row 제어 끝-->
	</div>
	<!--메뉴 리스트 + 장바구니 끝-->

</body>
</html>