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

<!-- 추가한 css -->
.carousel-control-prev-icon,
.carousel-control-next-icon {
    background-image: none !important;
  }

  .carousel-control-prev-icon::before,
  .carousel-control-next-icon::before {
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
  
</style>

<!-- 슬라이드1 시작 -->
<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink1.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 1" style="object-fit: contain;">
					</div>
					<!-- 두 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink2.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 세 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink3.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 네 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 다섯 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 여섯 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
				</div>
				<div class="carousel-caption text-start">
					<h1 style="color: black;">스타벅스</h1>
					<p class="opacity-75" style="color: black;">간단 매장 소개</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink1.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 1" style="object-fit: contain;">
					</div>
					<!-- 두 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink2.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 세 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink3.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 네 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 다섯 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 여섯 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
				</div>
				<div class="carousel-caption">
					<h1 style="color: black;">매장이름</h1>
					<p style="color: black;">매장 간단 소개</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<!-- 첫 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink1.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 1" style="object-fit: contain;">
					</div>
					<!-- 두 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink2.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 세 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink3.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 네 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 다섯 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
					<!-- 여섯 번째 이미지 -->
					<div class="col-4">
						<img
							src="/resources/images/starbucks/2023_m_disney_top_drink4.png"
							width="100%" height="500px" class="d-block w-100"
							alt="Slide Image 2" style="object-fit: contain;">
					</div>
				</div>
				<div class="carousel-caption text-end">
					<h1 style="color: black;">빽다방</h1>
					<p style="color: black;">빽다방 간단 소개</p>
				</div>
			</div>
		</div>
	</div>
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
</div>
<!-- 슬라이드1 끝 -->

<!-- 매장 소개 시작 -->
<section class="container py-5">
	<div class="row text-center pt-3">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">매장소개</h1>
			<p>매장소개 간단 글</p>
		</div>
	</div>

	<div class="row">
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/starbucks/스타벅스로고.png" class="img-thumbnail">
			<h3 class="text-center mt-3 mb-3">스타벅스 역삼점</h3>
			<p>02-2222-2222</p>
			<h5>구체적 주소</h5>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/ediya/이디야커피로고.jpeg" class="img-thumbnail">
			<h3 class="h5 text-center mt-3 mb-3">이디야 커피 일산킨텍스점</h3>
			<p>0-8888-9999</p>
			<h4>일산킨텍스</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/tom/탐앤탐스로고.jpeg" class="img-thumbnail">
			<h3 class="h5 text-center mt-3 mb-3">탐앤탐스</h3>
			<p>0-8888-9999</p>
			<h4>수원역 2번출구 맞은 편</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/megacoffee/메가커피로고.png" class="img-thumbnail">
			<h3 class="h5 text-center mt-3 mb-3">메가커피 수원역점</h3>
			<p>0-8888-9999</p>
			<h4>수원역 2번출구 맞은 편</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
		<div class="col-3 col-md-3 p-5 mt-3">
			<img src="/resources/images/bback/빽다방로고.png" class="img-thumbnail" >
			<h3 class="h5 text-center mt-3 mb-3">빽다방</h3>
			<p>0-8888-9999</p>
			<h4>경기도 광명시 안현로</h4>
		</div>
	</div>
</section>
<!-- 매장 소개 시작 -->

<!-- 매장 이벤트 시작 -->
<div class="container marketing">
	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading fw-normal lh-1">
				First featurette heading. <span class="text-body-secondary">It’ll
					blow your mind.</span>
			</h2>
			<p class="lead">Some great placeholder content for the first
				featurette here. Imagine some exciting prose here.</p>
		</div>
		<div class="col-md-5">
			<img src="/resources/images/starbucks/IRIoMO_20230828090417796.jpg" class="featurette-image img-fluid mx-auto" width="500" height="500" alt="Description">
		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7 order-md-2">
			<h2 class="featurette-heading fw-normal lh-1">
				Oh yeah, it’s that good. <span class="text-body-secondary">See
					for yourself.</span>
			</h2>
			<p class="lead">Another featurette? Of course. More placeholder
				content here to give you an idea of how this layout would work with
				some actual real-world content in place.</p>
		</div>
		<div class="col-md-5 order-md-1">
			<img src="/resources/images/starbucks/IRIoMO_20230828090417796.jpg" class="featurette-image img-fluid mx-auto" width="500" height="500" alt="Description">
		</div>
	</div>

	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading fw-normal lh-1">
				And lastly, this one. <span class="text-body-secondary">Checkmate.</span>
			</h2>
			<p class="lead">And yes, this is the last block of representative
				placeholder content. Again, not really intended to be actually read,
				simply here to give you a better view of what this would look like
				with some actual content. Your content.</p>
		</div>
		<div class="col-md-5">
			<img src="/resources/images/starbucks/IRIoMO_20230828090417796.jpg" class="featurette-image img-fluid mx-auto" width="500" height="500" alt="Description">
		</div>
	</div>
	<hr class="featurette-divider">
</div>
<!-- 매장 이벤트 끝 -->




