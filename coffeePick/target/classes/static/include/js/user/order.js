var IMP = window.IMP;
    IMP.init("imp67011510");

    var today = new Date();
    var hours = today.getHours().toString();
    var minutes = today.getMinutes().toString();
    var seconds = today.getSeconds().toString();
    var milliseconds = today.getMilliseconds().toString();

    var makeMerchantUid = hours + minutes + seconds + milliseconds;

    function requestPay() {

        var kcpProducts = []; // 주문 정보 배열 초기화

        $("tr[data-cart-detail-no]").each(
                function() {
                    const $row = $(this);
                    const orderNumber = $row.data("cart-detail-no"); // 장바구니 상세 번호
                    const name = $row.find("td:eq(4)").text();
                    const quantity = parseInt($row.find(
                            "span#cartDetailMenuQuantity").text()); // 수량
                    const amount = parseInt($row.find("td.cartDetailPrice")
                            .text().replace('원', '').replace(/,/g, '')); // 가격

                    // 주문 정보를 객체로 생성하여 배열에 추가
                    var orderInfo = {
                        "name" : name,
                        "quantity" : quantity,
                        "amount" : amount
                    };

                    kcpProducts.push(orderInfo);
                });
        console.log(kcpProducts);
        var totalPrice = parseInt($("#totalPrice").text().replace(/,/g, ''));
        var point = parseInt($("#Point").text().replace(/,/g, ''));

        IMP
                .request_pay(
                        {
                            pg : 'html5_inicis',
                            pay_method : $("#paymentMethodResult").text(),
                            merchant_uid : "order_" + makeMerchantUid,
                            name : $("#storeName").text(),
                            amount : parseInt($("#totalAmount").text().replace(
                                    /,/g, '')),
                            kcpProducts : kcpProducts,
                            buyer_email : "${memberInfo.member_email}",
                            buyer_name : "${memberInfo.member_name}",
                            buyer_tel : "${memberInfo.member_phone}",
                            buyer_addr : "${memberInfo.member_addr}"
                        },
                        function(rsp) {
                            console.log(rsp);

                            //결제 성공 시
                            if (rsp.success) {
                                var msg = '결제가 완료되었습니다.';

                                console.log($("#totalPrice").text().replace(
                                        /,/g, ''));
                                $
                                        .ajax({
                                            type : "POST",
                                            url : "/order/payMent",
                                            contentType : "application/json", // Content-Type 설정
                                            data : JSON
                                                    .stringify({
                                                        merchant_uid : rsp.merchant_uid,
                                                        basicPrice : parseInt($(
                                                                "#totalPrice")
                                                                .text()
                                                                .replace(/,/g,
                                                                        '')),
                                                        usePoint : parseInt($(
                                                                "#Point").val()
                                                                .replace(/,/g,
                                                                        '')),
                                                        request : $(
                                                                "#requestText")
                                                                .val(),
                                                        method : $(
                                                                "#paymentMethodText")
                                                                .val(),
                                                        storeName : $(
                                                                "td:eq(0)",
                                                                "tr[data-cart-detail-no]:first")
                                                                .text(),
                                                        storePhone : $(
                                                                "td:eq(1)",
                                                                "tr[data-cart-detail-no]:first")
                                                                .text(),
                                                        storeAddr : $(
                                                                "td:eq(2)",
                                                                "tr[data-cart-detail-no]:first")
                                                                .text(),
                                                        userId : $("#userId")
                                                                .text(),
                                                        order_detail : kcpProducts
                                                    }),
                                        })

                                window.location.href = "/order/orderDetail?merchant_uid="
                                        + rsp.merchant_uid;
                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += '에러내용 : ' + rsp.error_msg;
                            }
                            alert(msg);
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
                            "span#cartDetailMenuQuantity").text());
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
                paymentMethod = "알 수 없음";
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

    });