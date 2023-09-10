<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page js -->
<script type="text/javascript">
    $(document).ready(function () {
        // 페이지 로드시 초기 계산 수행
        updateTotal();

        // 수량 변경 시 계산 업데이트
        $(".cart_detail_menu_quantity").on("input", function () {
            updateTotal();
        });

        /*체크박스 전체 선택*/
        $("#chkAll").click(function () {
            $("input[name=chk]").prop("checked", this.checked);
        });

        /*체크박스 목록 전부 체크시 자동 전체선택 */
        $("input[name=chk]").click(function () {
            $("#chkAll").prop("checked", $("input[name=chk]").length === $("input[name=chk]:checked").length);
        });

        /*선택삭제 버튼 클릭시 */
        $("#chkDel").click(function () {
            $("input[name=chk]:checked").closest("tr").remove();
            updateTotal(); // 항목 삭제 후 총 가격 업데이트
        });

        /*주문하기 버튼 클릭시 */
        $("#orderBtn").click(function () {
            // 주문 로직 추가
        });

        /*메뉴 더 둘러보기 버튼 클릭시*/
        $("#menuListBtn").click(function () {
            location.href = "/cart/menuList";
        });
        /*메뉴 삭제*/
        $("#chkDel").click(function () {
            const selectedCheckboxes = $("input[name=chk]:checked");
            selectedCheckboxes.each(function () {
                const cartDetailNo = $(this).closest("tr").data("cart-detail-no");
                const rowElement = $(`tr[data-cart-detail-no="${cartDetailNo}"]`);

                $.ajax({
                    type: "POST",
                    url: "/cart/deleteCartItem",
                    data: { cartDetailNo: cartDetailNo },
                    success: function () {
                        rowElement.remove(); // 삭제 항목을 화면에서 삭제합니다.
                        updateTotal();
                    },
                    error: function () {
                        console.error("항목 삭제 중 오류가 발생했습니다.");
                    }
                });
            });
        });

    });
    function updateQuantity(cartDetailNo, operation) {
        $.ajax({
            type: "GET",
            url: "/cart/updateQuantity",
            data: { cartDetailNo: cartDetailNo, operation: operation },
            success: function (updatedQuantity) {
                // 성공적으로 업데이트된 수량을 받았을 때 실행할 코드
                // updatedQuantity를 사용하여 해당 행의 수량을 업데이트
                const quantityElement = $(`#cartDetailMenuQuantity_${cartDetailNo}`);
                quantityElement.text(updatedQuantity);
                updateTotal(); // 총 가격 및 포인트 업데이트
                console.log(`수량이 업데이트되었습니다: ${updatedQuantity}`);
                
                // 여기에서 추가 작업을 수행할 수 있습니다.
            },
            error: function () {
                // 오류 처리
                console.error("수량 업데이트 중 오류가 발생했습니다.");
            }
        });
    }


    function updateTotal() {
        let totalPrice = 0;
        let totalPoint = 0; // totalPoint 초기화

        // 각 행을 순회하면서 계산
        $("tbody tr").each(function () {
            const cartDetailMenuQuantity = parseInt($(this).find(".cart_detail_menu_quantity").val());
            const menuPriceString = $(this).find(".menuPrice").data("price"); // 데이터 속성에서 가격을 가져옴
            const menuPrice = parseInt(menuPriceString);
            const menuPointString = $(this).find(".menuPoint").val().replace(/,/g, ""); // 콤마(,) 제거
            const menuPoint = parseInt(menuPointString);

            const rowTotalPrice = cartDetailMenuQuantity * menuPrice;
            totalPrice += rowTotalPrice;
            totalPoint += menuPoint; // 총 적립 포인트 계산

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
			<div class="mb-0">사용자 장바구니 id : ${cartInfo.cart_id}</div>
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
								<th>번호</th>
								<th>매장명</th>
								<th>메뉴사진</th>
								<th>메뉴이름</th>
								<th>옵션</th>
								<th>수량</th>
								<th>가격</th>
								<th>적립포인트</th>
							</tr>
						</thead>
						<!-- 테이블 본문 내용 -->
						<tbody>
							<c:choose>
								<c:when test="${not empty cartDetailList}">
									<c:forEach items="${cartDetailList}" var="detail" varStatus="status">
										<!-- 장바구니 항목 행 -->
										<tr data-menu-no="${detail.menu_no}" data-cart-detail-no="${detail.cart_detail_no}">
											<td scope="row"><input class="form-check-input chk" type="checkbox" name="chk"></td>
											<td>${detail.cart_detail_no}</td>
											<td>${storeList[status.index].store_name}</td>
											<td>${menuList[status.index].menu_img}</td>
											<td>${menuList[status.index].menu_name}</td>
											<td>옵션</td>
											<td><span id="cartDetailMenuQuantity_${detail.cart_detail_no}">${detail.cart_detail_menu_quantity}</span>
												<button class="btn btn-outline-secondary plusBtn" onclick="updateQuantity(${detail.cart_detail_no}, 'plus')">+</button>
												<button class="btn btn-outline-secondary minusBtn" onclick="updateQuantity(${detail.cart_detail_no}, 'minus')">-</button></td>

											<td>${menuList[status.index].menu_price}원</td>
											<td><span class="menuPoint">포인트</span></td>


										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9" class="tac text-center">장바구니가 비어 있습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>



						<!-- tfoot  -->
						<tfoot>
							<tr>
								<td scope="row" colspan="7">
									<button id="menuListBtn" name="menuListBtn" type="button" class="btn btn-primary btn-lg">메뉴 더 둘러보기</button>
								</td>
								<td><input class="form-control total" id="totalPrice" name="totalPrice" type="text" value="총 가격" aria-label="총 가격" readonly></td>
								<td><input class="form-control total" id="totalPoint" name="totalPoint" type="text" value="총 적립 포인트" aria-label="총가격포인트" readonly></td>
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