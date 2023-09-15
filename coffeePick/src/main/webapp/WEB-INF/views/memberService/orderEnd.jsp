<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Page JS -->
<script type="text/javascript">


// 주문 상태 5초마다 업데이트

var pollingInterval;

function pollForUpdates() {
    pollingInterval = setInterval(function() {
        $.ajax({
            url : '/order/orderUpdate',
            method : 'GET',
            data: {
                merchant_uid: "${param.merchant_uid}"
            },
            contentType: 'application/json; charset=utf-8',
            success : function(data) {
                console.log("페이지 성공");
                let status = data.toString();
                if (status) {
                    // 데이터가 정상적으로 수신되었는지 확인한 후 처리
                    console.log(status);
                    
                    // 주문 상태를 업데이트할 엘리먼트 선택
                    var orderStatusElement = $(".order_status");
                    
                    // 주문 상태에 따라 텍스트 업데이트
                    switch (status) {
                        case "1":
                            orderStatusElement.text("접수대기");
                            break;
                        case "2":
                            orderStatusElement.text("제조중");
                            break;
                        case "3":
                            orderStatusElement.text("제조완료");
                            break;
                        case "4":
                            orderStatusElement.text("픽업완료");
                            clearInterval(pollingInterval);
                            break;
                        case "0":
                            orderStatusElement.text("주문취소");
                            clearInterval(pollingInterval);
                            break;
                        default:
                            orderStatusElement.text("상태 정보 없음");    
                            break;
                    }
                } else {
                    console.error("데이터가 없거나 오류 발생");
                }
            },
            error : function(error) {
                console.error("페이지 오류");
            }
        });
    }, 5000); 
}


    
    $(function() {
       
        // 페이지 로드 시 폴링 시작
        pollForUpdates();
    });
</script>
<!-- ... -->
<!-- Page CSS -->
<style>
</style>
</head>

<body>
<div class="container">
	<!-- Section-Title  -->
	<section class="title">
		<h1>주문 상세</h1>
	</section>

	<!-- Main -->
	<main class="main">

		<table class="table">
			<!--  Main-head -->
			<tr>
				<td class="table-secondary">주문상태</td>
				<td>
					<div class="order_status">
						<c:choose>
							<c:when test="${orderInfo.order_status eq 1}">
                                접수대기
                            </c:when>
							<c:when test="${orderInfo.order_status eq 2}">
                                제조중
                            </c:when>
							<c:when test="${orderInfo.order_status eq 3}">
                                제조완료
                            </c:when>
							<c:when test="${orderInfo.order_status eq 4}">
                                픽업완료
                            </c:when>
							<c:when test="${orderInfo.order_status eq 0}">
                                주문취소
                            </c:when>
							<c:otherwise>
                                상태 정보 없음
                            </c:otherwise>
						</c:choose>
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">주문매장</td>
				<td>
					<div class="store_name">${orderInfo.order_store_name}</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">매장주소</td>
				<td>
					<div class="store_addr">${orderInfo.order_store_addr}</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">주문일시</td>
				<td>
					<div class="order_regdate">${orderInfo.order_regdate}</div>
				</td>

			</tr>
			<tr>
				<td class="table-secondary">주문번호</td>
				<td>
					<div class="order_no">${orderInfo.order_no}</div>
				</td>
			</tr>
			<!--  Main-ListTable -->
			<tr>
				<td colspan="2">

					<table class="table caption-top">
						<caption class="text-bg-secondary p-3">주문내용</caption>
						<thead class="table-dark">
							<tr>
								<th>메뉴명</th>
								<th>수량</th>
								<th>메뉴가격</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty orderDetailInfo}">
									<c:forEach items="${orderDetailInfo}" var="orderDetail" varStatus="status">
										<!-- 장바구니 항목 행 -->
										<tr data-menu-no="${orderDetail.order_detail_no}">
											<td>${orderDetail.order_detail_menu_name}</td>
											<td>${orderDetail.order_detail_menu_count}</td>
											<td>${orderDetail.order_detail_menu_price}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3" class="tac text-center">주문상세를 불러올수 없습니다..</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
			</tr>
			<!--  Main-Foot -->
			<tr class="table-dark">
				<td colspan="2">결제내용</td>
			</tr>
			<tr>
				<td class="table-secondary">총 주문금액</td>
				<td>
					<div class="basic_price">
						${orderInfo.order_basic_price}<span>원</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">적립포인트</td>
				<td>
					<div class="charge_point">
						${orderInfo.order_charge_point}<span>원</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">포인트 사용</td>
				<td>
					<div class="use_point">
						${orderInfo.order_use_point}<span>원</span>
					</div>
				</td>
			</tr>

			<tr>
				<td class="table-secondary">총 결제금액</td>
				<td>
					<div class="total_price">
						${orderInfo.order_total_price}<span class="total_price">원</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">결제방법</td>
				<td>
					<div class="order_method">
						<c:choose>
							<c:when test="${orderInfo.order_method eq 1}">
                                결제시스템
                            </c:when>
							<c:when test="${orderInfo.order_method eq 2}">
                                픽머니
                                <tr>
									<td class="table-secondary">사용픽머니</td>
									<td>
										<div class="use_pickmoney">
											${orderInfo.order_use_pickmoney}<span>원</span>
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
                                상태 정보 없음
                            </c:otherwise>
						</c:choose>
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-secondary">요청사항</td>
				<td>
					<div class="order_request">${orderInfo.order_request }</div>
				</td>
			</tr>
			<tr class="btnList">
				<td colspan="2">
					<button id="reviewBtn " type="button" class="btn btn-primary">리뷰 쓰기</button>
					<button id="orderListBtn" type="button" class="btn btn-primary">내 주문 내역</button>
					<button id="mainBtn" type="button" class="btn btn-primary">메인페이지로</button>
				</td>
			</tr>
		</table>
	</main>
	</div>
</body>
</html>
