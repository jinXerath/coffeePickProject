<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<!-- ////////////// -->
<body>
	<div class="container">
		<!--매장정보 등록 폼 시작-->

		<div>
			<div class="py-5 text-center">
				<h2>매장 정보 등록</h2>
			</div>
			<div>
				<div>
					<form class="needs-validation" novalidate>
						<div class="row g-3">
							<!--매장명 작성 시작-->
							<div class="row">
								<div class="col-4">
									<label class="form-label">매장명</label> <input type="text" class="form-control" id="storeName" placeholder="매장 이름을 입력해주세요" required>
								</div>
							</div>
							</div>
							<hr />
							<!--매장명 작성 끝-->

							<!--매장 로고 이미지 삽입-->
							<div class="row">
								<div class="col-6">
									<label class="form-label">매장 로고(이미지)</label> <input type="file" class="form-control" id="storeImg" required>
								</div>
							</div>
							<!--매장 로고 이미지 삽입 끝-->
							<hr />

							<!--매장 영업시간 작성 시작-->
							<div class="row">
								<div class="col-8">
									<label class="form-label">매장 영업시간</label>
									<textarea rows="7" class="form-control" id="storeBusinessHours"></textarea>
								</div>
							</div>
							<hr />
							<!--매장 영업시간 작성 끝-->

							<!--매장  설명 시작-->
							<div class="row">
								<div class="col-6">
									<label for="address" class="form-label">매장 설명</label>
									<textarea class="form-control" id="menuInfo" placeholder="매장 설명을 입력해주세요" required></textarea>
								</div>
							</div>
							<hr />
							<!--매장 간략 설명 작성 끝-->
							<!--매장 상세 설명 시작-->
							<div class="row">
								<div class="col-6">
									<label for="address" class="form-label">매장 상세 설명</label>
									<textarea class="form-control" id="menuDetailInfo" placeholder="매장 상세설명을 입력해주세요" required></textarea>
								</div>
							</div>
							<hr />
							<!--매장 상세 설명 끝-->

							<!--매장 주소 작성 시작-->
							<div class="row">
								<div class="col-8">
									<label for="address" class="form-label">매장 주소</label> <input type="text" class="form-control" id="storeAddr" placeholder="주소를 입력해주세요" required>
								</div>
							</div>
							<hr />
							<!--메뉴 가격 작성 끝-->


							<!--매장 정보 등록-->
							<div class="row mb-4">
								<div class="col-4 mx-auto">
									<button class=" btn btn-primary btn-lg" type="submit">매장 정보 등록</button>
								</div>
							</div>
					</form>
				</div>
			</div>
		</div>
		<!--메뉴등록 폼 끝-->
	</div>
	
</body>
</html>