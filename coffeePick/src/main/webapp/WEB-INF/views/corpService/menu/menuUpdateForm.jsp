<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!--사이드바 부트스트랩 관련 링크-->
<link href="/resources/include/css/sidebars.css" rel="stylesheet">
<script src="/resources/include/js/sidebars.js"></script>
<script type="text/javascript">
	$(function() {
		category();
		//메뉴 수정 및 유효성 검사
		$("#menuUpdateBtn").click(function(e) {
		   //유효성 검사
		   var name = $("input[name='menu_name']").val();
		   var price = $("input[name='menu_price']").val();
		   var content = $("textarea[name='menu_content']").val();
		   var img = $("input[name='file']").val();

		   if (name == "") {
		     alert("메뉴 이름을 입력해 주세요.");
		     return; // 버튼 클릭 중지
		   }
		   if (price == "" || isNaN(price) || price < 0) {
		     alert("유효한 메뉴 가격을 입력해 주세요.");
		     return; // 버튼 클릭 중지
		   }
		   if (content == "") {
		     alert("메뉴 내용을 입력해 주세요.");
		     return; // 버튼 클릭 중지
		   }
		   if (img == "") {
		     alert("메뉴 이미지를 업로드해 주세요.");
		     return; // 버튼 클릭 중지
		   }
		   
		   if (img != "") { //업로드할 이미지 파일이 존재한다면
		     if (!chkFile($("input[name='file']"))) {
		       alert("gif, png, jpg 파일만 업로드 할 수 있습니다.");
		       return; // 버튼 클릭 중지
		     }
		   }

		   // 모든 유효성 검사 통과
		   $("#menuUpdateForm").attr({
				"method" : "post",
				"enctype": "multipart/form-data",
				"action" : "/menu/menuUpdate"
			});
			$("#menuUpdateForm").submit();
		 });
		
		//메뉴 취소 버튼 제어
		$("#menuCancelBtn").click(function() {
			let store_id = ($(this).attr("data-store-id"));
			location.href = '/menu/menuList?store_id=' + store_id;
		});
		
	}); //end
	
		function category() {
			const menu_category="${updateData.menu_category}";
			//alert(menu_category);
			
			if(menu_category=="coffee"){$("#coffee").prop("checked", true);} 
			else if
				(menu_category=="nonCoffee"){$("#nonCoffee").prop("checked", true);}
			else if
				(menu_category=="dessert"){$("#dessert").prop("checked", true);}
			}
</script>	

<!-- 전체 컨테이너 시작 -->
<div class="container">
  <!-- row 시작 -->
  <div class="row">
		<!-- 사이드바 시작-->
		<div class="d-flex flex-nowrap col-md-3">
			<div class="flex-shrink-0 p-3" style="width: 280px;">
				<a href="/"
					class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
					<svg class="bi pe-none me-2" width="30" height="24">
            <use xlink:href="#bootstrap" />
          </svg><span class="fs-5 fw-semibold">매장서비스</span>
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
			</div>
			<!-- 사이드 바 끝 -->

			<!--메뉴 등록 폼 시작-->
			<div class="col-md-9">
				<div class="py-5 text-center">
					<h2>원하는 메뉴를 수정해주세요</h2>
				</div>
				<h4 class="mb-3">메뉴 종류</h4>
				<form class="needs-validation menuUpdateForm" novalidate
					id="menuUpdateForm" name="menuUpdateForm"
					enctype="multipart/form-data">
					
					<input type="hidden" id="menu_no" name="menu_no" value="${param.menu_no}" /> 
					<input type="hidden" id="store_id" name="store_id" value="${param.store_id}" /> 
					<input type="hidden" id="menu_img" name="menu_img" value="${updateData.menu_img}"/>
					
					<!--메뉴종류 선택 시작-->
					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="coffee" value="coffee"> <label
							class="form-check-label" for="coffee"> Coffee </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="nonCoffee" value="nonCoffee"> <label
							class="form-check-label" for="nonCoffee"> Non-Coffee </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="menu_category"
							id="dessert" value="dessert"> <label
							class="form-check-label" for="dessert"> Dessert </label>
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
							<label for="address" class="form-label">메뉴 이미지</label>
							 <input
								type="file" class="form-control" id="file" name="file">
						</div>
					</div>
					<div class="mt-3">
					<img src="/coffeePickStorage/menu/${updateData.menu_img}"
											class="file" 
											style="object-fit: contain;" />
					</div>
					<p>업로드된 파일: ${updateData.menu_img}</p>
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
						<button class="w-100 btn btn-primary btn-lg" type="button"
							id="menuCancelBtn" data-store-id="${updateData.store_id}">취소</button>
					</div>
				</div>
				<!--메뉴 수정,취소 버튼 끝-->
			</div>
			<!--메뉴 등록 폼 끝-->
	</div>
	<!-- row 끝 -->
	</div>
	<!-- 전체 컨테이너 끝 -->
	

	
	



	
	