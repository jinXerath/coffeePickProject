<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page JS -->
<body>
	
		<div class="alert alert-primary" role="alert">
			<h1 class="alert-heading">주문완료</h1>
			<hr>
			주문상태:
		</div>

	
	<!-- 장바구니 물품 목록 시작 -->
	<div id="cart-list">
		<!-- 폼 -->
		<form id="cart-form">
			<!-- 장바구니 테이블 목록 시작 -->
			<table class="table">
				<!-- thead -->
				<thead>
					<tr>
						<th scope="col">매장명</th>
						<th scope="col">상품사진</th>
						<th scope="col">상품명</th>
						<th scope="col">선택옵션</th>
						<th scope="col">수량</th>
						<th scope="col">가격</th>
						<th scope="col">적립포인트</th>

					</tr>
				</thead>
				<!-- tbody -->
				<!-- spring에서 세션에담긴것을 가져올 예정 -->
				<tbody>
					<tr>
						<td>매장명1</td>
						<td>상품사진1</td>
						<td>상품명</td>
						<td>상품옵션</td>
						<td><input type="text" class="form-control menuCount" value="0" aria-label="menuCount"></td>
						<td><input class="form-control menuPrice" name="menuPrice" type="text" value="상품가격" aria-label="상품가격" readonly></td>
						<td><input class="form-control menuPoint" name="menuPoint" type="text" value="상품 적립 포인트" aria-label="상품 적립 포인트" readonly></td>
					</tr>
				</tbody>
				<!-- tfoot  -->
				<tfoot>
					<tr>
						<td scope="row" colspan="5"></td>
						<td><input class="form-control total" id="totalPrice" name="totalPrice" type="text" value="총 가격" aria-label="총 가격" readonly></td>
						<td colspan="1"><input class="form-control total" id="totalPoint" name="totalPoint" type="text" value="총 적립 포인트" aria-label="총가격포인트" readonly></td>
						<td></td>
				</tfoot>
			</table>

		</form>
	</div>
</body>
</html>