<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!--사이드바 부트스트랩 관련 링크-->
<link href="/resources/include/css/sidebars.css" rel="stylesheet">
<!--사이드바 관련 부트스트랩 스크립트-->
<script src="/resources/include/js/sidebars.js"></script>
<script type="text/javascript">
	$(function() {
		//메뉴 삭제 버튼 제어
		$('.menuDeleteBtn').click(function() {
		        $(".menuListForm").attr({
		            "method": "post",
		            "action": "/menu/menuDelete"
		        });
		        $('.menuListForm').submit();
		});

		//메뉴 등록 버튼 제어
		$(".menuInsert").click(function() {
			location.href = '/menu/menuInsertForm?store_id=${param.store_id}';

		});
		//메뉴 수정 버튼 제어
		$(".menuUpdateBtn").click(function() {
			let menu_no = parseInt(($(this).attr("data-menu-no")));
			let store_id = $(this).closest('tr').find('.store_id').val(); // 가정: store_id가 같은 테이블 행 안에 input field로 들어있다고 가정.
			location.href = '/menu/menuUpdateForm?menu_no=' + menu_no + '&store_id=' + store_id;
		});
	});//end
</script>
	

		<!--메뉴 리스트 폼 시작-->
		<div class="container mt-4">
			<div class="text-end me-5">
				<button type="button" id="menuInsert" name="menuInsert"
					class="btn btn-outline-dark menuInsert">메뉴 등록</button>
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
								<button type="button" name="menuUpdateBtn"
									data-menu-no="${menu.menu_no}"
									class="btn btn-outline-dark menuUpdateBtn">메뉴 수정</button>
									<input type="hidden" name="store_id" id="store_id" class="store_id" value="${param.store_id}">
							</td>

							<td>
								<form method="post" class="menuListForm">
									<input type="hidden" name="menu_no" id="menu_no"
										class="menu_no" value="${menu.menu_no}">
									<input type="hidden" name="store_id" id="store_id"
										class="store_id" value="${menu.store_id}">
									<button type="submit" name="menuDeleteBtn"
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
	