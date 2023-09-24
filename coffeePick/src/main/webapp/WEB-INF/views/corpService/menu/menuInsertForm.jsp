<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!--사이드바 부트스트랩 관련 링크-->
<link href="/resources/include/css/sidebars.css" rel="stylesheet">
<script src="/resources/include/js/sidebars.js"></script>
<script>
<!-- 첫 번째 JSP 페이지 -->
		$(function() {		 
		//메뉴 등록 버튼 제어 및 유효성 검사
		 $("#menuInsertBtn").click(function(e) {
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
		   $("#menuInsertForm").attr({
		     "method": "post",
		     "enctype": "multipart/form-data",
		     "action": "/menu/menuInsert"
		   });

		   $("#menuInsertForm").submit();
		 });

		//메뉴 취소 버튼 제어
		$("#menuCancelBtn").click(function() {
			location.href = '/menu/menuList?store_id=${param.store_id}';
		});
	});
</script>
<!--메뉴 등록 폼 시작-->
<div class="col-md-9">
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
				class="form-check-label" for="coffee">coffee</label>
		</div>

		<div class="form-check">
			<input class="form-check-input" type="radio" name="menu_category"
				id="nonCoffee" value="nonCoffee"> <label
				class="form-check-label" for="nonCoffee">nonCoffee</label>
		</div>

		<div class="form-check">
			<input class="form-check-input" type="radio" name="menu_category"
				id="dessert" value="dessert"> <label
				class="form-check-label" for="dessert">dessert</label>
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
					type="file" class="form-control" id="file" name="file" required>
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
	<!--  — 메뉴 등록,취소 버튼 끝 -->—>
</div>
<!--  메뉴 등록 폼 끝-->












