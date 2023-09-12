<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page JS -->
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- jQuery -->

<script type="text/javascript">
    
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

         $("tr[data-cart-detail-no]").each(function() {
             const $row = $(this);
             const orderNumber = $row.data("cart-detail-no"); // 장바구니 상세 번호
             const name = $row.find("td:eq(3)").text(); // 상품명
             const quantity = parseInt($row.find("span#cartDetailMenuQuantity").text()); // 수량
             const amount = parseInt($row.find("td.cartDetailPrice").text().replace('원', '').replace(/,/g, '')); // 가격

             // 주문 정보를 객체로 생성하여 배열에 추가
             var orderInfo = {
                 "orderNumber": orderNumber,
                 "name": name,
                 "quantity": quantity,
                 "amount": amount
             };

             kcpProducts.push(orderInfo);
         });
         console.log(kcpProducts);
       IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : $("#paymentMethodResult").text(),
        merchant_uid: "order_"+makeMerchantUid,
        name : $("#storeName").text(),
        amount : 100,//$("#totalPrice").text().replace(/,/g, ''),
        kcpProducts : kcpProducts,
        buyer_email : "${memberInfo.member_email}",
        buyer_name : "${memberInfo.member_name}",
        buyer_tel : "${memberInfo.member_phone}",
        buyer_addr :"${memberInfo.member_addr}"
    
       }, function(rsp) {
        if ( rsp.success ) {
            
        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        	$.ajax({
        		url: "/order/paymentComplete", //cross-domain error가 발생하지 않도록 주의해주세요
        		type: 'POST',
        		dataType: 'json',
        	}).done(function(data) {
        	    console.log(2);
        	    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        		if ( everythings_fine ) {
        			var msg = '결제가 완료되었습니다.';
        			msg += '\n고유ID : ' + rsp.imp_uid;
        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
        			msg += '\결제 금액 : ' + rsp.paid_amount;
        			msg += '카드 승인번호 : ' + rsp.apply_num;
        			
        			alert(msg);
        		} else {
        		    console.log(3);
        			//[3] 아직 제대로 결제가 되지 않았습니다.
        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        		}
        	});
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
    });
    
     }
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
                    $row.find("td.cartDetailTotal").text(
                            total.toLocaleString() );
                    $row.find("td.cartDetailPoint").text(
                            point.toLocaleString() );
                    totalPrice += total;
                });

        // 총 가격과 총 예상 적립 포인트를 업데이트
        $("#totalPrice").text(totalPrice.toLocaleString());
        $("#totalPoint").text(totalPoint.toLocaleString());
        $("#earnedPoint").val(totalPoint.toLocaleString());

    }

    $(function() {
        updatePriceAndPoint();

        
       
        $("#paymentBtn").click(function() {
            requestPay()
        });
         
        /*결제수단 선택 버튼 클릭시 */
        $("#paymentMethodBtn").click(function() {
            const paymentMethodText = $("#paymentMethodText").val();
            $("#paymentMethodResult").val(paymentMethodText);
        });

        /* 사용 포인트 확인 버튼 클릭시 */
        $("#point-table button.btn-primary").click(
                function() {
                    const havePoint = parseFloat($("#havePoint").val().replace(
                            /,/g, ''));
                    const earnedPoint = parseFloat($("#earnedPoint").val()
                            .replace(/,/g, ''));
                    const usePoint = parseFloat($("#usePoint").val().replace(
                            /,/g, ''));

                    const totalPoint = havePoint + earnedPoint;

                    if (!isNaN(usePoint) && usePoint < totalPoint) {
                        const textPoint = Math.floor(usePoint / 10) * 10;
                        $(".alert.alert-danger").addClass("visually-hidden");
                        $("#Point").val(textPoint.toLocaleString());
                        $("#pointText").text("");
                    } else {
                        $(".alert.alert-danger").removeClass("visually-hidden");
                        $("#usePoint").val(""); // 사용 포인트 입력란 비우기
                        $("#usePoint").focus(); // 사용 포인트 입력란에 포커스 설정
                    }
                });

    });
</script>
<!-- Page CSS -->
</head>

<body>
	<!-- Body 전체 container -->
	<div id="container">

		<div class="alert alert-primary" role="alert">
			<h1 class="alert-heading">주문/결제</h1>
			<hr>
			<div class="mb-0">사용자 장바구니 id : ${cartInfo.cart_id}</div>
			
		</div>
		
		
		
		<div id="order-list">
			<form id="order-form">
				<table class="table">
					<thead>
						<tr>
							<th scope="row">매장명</th>
							<th scope="col">매장번호</th>
							<th scope="col">메뉴사진</th>
							<th scope="col">상품명</th>
							<th scope="col">수량</th>
							<th scope="col">개당가격</th>
							<th scope="col">가격</th>
							<th scope="col">예상적립포인트</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty cartDetailList}">
								<c:forEach items="${cartDetailList}" var="detail" varStatus="status">
									<!-- 장바구니 항목 행 -->
									<tr data-menu-no="${detail.menu_no}" data-cart-detail-no="${detail.cart_detail_no}">
										<td id="storeName">${storeList[status.index].store_name}</td>
										<td>${storeList[status.index].store_phone}</td>
										<td>${menuList[status.index].menu_img}</td>
										<td>${menuList[status.index].menu_name}</td>
										<td><span id="cartDetailMenuQuantity"> ${detail.cart_detail_menu_quantity}</span></td>
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
							<td colspan="4"></td>
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
							<td><textarea id="requestText" name="requestText"></textarea></td>
						</tr>

					</table>
					<!-- 포인트 -->
					<table class="table table-bordered" id="point-table">
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
							<td><input class="form-control" type="text" id="usePoint" name="usePoint" placeholder="사용하실 포인트를 입력해주세요">
								<div class="alert alert-danger visually-hidden" role="alert">사용포인트는 보유포인트와 총 적립예정 포인트의 합 보다 높을수 없습니다!</div>
								<button type="button" class="btn btn-primary">확인</button></td>

						</tr>
						<tr>
							<td>사용예정포인트</td>
							<td><input class="form-control" id="Point" name="toBeUsedPoint" type="text" value="0" readonly></td>
						</tr>
					</table>
					<table class="table table-bordered" id="payment-table">
						<tr>
							<td colspan="2">결제 수단 선택</td>
						</tr>
						<tr>
							<td colspan="2"><select id="paymentMethodText" class="form-select form-select-lg mb-3">
									<option selected value="">결제 수단 선택</option>
									<option value="cacaoPay">카카오페이</option>
									<option value="card">카드</option>
									<option value="pickmoney">픽머니</option>
							</select>

								<button id="paymentMethodBtn" type="button" class="btn btn-primary">확인</button></td>
						</tr>
						<tr>
							<td>선택한 결제수단</td>
							<td><input class="form-control" id="paymentMethodResult" type="text" readonly></td>
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
					<button type="button" class="btn btn-primary">장바구니로</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>