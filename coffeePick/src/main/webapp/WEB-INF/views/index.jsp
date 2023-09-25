<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-image: none !important;
}

.carousel-control-prev-icon::before, .carousel-control-next-icon::before
	{
	content: '\2039'; /* or any other Unicode character for arrows */
	font-size: 50px;
	color: black;
}

.carousel-control-next-icon::before {
	content: '\203A';
}

.carousel-indicators button {
	background-color: black !important;
}

.carousel-indicators .active {
	background-color: gray !important;
}

.store-card {
	height: 400px; /* 높이 고정 */
	border: 0.5px solid #e0e0e0; /* 밝은 회색의 HEX 코드 */
	border-radius: 8px; /* 둥근 모서리를 원할 경우 */
	margin: 0 21px; /* 상하 0, 좌우 10px */
	background-color: #ffffff; /* 화이트 색상 값 */
}

.boardAll {
	background-color: #f5f5f5; /* 이 값은 밝은 회색입니다. 원하는 색상으로 변경 가능합니다. */

}
</style>

<!-- 슬라이드 시작 -->
<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
	<!-- 슬라이드 밑 버튼 제어 시작 -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="3" aria-label="Slide 4"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="4" aria-label="Slide 5"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="5" aria-label="Slide 6"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="6" aria-label="Slide 7"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="7" aria-label="Slide 8"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="8" aria-label="Slide 9"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="9" aria-label="Slide 10"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="10" aria-label="Slide 11"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="11" aria-label="Slide 12"></button>
	</div>
	<!-- 슬라이드 밑 버튼 제어 끝 -->
	<!-- 슬라이드 이미지 제어 시작 -->
	<div class="carousel-inner">
		<!-- 첫번째 슬라이드 -->
		<div class="carousel-item active">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/메가잇지광고1.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 두번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/빽다방_홈페이지_main_크룽지-1920x600.jpg"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 1" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 세번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/빽다방_홈페이지_main_키르시콜라보_이벤트O.jpg"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 1" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 네번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/봄봄3.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 다섯번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/고디바광고.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 여섯번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/봄봄이벤트.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 일곱번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/봄봄이벤트2.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 여덟번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/설빙크룽지.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 아홉번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/봄봄4.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 열번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/이디야커피이벤트1.png" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 열한번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/이디야커피이벤트2.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 열두번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-12">
						<img src="/resources/images/event/설빙이벤트3.jpeg" width="100%"
							height="500px" class="d-block w-100" alt="Slide Image 1"
							style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 슬라이드 이미지 제어 끝 -->
	<!-- 슬라이드 버튼 제어 시작 -->
	<button class="carousel-control-prev" type="button"
		data-bs-target="#myCarousel" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#myCarousel" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
	<!-- 슬라이드 버튼 제어 끝 -->
</div>
<!-- 슬라이드 끝 -->
<!-- 매장 로고 슬라이드 시작 -->
<div id="carouselExampleRide" class="carousel slide mt-4"
	data-bs-ride="true">
	<div class="carousel-inner">
		<!-- 첫번째 슬라이드 -->
		<div class="carousel-item active">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img src="/resources/images/ediya/이디야커피로고.jpeg"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/bback/빽다방로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/megacoffee/메가커피로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/poundcoffee/파운드커피로고.jpeg"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/starbucks/스타벅스로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/tom/탐앤탐스로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 두번째 슬라이드 -->
		<div class="carousel-item">
			<div class=container>
				<div class="row">
					<div class="col-md-2">
						<img src="/resources/images/logo/할리스커피로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/폴바셋로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/투썸플레이스로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/커피스미스로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/커피빈로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/카페베네로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 세번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img src="/resources/images/logo/카페리처드로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/카페띠아모로고.jpeg"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/카페네로로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/엔젤리너스로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/봄봄로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/드롭탑로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 네번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img src="/resources/images/logo/CafeMozongLogo.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/감성커피로고.jpeg"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/고디바로고.jpeg" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/공차로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/달콤커피로고.jpeg"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/더리터로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
		<!-- 다섯번째 슬라이드 -->
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img src="/resources/images/logo/더벤티로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/더치앤빈로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/마시그래이커피.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/마호가니커피로고.png"
							class="d-block w-100" width="100%" height="200px"
							style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/설빙로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
					<div class="col-md-2">
						<img src="/resources/images/logo/아마스빈로고.png" class="d-block w-100"
							width="100%" height="200px" style="object-fit: contain;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleRide" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleRide" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>
<!-- 매장 로고 슬라이드 끝 -->

<!-- 매장 소개 시작 -->
<div class="boardAll mt-4">
<section class="container py-5">
	<div class="row text-center pt-3">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">CoffeePick's Store</h1>
		</div>
	</div>
	<div class="row">
		<!-- 데이터 출력 -->
		<c:choose>
			<c:when test="${not empty storeList}">
				<c:forEach var="store" items="${storeList}" varStatus="status">
					<div class="col-md-2 p-5 mt-4 store-card">
						<img src="/coffeePickStorage/store/${store.store_img}"
							class="img-thumbnail">
						<h3 class="text-center mt-3 mb-3">${store.store_name}</h3>
						<p>${store.store_phone}</p>
						<p>${store.store_addr}</p>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col">
					<div class="card shadow-sm">
						<div class="card-body">등록된 매장이 없습니다.</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 데이터 출력 끝 -->
	</div>
</section>
</div>
<!-- 매장 소개 끝 -->
<!-- 이벤트,공지사항 시작 -->
<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-md-6">
			<div class="d-flex" style="position: relative;">
				<h3 style="padding-left: 30px;">
					이벤트<a class="eventBoard" href=""
						style="color: black; text-decoration: none; position: absolute; right: 0">전체보기</a>
				</h3>
			</div>
			<ul class="event-list">
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 이벤트</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 이벤트</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스
								이벤트fdfdssdfdsfdsfdsfdsfdsfdsfsfdfdfdfdsfsfldslkfdsklfmdsklfdsklfdsklfmdkslmfndkslmfdsklfmsdklmfsdlmf</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 이벤트</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 이벤트</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
			</ul>
		</div>

		<div class="col-md-6">
			<div class="d-flex" style="position: relative;">
				<h3 style="padding-left: 30px;">
					공지사항<a class="noticeBoard" href=""
						style="color: black; text-decoration: none; position: absolute; right: 0">전체보기</a>
				</h3>
			</div>
			<ul class="notice-list">
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 공지사항</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 공지사항</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 공지사항</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스 공지사항</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
				<li class="justify-content-between align-items-center"><span
					class="d-flex" style="position: relative;"> <a
						class="event text-truncate"
						style="color: black; text-decoration: none; max-width: calc(100% - 100px);"
						href=""> <span>스타벅스
								공지사항어리ㅏ너라이너라ㅣㅇ너래ㅏㅇ너ㅜ래ㅏㅇ널패ㅏㅇ너랴ㅐ너랴ㅐㄴ러내런애렁냐ㅐ렁ㅈ냐ㅐ렁냐ㅐㄹㅇ너ㅐㅑ</span>
					</a> <a class="eventDate"
						style="color: black; text-decoration: none; position: absolute; right: 0"><span>2023.09.21</span></a>
				</span></li>
			</ul>
		</div>
	</div>
</div>





