<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page js -->
<script type="text/javascript">
	$(function() {
		/*체크박스 전체 선택*/
		$("#chkAll").click(function() {
			if ($("#chkAll").is(":checked"))
				$("input[name=chk]").prop("checked", true);
			else
				$("input[name=chk]").prop("checked", false);
		});
		/*체크박스 목록 전부 체크시 자동 전체선택 */
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;

			if (total != checked)
				$("#chkAll").prop("checked", false);
			else
				$("#chkAll").prop("checked", true);
		});
		/*수량 더하기,뺴기버튼 클릭시*/
		$(".plusBtn, .minusBtn").click(function() {
			let menuCount = $(".menuCount").val();
			menuCount = parseInt(menuCount);

			if ($(this).hasClass("plusBtn")) {
				menuCount++;
			} else if ($(this).hasClass("minusBtn") && menuCount >= 2) {
				menuCount--;
			}

			$(".menuCount").val(menuCount);
		});
		/*"더 담으러 가기 버튼 클릭시 */
		$("#menuBtn").click(function() {
			location.href = "";
		});
		/*선택삭제 버튼 클릭시 */
		$("#chkDel").click(function() {

		});
		/*삭제버튼 클릭시*/
		$(".deleteBtn").click(function() {

		});
		/*주문하기 버튼 클릭시 */
		$("#orderBtn").click(function() {

		});
	});
</script>
</head>

<body>
	<!-- Body 전체  container   -->
	<div id="container">

		<div id="">
			<!-- 상자 textBox -->
			<div id="textBox">
				<article>
					장바구니
					<div id="text">
						장바구니<span class="text-color">>주문결제>주문완료</span>
					</div>
				</article>
			</div>


			<!-- 장바구니 물품 목록 시작 -->
			<div id="cart-list">
				<section>
					<!-- 폼 -->
					<form id="cart-form">
						<!-- 선택삭제버튼 -->
						<div>
							<button type="button" class="btn btn-danger" id="chkDel">선택삭제</button>
						</div>
						<!-- 장바구니 테이블 목록 시작 -->
						<table class="table">
							<!-- 테이블 헤더 내용 -->
							<thead>
								<tr>
									<th scope="col"><input class="form-check-input"
										type="checkbox" id="chkAll" name="chkAll"></th>
									<th scope="col">매장명</th>
									<th scope="col">상품사진</th>
									<th scope="col">상품명</th>
									<th scope="col">선택옵션</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
									<th scope="col">적립포인트</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<!-- 테이블 본문 내용  -->
							<tbody>
								<!-- <tr>이 반복 될것이기 때문에 id가 아닌 class로 제어 -->
								<tr>
									<!-- check box -->
									<td scope="row"><input class="form-check-input chk"
										type="checkbox" name="chk"></td>
									<!-- storeName -->
									<td>storeName</td>
									<!-- menuImg -->
									<td>menuImg</td>
									<!-- menuName -->
									<td>menuName <!-- menuOption -->
									<td>menuOption</td>
									<td><input type="text" class="form-control menuCount"
										name="menuCount" value="1">
										<button class="btn btn-outline-secondary plusBtn"
											type="button" name="plusBtn">+</button>
										<button class="btn btn-outline-secondary minusBtn"
											type="button" name="minusBtn">-</button></td>
									<td><input class="form-control menuPrice" name="menuPrice"
										type="text" value="상품가격" readonly></td>
									<td><input class="form-control menuPoint" name="menuPoint"
										type="text" value="상품 적립 포인트" aria-label="상품 적립 포인트" readonly></td>
									<td><button type="button" class="btn btn-danger deleteBtn">x</button></td>
								</tr>
							</tbody>
							<!-- tfoot  -->
							<tfoot>
								<tr>
									<td scope="row" colspan="6"><button type="button"
											class="btn btn-primary" id="menuBtn" name="menuBtn">더
											담으러 가기</button></td>
									<td><input class="form-control total" id="totalPrice"
										name="totalPrice" type="text" value="총 가격" aria-label="총 가격"
										readonly></td>
									<td colspan="1"><input class="form-control total"
										id="totalPoint" name="totalPoint" type="text" value="총 적립 포인트"
										aria-label="총가격포인트" readonly></td>
									<td></td>
							</tfoot>
						</table>
						<!-- 주문하기 버튼 -->
						<div>
							<button type="button" class="btn btn-success" id="orderBtn"
								name="orderBtn">주문하기</button>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
</body>
</html>