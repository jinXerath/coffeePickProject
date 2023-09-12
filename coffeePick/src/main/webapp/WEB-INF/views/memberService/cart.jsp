<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page js -->
<script type="text/javascript">
    $(function() {
        updatePriceAndPoint();
        /*체크박스 전체 선택*/
        $("#chkAll").click(function() {
            $("input[name=chk]").prop("checked", this.checked);
        });
        /*체크박스 목록 전부 체크시 자동 전체선택 */
        $("input[name=chk]")
                .click(
                        function() {
                            $("#chkAll")
                                    .prop(
                                            "checked",
                                            $("input[name=chk]").length === $("input[name=chk]:checked").length);
                        });
        /*메뉴 더 둘러보기 버튼 클릭시*/
        $("#menuListBtn").click(function() {
            location.href = "/cart/menuList";
        });
        /*선택 삭제 버튼 클릭시*/
        $("#chkDel").click(function() {
            deleteSelectedItems();
        });
        /*Plus 버튼 클릭 시*/
        $(".plusBtn").click(function() {
            let $row = $(this).closest("tr");
            let cartDetailNo = $row.data("cart-detail-no");
            count("plus", cartDetailNo);
            updatePriceAndPoint();
        });
        /*Minus 버튼 클릭 시*/
        $(".minusBtn").click(function() {
            let $row = $(this).closest("tr");
            let cartDetailNo = $row.data("cart-detail-no");

            count("minus", cartDetailNo);
            updatePriceAndPoint();
        });
        /*주문하기 버튼 클릭 시*/
        $("#orderBtn").click(function() {
            location.href = "/order/main";
        });

    });

    /*수량 제어 함수*/
    function count(type, cartDetailNo) {
        let targetRow = $("tr[data-cart-detail-no='" + cartDetailNo + "']");
        let quantitySpan = targetRow.find("span#cartDetailMenuQuantity");
        let currentQuantity = parseInt(quantitySpan.text());

        if (type === "plus") {
            currentQuantity += 1;
        } else if (type === "minus" && currentQuantity > 1) {
            currentQuantity -= 1;
        }

        quantitySpan.text(currentQuantity);

        updatePriceAndPoint();

        updateMenuQuantity(cartDetailNo, currentQuantity);
    }
    /* 가격 , 포인트 화면 업데이트 함수*/
    function updatePriceAndPoint() {
        let totalPrice = 0;
        let totalPoint = 0;

        $("tr[data-cart-detail-no]").each(
                function() {
                    const $row = $(this);
                    const quantity = parseInt($row.find(
                            "span#cartDetailMenuQuantity").text());
                    const price = parseInt($row.find("td.cartDetailPrice")
                            .text().replace('원', '').replace(/,/g, '')); // 쉼표(,) 제거 추가

                    const point = Math.floor(price * 0.05 * quantity);
                    totalPoint += point;

                    const total = quantity * price;
                    $row.find("td.cartDetailTotal").text(
                            total.toLocaleString() + '원');
                    $row.find("td.cartDetailPoint")
                            .text(point.toLocaleString());
                    totalPrice += total;
                });

        $("#totalPrice").val(totalPrice.toLocaleString() + '원'); // 쉼표(,) 추가
        $("#totalPoint").val(totalPoint.toLocaleString() + '원'); // 쉼표(,) 추가
    }

    /*수량 서버 업데이트 함수*/
    function updateMenuQuantity(cartDetailNo, cartDetailMenuQuantity) {
        $.ajax({
            type : "GET",
            url : "/cart/updateQuantity",
            data : {
                cartDetailNo : cartDetailNo,
                cartDetailMenuQuantity : cartDetailMenuQuantity
            },
            success : function(response) {
            },
            error : function() {
                alert("메뉴 수량 업데이트 중 오류가 발생했습니다.");
            }
        });
    }

    /*장바구니 삭제 제어 함수*/
    function deleteSelectedItems() {
        const selectedCheckboxes = $("input[name=chk]:checked");
        selectedCheckboxes.each(function() {
            const cartDetailNo = $(this).closest("tr").data("cart-detail-no");
            const rowElement = $(`tr[data-cart-detail-no="${cartDetailNo}"]`);

            $.ajax({
                type : "POST",
                url : "/cart/deleteCartItem",
                data : {
                    cartDetailNo : cartDetailNo
                },
                success : function() {
                    rowElement.remove();
                    location.reload();
                },
                error : function() {
                    alert("항목 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    }
</script>
</head>

<body>
	<!-- Body 전체 container -->
	<div id="container">

		<div class="alert alert-primary" role="alert">
			<h1 class="alert-heading">장바구니</h1>
			<hr>
			<div class="mb-0">
				사용자 장바구니 id :
				<div id="cart_id" name="cart_id">${cartInfo.cart_id}</div>

			</div>
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
								<th class="visually-hidden">가게 이름</th>
								<th class="visually-hidden">가게 번호</th>
								<th>메뉴 사진</th>
								<th>메뉴 이름</th>
								<th>수량</th>
								<th>개당 가격</th>
								<th>가격</th>
								<th>예상 적립 포인트</th>
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
											<td class="visually-hidden cartDetailStoreName">${storeList[status.index].store_name}</td>
											<td class="visually-hidden cartDetailStorePhone">${storeList[status.index].store_phone}</td>
											<td class="cartDetailMenuImg">${menuList[status.index].menu_img}</td>
											<td class="cartDetailMenuName">${menuList[status.index].menu_name}</td>
											<td><span id="cartDetailMenuQuantity"> ${detail.cart_detail_menu_quantity}</span>
												<div class="btn-group" role="group">
													<button type="button" class="btn btn-light plusBtn">+</button>
													<button type="button" class="btn btn-light minusBtn">-</button>
												</div></td>
											<td class="cartDetailPrice">${menuList[status.index].menu_price}원</td>
											<td class="cartDetailTotal"></td>
											<td class="cartDetailPoint"></td>
											
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
								<td scope="row" colspan="4">
									<button id="menuListBtn" name="menuListBtn" type="button" class="btn btn-primary btn-lg">메뉴 더 둘러보기</button>
								</td>
								<td>총 가격:</td>
								<td><input class="form-control total" id="totalPrice" name="totalPrice" type="text" readonly></td>
								<td>총 예상적립포인트:</td>
								<td><input class="form-control total" id="totalPoint" name="totalPoint" type="text" readonly></td>
							</tr>
						</tfoot>
					</table>

					<!-- 주문하기 버튼 -->
					<div>
						<button id="orderBtn" name="orderBtn" type="button" class="btn btn-primary btn-lg">주문 하기</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>

</html>