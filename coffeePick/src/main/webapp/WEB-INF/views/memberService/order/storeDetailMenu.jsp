<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link href="/resources/include/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script src="/resources/include/js/scripts.js"></script>
<!-- 카카오 지도 제어 스크립트 건들지 말 것 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6854f4f375dd8351d699f88b2d3bcc7a&libraries=services"></script>
<script type="text/javascript">
var storeName = "<%= request.getAttribute("store_name") %>";
	$(function() {
		//메뉴 이동 버튼 제어
		$(".menuBtn")
				.click(
						function() {
							location.href = '/order/storeDetailMenu?store_id=${param.store_id}';
						});

		//매장 이동 버튼 제어
		$(".storeBtn")
				.click(
						function() {
							location.href = '/order/storeDetailInfo?store_id=${param.store_id}';
						});
		
		var storeAddress = "<%= request.getAttribute("store_addr") %>";
		
		console.log("Store Name: ", storeName);
		console.log(`Content for InfoWindow: <div style="width:150px;text-align:center;padding:6px 0;">${storeName}</div>`);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(storeAddress, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        console.log("Inside geocoder, storeName:", storeName);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	             content: "<div style='width:150px;text-align:center;padding:6px 0;'>"+storeName+"</div>" 
	            
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	});//end
	//모달창 제어
	document.addEventListener('DOMContentLoaded', function() {
	    var menuImages = document.querySelectorAll('.file');
	    
	    menuImages.forEach(function(menuImage) {
	        menuImage.addEventListener('click', function(e) {
	            var menuId = e.target.getAttribute('data-menu-id');
	            $('#optionsModal' + menuId).modal('show');
	        });
	    });
	});
	
  //All/coffee/nonCoffee/dessert 제어
  document.addEventListener("DOMContentLoaded", function() {
  const buttons = document.querySelectorAll('.filter-button');
  const items = document.querySelectorAll('.col.mb-5'); // 클래스를 정확하게 지정하세요

  buttons.forEach(button => {
    button.addEventListener('click', function() {
      const filter = button.getAttribute('data-filter');
      items.forEach(item => {
        const category = item.getAttribute('data-menu-category');
        if (filter === 'all' || filter === category) {
          item.style.display = 'block'; // 혹은 'flex', 'inline-block' 등
        } else {
          item.style.display = 'none';
        }
      });
    });
  });
});
</script>

	<input type="hidden" id="store_id" name="store_id" value="store_id" />

	<!--메뉴/매장정보 구분 버튼 시작-->
	<div class="d-flex justify-content-center mt-5">
		<div class="btn-group btn-group-lg" role="group"
			aria-label="Large button group">
			<button type="button" id="menuBtn" name="menuBtn"
				class="btn btn-outline-primary menuBtn">메뉴</button>
			<button type="button" id="storeBtn" name="storeBtn"
				class="btn btn-outline-primary storeBtn">매장정보</button>
		</div>
	</div>
	<!--메뉴/매장정보 구분 버튼 끝-->

	<!-- forEach로 각 매장 정보에 접근 -->
	<c:forEach var="store" items="${storeDetail}">
		<!--매장명-->
		<div class="text-center p-3">
			<h1 class="display-5 fw-bold">"${store.store_name}"</h1>
		</div>
		<!--매장명 끝-->
		<!--로고,영업여부,영업시간,매장전화번호 + 지도,매장 주소 묶어주는 부분 시작-->
		<div class="container py-2">
			<div class="row align-items-md-stretch">
				<!--메장로고,영업여부,영업시간,전화번호 시작-->
				<div class="col-md-6" style="margin-top: -100px;">
					<div class="h-100 p-5 rounded-3">
						<div class="container-fluid py-5">
							<div class="mb-4">
								<!--매장 로고 (store_content 필드를 여기에 사용) -->
								<img src="${store.store_img}" style="object-fit: contain;"
									class="me-4" width="350" height="200">
							</div>
						</div>
						<!--매장 간략 설명 (예를 들어 store_description 필드)-->
						<h1>${store.store_content}</h1>
						<!--매장 전화번호 (예를 들어 store_phone 필드)-->
						<h4>${store.store_phone}</h4>
					</div>
				</div>
				<!--메장로고,영업여부,영업시간,전화번호 끝-->

				<!-- 지도,매장 주소 시작-->
				<div class="col-md-6">
					<div class="h-100 p-5 bg-body-tertiary border rounded-3">
						<div class="mb-3">
							<!--매장 지도 (예를 들어 store_map 필드) -->
							<div id="map" style="width: 100%; height: 350px;"></div>
						</div>
						<!--매장 주소 (예를 들어 store_address 필드)-->
						<p>${store.store_addr}</p>
					</div>
				</div>
				<!-- 지도,매장 주소 끝-->
			</div>
		</div>
		<!--로고,영업여부,영업시간,매장전화번호 + 지도,매장 주소 묶어주는 부분 끝-->
	</c:forEach>

	<!--전체메뉴,커피,논커피,디저트 구분 버튼 시작-->
	<div class="d-flex justify-content-center">
		<div class="btn-group btn-group-lg" role="group"
			aria-label="Large button group">
			<button type="button" id="AllBtn" name="AllBtn"
				class="btn btn-outline-primary filter-button" data-filter="all">All</button>
			<button type="button" id="coffeeBtn" name="coffeeBtn"
				class="btn btn-outline-primary filter-button" data-filter="coffee">coffee</button>
			<button type="button" id="nonCoffee" name="nonCoffee"
				class="btn btn-outline-primary filter-button"
				data-filter="nonCoffee">nonCoffee</button>
			<button type="button" id="dessert" name="dessert"
				class="btn btn-outline-primary filter-button" data-filter="dessert">dessert</button>
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
					<c:forEach var="menu" items="${menuList}" varStatus="loop">
						<c:choose>
							<c:when test="${not empty menu}">
								<div class="col mb-5" data-menu-category="${menu.menu_category}">
									<div class="card h-100">
										<!-- 메뉴 이미지 -->
										<c:if test="${not empty menu.menu_img}">
											<img src="/coffeePickStorage/menu/${menu.menu_img}"
												data-menu-id="${loop.index}" class="file"
												style="object-fit: contain;" />
										</c:if>
										<c:if test="${empty menu.menu_img}">
											<img src="/resources/images/noimage.png" class="file"
												style="object-fit: contain;" />
										</c:if>
										<div class="card-body p-4">
											<div class="text-center">
												<!-- 메뉴 이름 -->
												<h3 class="fw-bolder">${menu.menu_name}</h3>
												<!-- 메뉴 가격 -->
												<h4>${menu.menu_price}원</h4>
											</div>
										</div>
										<!-- Product actions -->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center btn-outline-primary mt-auto">
												<button type="button" name="bbtn" id="bbtn"
													class="btn btn-outline-primary mt-auto">장바구니에 담기</button>
											</div>
										</div>
									</div>
								</div>

								<!-- 메뉴 설명 시작 -->
								<div class="modal fade" id="optionsModal${loop.index}"
									tabindex="-1" aria-labelledby="optionsModalLabel${loop.index}"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="optionsModalLabel${loop.index}">${menu.menu_name}</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<!-- 여기에 추가 옵션 선택 폼이나 내용을 추가하세요 -->
												<p>${menu.menu_content}</p>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
								<!--메뉴설명 끝-->
							</c:when>
							<c:otherwise>

								<!-- 데이터가 없을 때의 처리 -->
								<div class="col">
									<div class="card shadow-sm">
										<div class="card-body">메뉴가 없습니다.</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!--메뉴 리스트 끝-->
				</div>
				<!--메뉴 리스트 출력 갯수,간격 설정 끝-->
			</div>
			<!--메뉴 리스트 공간 할당 col-8 끝-->

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

								</div>
								<button type="button" class="btn btn-outline-primary"
									style="height: fit-content;">+</button>
								<h4 class="text-center mt-1">1</h4>
								<button type="button" class="btn btn-outline-primary"
									style="height: fit-content;">-</button>
								<h5 class="text-body-secondary mt-1">7000원</h5>
								<button type="button" class="btn btn-outline-primary"
									style="height: fit-content;">X</button>
							</li>

							<!--장바구니에 담을 메뉴 끝-->

							<li class="list-group-item d-flex justify-content-between">
								<h2>결제예정금액</h2>
								<h2>
									<strong>28000원</strong>
								</h2>
							</li>
							<div class="text-center mt-4">
								<button type="button" class="btn btn-outline-primary"
									style="width: 150px;">장바구니 비우기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-outline-primary"
									style="width: 150px;">결제하기</button>
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

	




