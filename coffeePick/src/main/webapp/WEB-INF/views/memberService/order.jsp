<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- Page JS -->
<!--  <script src="/resources/include/js/order.js"></script>-->
<script type="text/javascript">
    var IMP = window.IMP;
    IMP.init("imp63623734");

    var today = new Date();
    var hours = today.getHours().toString();
    var minutes = today.getMinutes().toString();
    var seconds = today.getSeconds().toString();
    var milliseconds = today.getMilliseconds().toString();

    var makeMerchantUid = hours + minutes + seconds + milliseconds;
 // 주문 완료 페이지로의 이동 함수
    function redirectToOrderEndPage(merchantUid) {
      setTimeout(function() {
        window.location.href = "/order/orderEnd?merchant_uid=" + merchantUid;
      }, 2000); // 2000 밀리초 = 2초
    }
    function requestPay() {

        
          
        /*주문정보 배열 담기*/
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



        /*결제 API 사용 */
        IMP.request_pay({
                pg: 'html5_inicis.INIBillTst',
                pay_method: $("#paymentMethodResult").text(),
                merchant_uid: "order_" + makeMerchantUid,
                name: $(".cartDetailStoreName").text(),
                amount: parseInt($("#totalAmount").text().replace(/,/g, '')),
                m_redirect_url: "order/orderEnd",
                kcpProducts: kcpProducts,
                buyer_email: "${memberInfo.member_email}",
                buyer_name: "${memberInfo.member_name}",
                buyer_tel: "${memberInfo.member_phone}",
                buyer_addr: "${memberInfo.member_addr}"
            },
            function(rsp) {
                /*결제 성공 시*/
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';

                    // 결제검증
                    $.ajax({
                        type: "POST",
                        url: "/verifyIamport/" + rsp.imp_uid
                    }).done(function(data) {
                        if (rsp.paid_amount == data.response.amount) {
                            alert("결제 및 결제검증완료");

                            // 결제 성공 시 비즈니스 로직

                            /*결제관련 데이터 전송*/
                            $.ajax({
                                type: "POST",
                                url: "/order/payMent",
                                contentType: "application/json",
                                data: JSON.stringify({
                                    merchant_uid: rsp.merchant_uid,
                                    basicPrice: parseInt($("#totalPrice").text().replace(/,/g, '')),
                                    usePoint: parseInt($("#Point").val().replace(/,/g, '')),
                                    request: $("#requestText").val(),
                                    method: $("#paymentMethodText").val(),
                                    storeName: $("td:eq(0)", "tr[data-cart-detail-no]:first").text(),
                                    storePhone: $("td:eq(1)", "tr[data-cart-detail-no]:first").text(),
                                    storeAddr: $("td:eq(2)", "tr[data-cart-detail-no]:first").text(),
                                    userId: $("#userId").text(),
                                    order_detail: kcpProducts
                                }),
                            });

      
                            redirectToOrderEndPage(rsp.merchant_uid);
                        } else {
                            var msg = '결제에 실패하였습니다.';
                            msg += '에러내용 : ' + rsp.error_msg;
                            alert(msg);
                        }
                    });
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                    }
                
                });
        };
     
        
        // 함수: 가격 및 포인트 업데이트
        function updatePriceAndPoint() {
            let totalPrice = 0;
            let totalPoint = 0;

            $("tr[data-cart-detail-no]").each(
                function() {
                    const $row = $(this);
                    const quantity = parseInt($row.find(
                        ".cartDetailMenuQuantity").text());
                    const price = parseInt($row.find("td.cartDetailPrice")
                        .text().replace('원', '').replace(/,/g, ''));

                    const point = Math.floor(price * 0.05 * quantity);
                    totalPoint += point;

                    const total = quantity * price;
                    $row.find("td.cartDetailTotal")
                        .text(total.toLocaleString());
                    $row.find("td.cartDetailPoint")
                        .text(point.toLocaleString());
                    totalPrice += total;
                });

            // 총 가격과 총 예상 적립 포인트를 업데이트
            $("#totalPrice").text(totalPrice.toLocaleString());
            $("#totalPoint").text(totalPoint.toLocaleString());
            $("#totalAmount").text(totalPrice.toLocaleString());
            $("#earnedPoint").val(totalPoint.toLocaleString());

        }

        $(function() {
            updatePriceAndPoint();

            $("#paymentBtn").click(function() {
                
                
                const paymentMethodText = $("#paymentMethodText").val();
                if (paymentMethodText === "0") { // 0은 선택되지 않은 상태
                    alert("결제 방법을 선택하세요.");
                    return; 
                }
                requestPay()
            });

            /* 결제수단 선택 버튼 클릭시 */
            $("#paymentMethodBtn").click(function() {
                const paymentMethodText = $("#paymentMethodText").val();
                let paymentMethod = ""; // 결제수단을 저장할 변수

                if (paymentMethodText === "1") { // 값이 문자열 "1"인 경우
                    paymentMethod = "카드";
                } else if (paymentMethodText === "2") { // 값이 문자열 "2"인 경우
                    paymentMethod = "픽머니";
                } else {
                    // 다른 경우에 대한 처리 (예: 오류 처리)
                    paymentMethod = "";
                }

                // 결제수단을 입력란에 설정
                $("#paymentMethodResult").val(paymentMethod);
            });

            /* 사용 포인트 확인 버튼 클릭시 */
            $("#point-table button.btn-primary")
                .click(
                    function() {
                        const havePoint = parseFloat($("#havePoint").val()
                            .replace(/,/g, ''));
                        const earnedPoint = parseFloat($("#earnedPoint")
                            .val().replace(/,/g, ''));
                        const usePoint = parseFloat($("#usePoint").val()
                            .replace(/,/g, ''));

                        const totalPoint = havePoint + earnedPoint;
                        const totalPrice = parseFloat($("#totalPrice")
                            .text().replace(/,/g, ''));
                        const totalAmount = totalPrice - totalPoint;

                        if (!isNaN(usePoint) && usePoint <= totalPoint) {
                            const textPoint = Math.floor(usePoint / 10) * 10;
                            $(".alert.alert-danger").addClass(
                                "visually-hidden");
                            $("#Point").val(textPoint.toLocaleString());
                            $("#pointText").text("");
                            $("#totalAmount").text(totalAmount);

                        } else {
                            $(".alert.alert-danger").removeClass(
                                "visually-hidden");
                            $("#usePoint").val(""); // 사용 포인트 입력란 비우기
                            $("#usePoint").focus(); // 사용 포인트 입력란에 포커스 설정
                        }

                    });
            $("#backToCartBtn").click(function() {
                // 여기에 장바구니로 이동하는 코드를 작성합니다.
                window.location.href = "/cart/list"; // 장바구니로 이동할 페이지 URL을 여기에 입력합니다.
            });

        });
</script>
<!-- Page CSS -->
<style></style>
</head>

<body>



    <!-- Section-Title  -->
    <section class="title">
        <h1>주문/결제</h1>
        <hr>
        <div class="mb-0">사용자 장바구니 id : ${cartInfo.cart_id}</div>
        <hr>
    </section>



    <!--  Main -->
    <main>
        <!-- Main-orderList -->
        <div id="order-list">
            <form id="order-form">
                <table class="table order-list">
                    <thead class="thead table-secondary">
                        <tr>
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
                                        <td class="cartDetailStoreName">${storeList[status.index].store_name}</td>
                                        <td class="cartDetailStorePhone">${storeList[status.index].store_phone}</td>
                                        <td class="cartDetailStoreAddr">${storeList[status.index].store_addr}</td>
                                        <td class="cartDetailMenuImg">${menuList[status.index].menu_img}</td>
                                        <td class="cartDetailMenuName">${menuList[status.index].menu_name}</td>
                                        <td class="cartDetailMenuQuantity">${detail.cart_detail_menu_quantity}</td>
                                        <td class="cartDetailPrice">${menuList[status.index].menu_price}원</td>
                                        <td class="cartDetailTotal"></td>
                                        <td class="cartDetailPoint"></td>
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
                            <td colspan="5"></td>
                            <td>총 가격:</td>
                            <td id="totalPrice">0</td>
                            <td>총 예상적립포인트:</td>
                            <td id="totalPoint">0</td>
                    </tfoot>
                </table>

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
                            <td colspan="2"><input class="form-control" id="havePoint" name="totalPoint" type="text" value="0" readonly></td>
                        </tr>
                        <tr>
                            <td>총 적립예정포인트</td>
                            <td colspan="2"><input class="form-control" id="earnedPoint" name="earnedPoint" type="text" value="${totalPoint.toLocaleString()}원" readonly></td>
                        </tr>

                        <tr>
                            <td>사용포인트 <br /> /*포인트는 10단위까지 사용가능합니다*/
                            </td>
                            <td>
							    <input class="form-control" type="text" id="usePoint" name="usePoint"placeholder="숫자를 입력하세요">
							    <div class="alert alert-danger visually-hidden" role="alert">사용포인트는 보유포인트와 총 적립예정 포인트의 합 보다 높을 수 없습니다!</div>
							    <button type="button" class="btn btn-primary">확인</button>
							</td>


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
                            <td colspan="2">
	                            <select id="paymentMethodText" class="form-select form-select-lg mb-3">
									    <option value="0">선택하세요</option>
									    <option value="1">카드</option>
									    <option value="2">픽머니</option>
								</select>
					 		</td>
					 		<td>
                            	<button id="paymentMethodBtn" type="button" class="btn btn-primary">확인</button>
                           	</td>
                        </tr>
                        <tr>
                            <td>선택한 결제수단</td>
                            <td><input class="form-control" id="paymentMethodResult" type="text" readonly></td>
                        	<td></td>
                        </tr>

                        <!-- 픽머니 결제 영역 -->
                        <tr class="visually-hidden pickMoneyPayment">
                            <td colspan="1">픽머니결제 클릭시 나오는페이지 카카오페이/카드는 결제완료버튼클릭시 해당api이동</td>
                            <td><button type="button" class="btn btn-info">픽머니충전</button></td>
                        </tr>
                        <tr class="visually-hidden pickMoneyPayment ">
                            <td>보유 픽머니</td>
                            <td><input class="form-control" type="text" id="totalPickmoney" name="totalPickmoney" value="0" readonly></td>
                        </tr>

                        <tr class="visually-hidden pickMoneyPayment">
                            <td>사용 픽머니</td>
                            <td><input class="form-control" type="text" id="usePickmoney" name="usePickmoney" placeholder="0"></td>
                        </tr>


                    </table>
                </div>
                <div id="buttons">
                    <button id="paymentBtn" type="button" class="btn btn-primary">결제하기</button>
                    <button id="backToCartBtn" type="button" class="btn btn-primary">장바구니로</button>
                </div>
            </form>
        </div>
    </main>
</body>

</html>