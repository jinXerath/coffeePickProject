<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page js -->
<script type="text/javascript">
$(function() {
    // 페이지 로드시 초기 계산 수행
    updateTotal();

    // 수량 변경 시 계산 업데이트
    $(".menuCount").change(updateTotal);

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

    /*수량 더하기, 빼기 버튼 클릭시*/
    $(".plusBtn, .minusBtn").click(function() {
        let menuCount = $(this).closest("tr").find(".menuCount").val();
        menuCount = parseInt(menuCount);

        if ($(this).hasClass("plusBtn")) {
            menuCount++;
        } else if ($(this).hasClass("minusBtn") && menuCount >= 2) {
            menuCount--;
        }

        $(this).closest("tr").find(".menuCount").val(menuCount);
        updateRow($(this).closest("tr")); // 수량 변경 후 해당 행 업데이트
    });

    /*선택삭제 버튼 클릭시 */
    $("#chkDel").click(function() {
        // 선택된 체크박스를 찾아서 삭제 로직을 추가
        $("input[name=chk]:checked").closest("tr").remove();
        updateTotal(); // 항목 삭제 후 총 가격 업데이트
    });

    /*주문하기 버튼 클릭시 */
    $("#orderBtn").click(function() {
        // 주문 로직 추가
    });
});

function updateRow(row) {
    const menuCount = parseInt(row.find(".menuCount").val());
    const menuPriceString = row.find(".menuPrice").data("price"); // 데이터 속성에서 가격을 가져옴
    const menuPrice = parseInt(menuPriceString);

    const updatedPrice = menuCount * menuPrice;

    // 가격 입력란 업데이트
    row.find(".menuPrice").val(updatedPrice.toLocaleString() + "원"); // 가격에 콤마 추가

    // 적립 포인트 계산 및 업데이트
    const updatedPoint = updatedPrice * 0.05;
    row.find(".menuPoint").val(updatedPoint.toLocaleString() + "원"); // 포인트에 콤마 추가
    updateTotal(); // 총 가격 및 적립 포인트 업데이트
}

function updateTotal() {
    let totalPrice = 0;
    let totalPoint = 0;

    // 각 행을 순회하면서 계산
    $("tbody tr").each(function() {
        const menuCount = parseInt($(this).find(".menuCount").val());
        const menuPriceString = $(this).find(".menuPrice").data("price"); // 데이터 속성에서 가격을 가져옴
        const menuPrice = parseInt(menuPriceString);
        const menuPointString = $(this).find(".menuPoint").val().replace(/,/g, ""); // 콤마(,) 제거
        const menuPoint = parseInt(menuPointString);

        const rowTotalPrice = menuCount * menuPrice;
        totalPrice += rowTotalPrice;
        totalPoint += menuPoint;
        
        // 가격 입력란 업데이트
        $(this).find(".menuPrice").val(rowTotalPrice.toLocaleString() + "원"); // 각 행의 가격에 콤마 추가
    });

    // 계산 결과를 업데이트
    $("#totalPrice").val("총 가격: " + totalPrice.toLocaleString() + "원"); // 총 가격에 콤마 추가
    $("#totalPoint").val("총 적립 포인트: " + totalPoint.toLocaleString() + "원"); // 포인트에 콤마 추가
}

</script>
</head>

<body>
	<!-- Body 전체 container -->
	<div id="container">

		<div class="alert alert-primary" role="alert">
			<h1 class="alert-heading">장바구니</h1>
			<hr>
			<p class="mb-0">선택하신 상품 목록</p>
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
								<th scope="col"><input class="form-check-input" type="checkbox" id="chkAll" name="chkAll"></th>
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
								<td scope="row"><input class="form-check-input chk" type="checkbox" name="chk"></td>
								<!-- storeName -->
								<td>storeName</td>
								<!-- menuImg -->
								<td>menuImg</td>
								<!-- menuName -->
								<td>menuName</td>
								<!-- menuOption -->
								<td>menuOption</td>
								<!-- menuCount -->
								<td><input type="text" class="form-control menuCount" name="menuCount" value="1">
									<button class="btn btn-outline-secondary plusBtn" type="button" name="plusBtn">+</button>
									<button class="btn btn-outline-secondary minusBtn" type="button" name="minusBtn">-</button></td>
								<!-- menuPrice -->
								<td><input class="form-control menuPrice" data-price="3000" name="menuPrice" type="text" value="3,000원" readonly></td>
								<!-- menuPoint -->
								<td><input class="form-control menuPoint" name="menuPoint" type="text" value="150원" readonly></td>
								<!-- deleteBtn -->
								<td><button type="button" class="btn btn-danger deleteBtn">x</button></td>
							</tr>
							<tr>
								<!-- check box -->
								<td scope="row"><input class="form-check-input chk" type="checkbox" name="chk"></td>
								<!-- storeName -->
								<td>storeName</td>
								<!-- menuImg -->
								<td>menuImg</td>
								<!-- menuName -->
								<td>menuName</td>
								<!-- menuOption -->
								<td>menuOption</td>
								<!-- menuCount -->
								<td><input type="text" class="form-control menuCount" name="menuCount" value="1">
									<button class="btn btn-outline-secondary plusBtn" type="button" name="plusBtn">+</button>
									<button class="btn btn-outline-secondary minusBtn" type="button" name="minusBtn">-</button></td>
								<!-- menuPrice -->
								<td><input class="form-control menuPrice" data-price="3000" name="menuPrice" type="text" value="3,000원" readonly></td>
								<!-- menuPoint -->
								<td><input class="form-control menuPoint" name="menuPoint" type="text" value="150원" readonly></td>
								<!-- deleteBtn -->
								<td><button type="button" class="btn btn-danger deleteBtn">x</button></td>
							</tr>
						</tbody>
						<!-- tfoot  -->
						<tfoot>
							<tr>
								<td scope="row" colspan="6"><button type="button" class="btn btn-primary btn-lg">메뉴 둘러보기</button></td>
								<td><input class="form-control total" id="totalPrice" name="totalPrice" type="text" value="총 가격" aria-label="총 가격" readonly></td>
								<td colspan="1"><input class="form-control total" id="totalPoint" name="totalPoint" type="text" value="총 적립 포인트" aria-label="총가격포인트" readonly></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					<!-- 주문하기 버튼 -->
					<div>
						<button type="button" class="btn btn-primary btn-lg">주문 하기</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>