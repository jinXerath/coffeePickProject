<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ include file="/WEB-INF/views/common/alertModal.jsp"%>

<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- Page JS -->
<script type="text/javascript">

	/** Import */
	var IMP = window.IMP;
	IMP.init("imp63623734");
	
	/** order_no 제작 함수 */
	var today = new Date();
	var hours = today.getHours().toString();
	var minutes = today.getMinutes().toString();
	var seconds = today.getSeconds().toString();
	var milliseconds = today.getMilliseconds().toString();
	var makeOrderNo = hours + minutes + seconds + milliseconds;
	
	/** 주문 완료 후 페이지 이동 함수*/
	function redirectToOrderDetailPage(order_no) {
		setTimeout(function() {
			window.location.href = "/order/orderDetail?order_no=" + order_no;
		}, 2000);
	}
	
	/* Import 결제 함수*/
	function requestPay() {
		/** 주문정보 배열 담기 */
		var kcpProducts = [];
		$("tr[data-cart-detail-no]").each(function() {
			const $row = $(this);
			const orderNumber = $row.data("cart-detail-no");
			const name = $row.find("td:eq(4)").text();
			const quantity = parseInt($row.find(".cartDetailMenuQuantity").text());
			const amount = parseInt($row.find(".cartDetailPrice").text().replace('원', '').replace(/,/g, ''));
			var orderInfo = {
				"name": name,
				"quantity": quantity,
				"amount": amount
			};
			kcpProducts.push(orderInfo);
		});
		
		/**결제 API 사용 */
		IMP.request_pay({
			pg: 'html5_inicis',
			pay_method: $("#paymentMethodText").val(),
			order_no: "order_no" +makeOrderNo,
			name: $(".cartDetailStoreName").text(),
			amount: parseInt($("#totalAmount").text().replace(/,/g, '')),
			m_redirect_url: "order/orderDetail",
			kcpProducts: kcpProducts,
			buyer_email: "${memberInfo.member_email}",
			buyer_name: "${memberInfo.member_name}",
			buyer_tel: "${memberInfo.member_phone}",
			buyer_addr: "${memberInfo.member_addr}"
		}, function(rsp) {
			if (rsp.success) {
				/** 결제 데이터 검증 */
				$.ajax({
					type: "POST",
					url: "/verifyIamport/" + rsp.imp_uid
				}).done(function(data) {
				    /** 결제 데이터 검증 성공시 */
					if (rsp.paid_amount == data.response.amount) {
					
					    MsgBox.Alert("결제가 완료되었습니다");
				
						/** 결제관련 데이터 전송하여 DB 등록 */
						$.ajax({
							type: "POST",
							url: "/order/payMent",
							contentType: "application/json",
							data: JSON.stringify({
								order_no: rsp.order_no,
								basicPrice: parseInt($("#totalPrice").text().replace(/,/g, '')),
								usePoint: parseInt($("#Point").val().replace(/,/g, '')),
								request: $("#requestText").val(),
								method: $("#paymentMethodText").val(),
								storeId: $("td:eq(0)", "tr[data-cart-detail-no]:first").text(),
								storeName: $("td:eq(1)", "tr[data-cart-detail-no]:first").text(),
								storePhone: $("td:eq(2)", "tr[data-cart-detail-no]:first").text(),
								storeAddr: $("td:eq(3)", "tr[data-cart-detail-no]:first").text(),
								userId: $("#userId").text(),
								chargePoint: $("#earnedPoint").val(),
								usePickmoney: $("#usePickmoney").val(),
								order_detail: kcpProducts
							}),
							success: function(data) {
								MsgBox.Alert("감사합니다! 결제가 완료되었습니다 ! ");
							},
							error: function(xhr, status, error) {
								MsgBox.Alert("결제 데이터 전송 중 오류가 발생했습니다");
							}
						});
					     
						   redirectToOrderDetailPage(rsp.order_no);
				            } else {
				                var msg = '결제에 실패하였습니다.';
				                msg += '에러내용 : ' + rsp.error_msg;
				                MsgBox.Alert(msg);
				            }
				        });
				    }
				});
	}
	
	/** 포인트,픽머니 결제시 사용 */
	function pickmoenyPointPay() {
		/**주문정보 배열 담기*/
		var kcpProducts = [];
		$("tr[data-cart-detail-no]").each(function() {
			const $row = $(this);
			const orderNumber = $row.data("cart-detail-no");
			const name = $row.find("td:eq(4)").text();
			const quantity = parseInt($row.find(".cartDetailMenuQuantity").text());
			const amount = parseInt($row.find(".cartDetailPrice").text().replace('원', '').replace(/,/g, ''));
			var orderInfo = {
				"name": name,
				"quantity": quantity,
				"amount": amount
			};
			kcpProducts.push(orderInfo);
		});
		
		$.ajax({
			type: "POST",
			url: "/order/pickmoneyPayment",
			contentType: "application/json",
			data: JSON.stringify({
				order_no:  "order_no" +makeOrderNo,
				basicPrice: parseInt($("#totalPrice").text().replace(/,/g, '')),
				usePoint: parseInt($("#Point").val().replace(/,/g, '')),
				request: $("#requestText").val(),
				method: $("#paymentMethodText").val(),
				storeName: $("td:eq(0)", "tr[data-cart-detail-no]:first").text(),
				storePhone: $("td:eq(1)", "tr[data-cart-detail-no]:first").text(),
				storeAddr: $("td:eq(2)", "tr[data-cart-detail-no]:first").text(),
				userId: $("#userId").text(),
				chargePoint: $("#earnedPoint").val(),
				usePickmoney: $("#usePickmoney").val(),
				order_detail: kcpProducts
			}),
			success: function(data) {
				MsgBox.Alert("감사합니다! 결제가 완료되었습니다 ! ");
				redirectToOrderDetailPage("order_no" +makeOrderNo);
			},
			error: function(xhr, status, error) {
				alert("결제 데이터 전송 중 오류가 발생했습니다");
				console.error(xhr.responseText);
				console.error(status);
				console.error(error);
			}
		});
	}
	// 함수: 가격 및 포인트 업데이트
	function updatePriceAndPoint() {

		let totalPrice = 0;
		let totalPoint = 0;
		$("tr[data-cart-detail-no]").each(function() {
			const $row = $(this);
			const quantity = parseInt($row.find(".cartDetailMenuQuantity").text());
			const price = parseInt($row.find("td.cartDetailPrice").text().replace('원', '').replace(/,/g, ''));
			const point = Math.floor(price * 0.05 * quantity);
			totalPoint += point;
			const total = quantity * price;
			$row.find("td.cartDetailTotal").text(total.toLocaleString());
			$row.find("td.cartDetailPoint").text(point.toLocaleString());
			totalPrice += total;
		});
		// 총 가격과 총 예상 적립 포인트를 업데이트
		$("#totalPrice").text(totalPrice.toLocaleString());
		$("#usePickmoney").val(totalPrice.toLocaleString());
		$("#totalPoint").text(totalPoint.toLocaleString());
		$("#totalAmount").text(totalPrice.toLocaleString());
		$("#earnedPoint").val(totalPoint.toLocaleString());
	}
	$(function() {
		updatePriceAndPoint();
		/**가게정보 열 병합 */
		var rowCount = document.querySelectorAll('tr[data-menu-no]').length;
		var tdElements = document.querySelectorAll('.cartDetailStoreId, .cartDetailStoreName, .cartDetailStorePhone, .cartDetailStoreAddr');
		// 각 <td> 요소에 rowspan 속성 설정
		tdElements.forEach(function(td) {
			td.setAttribute('rowspan', rowCount);
		});
		/**결제 수단 변경시 (픽머니화면) 이벤트 */
		$("#paymentMethodText").change(function() {
			var selectedMethod = $(this).val();
			if (selectedMethod === "2") {
				$(".pickMoneyPayment").removeClass("visually-hidden");
			} else {
				$(".pickMoneyPayment").addClass("visually-hidden");
			}
		});
		/**결제하기 버튼 클릭시 이벤트 */
		$("#paymentBtn").click(function() {
			const paymentMethodText = $("#paymentMethodText").val();
			if (paymentMethodText === "0") {
				MsgBox.Alert("결제 방법을 선택하세요");
			} else if (paymentMethodText === "1") {
				requestPay();
			} else if (paymentMethodText === "2") {
				const usePickmoney = parseFloat($("#usePickmoney").val().replace(/,/g, ''));
				const pickmoneyTotal = parseFloat("${pickmoneyInfo.pickmoney_total}".replace(/,/g, ''));
				if (usePickmoney > pickmoneyTotal) {
					MsgBox.Alert("사용픽머니가 보유 픽머니보다 적습니다");
				} else {
					confirm("픽머니 결제를 진행하시겠습니까?");
					pickmoenyPointPay();
				}
			} else if (paymentMethodText === "3") {
				if (!$("#totalPrice").text() == $("#usePoint").val()) {
					MsgBox.Alert("포인트결제는 결제가격만큼 포인트를 사용하셔야 가능합니다");
				} else {
					confirm("픽머니 결제를 진행하시겠습니까?");
					pickmoenyPointPay();
				}
			}
		});
		/** 사용 포인트 확인 버튼 클릭시 */
		$("#point-table button.btn-primary").click(function() {
			let havePoint = ${pointInfo.point_total};
			let earnedPoint = parseFloat($("#earnedPoint").val().replace(/,/g, ''));
			let usePoint = parseFloat($("#usePoint").val().replace(/,/g, ''));
			let totalPoint = havePoint + earnedPoint;
			let totalPrice = parseFloat($("#totalPrice").text().replace(/,/g, ''));
			if (usePoint > totalPrice) {
				// 사용 포인트가 총 가격보다 큰 경우
				usePoint = totalPrice;
			}
			let totalAmount = totalPrice - usePoint;
			if (!isNaN(usePoint) && usePoint <= totalPoint) {
				let textPoint = usePoint;
				$(".alert.alert-danger").addClass("visually-hidden");
				$("#Point").val(textPoint.toLocaleString());
				$("#pointText").text("");
				$("#totalAmount").text(totalAmount);
			} else {
				$(".alert.alert-danger").removeClass("visually-hidden");
				$("#usePoint").focus();
			}
		});
		/**장바구니로 버튼 클릭시 이벤트 */
		$("#backToCartBtn").click(function() {
			window.location.href = "/cart/list"; // 장바구니로 이동할 페이지 URL을 여기에 입력합니다.
		});
		/**환불 구현*/
		
	});
</script>
<!-- Page CSS -->
<link href="/resources/include/css/user/order.css" rel="stylesheet" />
</head>

<body>


    <!--  Main -->

    <div class="container bootstrap snippets bootdey">
        <!-- Section-Title  -->
        <section class="title">
            <h1>주문/결제</h1>
            <div class="small text-muted">사용자 장바구니 id : ${cartInfo.cart_id}</div>
            <hr>

        </section>


        <div class="row">
            <div class="col-lg-12">
                <div class="main-box no-header clearfix">
                    <div class="main-box-body clearfix">
                        <div class="table-responsive">
                            <table class="table order-list">
                                <thead class="thead">
                                    <tr>
                                        <th>매장Id</th>
                                        <th>매장명</th>
                                        <th>매장번호</th>
                                        <th>매장주소</th>
                                        <th>메뉴사진</th>
                                        <th>상품명</th>
                                        <th>수량</th>
                                        <th>개당가격</th>
                                        <th>가격</th>
                                        <th>예상적립포인트</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody">
                                    <c:choose>
                                        <c:when test="${not empty cartDetailList}">
                                            <c:forEach items="${cartDetailList}" var="detail" varStatus="status">
                                                <!-- 장바구니 항목 행 -->
                                                <tr data-menu-no="${detail.menu_no}" data-cart-detail-no="${detail.cart_detail_no}">
                                                    <c:if test="${status.index == 0}">
                                                        <td class="cartDetailStoreId">${storeList[status.index].store_id}</td>
                                                        <td class="cartDetailStoreName">${storeList[status.index].store_name}</td>
                                                        <td class="cartDetailStorePhone">${storeList[status.index].store_phone}</td>
                                                        <td class="cartDetailStoreAddr">${storeList[status.index].store_addr}</td>
                                                        <td class="cartDetailMenuImg">${menuList[status.index].menu_img}</td>
                                                        <td class="cartDetailMenuName">${menuList[status.index].menu_name}</td>
                                                        <td class="cartDetailMenuQuantity">${detail.cart_detail_menu_quantity}</td>
                                                        <td class="cartDetailPrice">${menuList[status.index].menu_price}원</td>
                                                        <td class="cartDetailTotal"></td>
                                                        <td class="cartDetailPoint"></td>
                                                    </c:if>
                                                    <c:if test="${status.index > 0}">

                                                        <td class="cartDetailMenuImg">${menuList[status.index].menu_img}</td>
                                                        <td class="cartDetailMenuName">${menuList[status.index].menu_name}</td>
                                                        <td class="cartDetailMenuQuantity">${detail.cart_detail_menu_quantity}</td>
                                                        <td class="cartDetailPrice">${menuList[status.index].menu_price}원</td>
                                                        <td class="cartDetailTotal"></td>
                                                        <td class="cartDetailPoint"></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="10" class="tac text-center">장바구니가 비어 있습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>


                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="6"></td>
                                        <td>총 가격:</td>
                                        <td id="totalPrice">0</td>
                                        <td>총 예상적립포인트:</td>
                                        <td id="totalPoint">0</td>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>





        <div id="list">
            <!-- 요청사항 -->
            <table class="table table-bordered" id="request-table">
                <tr>
                    <td>요청사항</td>
                    <td><textarea class="form-control" id="requestText" name="requestText"></textarea></td>
                </tr>

            </table>

            <!-- 포인트 -->
            <table class="table table-bordered table-sm" id="point-table">
                <tr>
                    <td>보유포인트</td>
                    <td colspan="2">${pointInfo.point_total}</td>
                </tr>
                <tr>
                    <td>총 적립예정포인트</td>
                    <td colspan="2"><input class="form-control" id="earnedPoint" name="earnedPoint" type="text" value="${totalPoint.toLocaleString()}원" readonly></td>
                </tr>

                <tr>
                    <td>사용포인트 <br /> <span class="small text-muted">포인트결제를 통하여 결제가 가능합니다</span>
                    </td>
                    <td><input class="form-control" type="text" id="usePoint" name="usePoint" placeholder="숫자를 입력하세요">
                        <button type="button" class="btn btn-primary">확인</button></td>
                </tr>
                <tr>
                    <td>사용예정포인트</td>
                    <td><input class="form-control" id="Point" name="Point" type="text" value="0" readonly></td>
                </tr>
                <tr>
                    <td>예상결제가격</td>
                    <td id="totalAmount"></td>
                </tr>
            </table>
            <table class="table table-bordered table-sm" id="payment-table">
                <tr>
                    <td colspan="3">결제수단 선택</td>
                </tr>
                <tr>
                    <td class="small text-muted">버튼 그룹 클릭하여 결제 이동으로 변경?</td>
                    <td>
                        <div class="btn-group" role="group" aria-label="Basic outlined example">
                            <button type="button" class="btn btn-outline-primary">
                                <i class="fa-solid fa-credit-card"></i> 카드 결제
                            </button>
                            <button type="button" class="btn btn-outline-primary">
                                <i class="fa-solid fa-p"></i> 픽머니 결제
                            </button>
                            <button type="button" class="btn btn-outline-primary">
                                <i class="fa-solid fa-star"></i> 포인트 결제
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>

                    <td colspan="3"><select id="paymentMethodText" class="form-select form-select-lg mb-3">
                            <option value="0">선택하세요</option>
                            <option value="1">카드</option>
                            <option value="2">픽머니</option>
                            <option value="3">포인트결제</option>
                        </select></td>
                </tr>

                <!-- 픽머니 결제 영역 -->
                <tr class="visually-hidden pickMoneyPayment">
                    <td colspan="2"><%@ include file="/WEB-INF/views/mypage/pickmoneyCharge.jsp"%></td>
                </tr>


                <tr class="visually-hidden pickMoneyPayment">
                    <td>사용 픽머니</td>
                    <td><input class="form-control" type="text" id="usePickmoney" name="usePickmoney" readonly></td>
                </tr>


            </table>
        </div>
        <div id="buttons">
            <button id="paymentBtn" type="button" class="btn btn-primary">결제하기</button>
            <button id="backToCartBtn" type="button" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> 장바구니로</button>
        </div>
       </div>


</body>

</html>