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
                data : {
                    order_no : "${param.order_no}"
                },
                contentType : 'application/json; charset=utf-8',
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
                            orderStatusElement.text("고객님의 주문이 접수 대기중 입니다");
                            break;
                        case "2":
                            orderStatusElement.text("고객님의 주문이 제조중 입니다");
                            break;
                        case "3":
                            orderStatusElement.text("고객님의 주문이 제조완료 되었습니다");

                            if (!orderStatusElement.hasClass("processed")) {
                                orderStatusElement.addClass("processed");
                                $('#orderDetailModal').modal('show');
                            }

                            break;
                        case "4":
                            orderStatusElement.text("고객님의 주문이 픽업완료 되었습니다");
                            clearInterval(pollingInterval);
                            break;
                        case "0":
                            orderStatusElement.text(" 고객님의 주문이 주문취소 되었습니다");
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

        /* 페이지 로드 시 폴링 시작 */
        pollForUpdates();

        /*reviewBtn 클릭시 이벤트 */
        $("#reviewBtn").click(function() {
            location.href = "";
        });
        /*orderListBtn 클릭시 이벤트 */
        $("#orderListBtn").click(function() {
            location.href = "/order/orderList";
        });
        /*mainBtn 클릭시 이벤트 */
        $("#mainBtn").click(function() {
            location.href = "http://localhost:8080/";
        });

    });
</script>
<!-- ... -->
<!-- Page CSS -->
<link href="/resources/include/css/user/orderDetail.css" rel="stylesheet">
</head>

<body>
	<div class="container">


		<!-- Button trigger modal -->
		<button type="button" id="modalBtn" class="btn btn-primary visually-hidden" data-bs-toggle="modal" data-bs-target="#orderDetailModal">orderDetailModal</button>

		<!-- Modal -->
		<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="orderDetailModalLabel"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body text-center">
						<h2>
							<strong>${memberInfo.member_nickname}님의 주문이 제조완료되었습니다!</strong>
						</h2>
						<br />이제 고객님의 주문을 픽업하실 수 있습니다. <br />주문 상세 정보는 내 주문 내역에서 다시 확인 하실수 있습니다
					</div>
				</div>
			</div>
		</div>


		<!-- Main -->
		<main class="main">
			<div class="container mt-6 mb-7">
				<div class="row justify-content-center">
					<div class="col-lg-12 col-xl-7">
						<div class="card">
							<br />
							<h1 class="text-center">주문 상세</h1>
							<div class="card-body p-5">
								<h2>
									안녕하세요 <strong>${memberInfo.member_nickname}</strong>
								</h2>
								<p class="fs-sm">
									고객님 께서 <strong> ${orderInfo.order_total_price}</strong>원 결제하셨습니다.
								</p>
								<p class="fs-sm">
									주문현황: <strong class="order_status"> <c:choose>
											<c:when test="${orderInfo.order_status eq 1}">
								                          고객님의 주문이 접수 대기중 입니다
								                      </c:when>
											<c:when test="${orderInfo.order_status eq 2}">
								                           고객님의 주문이 제조중 입니다
								                      </c:when>
											<c:when test="${orderInfo.order_status eq 3}">
								                          고객님의 주문이 제조완료 되었습니다
								                      </c:when>
											<c:when test="${orderInfo.order_status eq 4}">
								                           고객님의 주문이 픽업완료 되었습니다	    
								                      </c:when>
											<c:when test="${orderInfo.order_status eq 0}">
								                          고객님의 주문이 주문취소 되었습니다
								                      </c:when>
											<c:otherwise>
							                          상태 정보 없음
							                      </c:otherwise>
										</c:choose></strong>
								</p>


								<div class="border-top border-gray-200 pt-4 mt-4">
									<div class="row">
										<div class="col-md-6">
											<div class="text-muted mb-2">Order No</div>
											<strong class="order_no">${orderInfo.order_no}</strong>
										</div>
										<div class="col-md-6 text-md-end">
											<div class="text-muted mb-2">Order Date</div>
											<strong class="order_regdate">${orderInfo.order_regdate}</strong>
										</div>

									</div>
								</div>



								<div class="border-top border-gray-200 mt-4 py-4">
									<div class="row">
										<div class="col-md-6">
											<div class="text-muted mb-2">StoreInfo</div>
											<strong class="store_name">${orderInfo.order_store_name}</strong>
											<p class="fs-sm store_addr">
												${orderInfo.order_store_addr}<br> <a href="#!" class="text-purple store_phone">${orderInfo.order_store_phone} </a>
											</p>
										</div>

										<div class="col-md-6 text-md-end">
											<div class="text-muted mb-2 order_mehtod">
												<c:choose>
													<c:when test="${orderInfo.order_method == 1}">
                                            카드
                                        </c:when>
													<c:when test="${orderInfo.order_method == 2}">
                                            픽머니
                                        </c:when>
													<c:when test="${orderInfo.order_method == 3}">
                                            포인트결제
                                        </c:when>
													<c:otherwise>
                                            정보 없음
                                        </c:otherwise>
												</c:choose>
											</div>
											<strong> Themes LLC </strong>
											<p class="fs-sm">
												9th Avenue, San Francisco 99383 <br> <a href="#!" class="text-purple">themes@email.com </a>
											</p>
										</div>
									</div>
								</div>




								<table class="table border-bottom border-gray-200 mt-3">
									<thead>
										<tr>
											<th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">MenuName</th>
											<th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">Count</th>
											<th scope="col" class="fs-sm text-dark text-uppercase-bold-sm px-0">Price</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty orderDetailInfo}">
												<c:forEach items="${orderDetailInfo}" var="orderDetail" varStatus="status">
													<!-- 장바구니 항목 행 -->
													<tr data-menu-no="${orderDetail.order_detail_no}">
														<td class="px-0">${orderDetail.order_detail_menu_name}</td>
														<td class="px-0">${orderDetail.order_detail_menu_count}</td>
														<td class="px-0">${orderDetail.order_detail_menu_price}<span>원</span></td>
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

								<div class="border-bottom border-gray-200 pt-4 mt-4">
									<div class="row">
										<div class="col-md-6">
											<div class="text-muted mb-2">요청사항</div>
											<strong class="order_request">${orderInfo.order_request }</strong>
										</div>
									</div>
								</div>


								<div class="mt-5">
									<div class="d-flex justify-content-end">
										<p class="text-muted me-3">SubTotal:</p>
										<span class="basic_price">${orderInfo.order_basic_price}</span><span>원</span>
									</div>
									<div class="d-flex justify-content-end">
										<p class="text-muted me-3">적립포인트:</p>
										<span class="charge_point">${orderInfo.order_charge_point}</span>
									</div>
									<div class="d-flex justify-content-end">
										<p class="text-muted me-3">사용포인트:</p>
										<span class="use_point">${orderInfo.order_use_point}</span>
									</div>
									<div class="d-flex justify-content-end mt-3">
										<h5 class="me-3">Total:</h5>
										<h5 class="text-success total_price">${orderInfo.order_total_price}</h5>
										<span>원</span>
									</div>

									<button id="reviewBtn" type="button" class="btn btn-primary">리뷰 쓰기</button>
									<button id="orderListBtn" type="button" class="btn btn-primary">내 주문 내역</button>
									<button id="mainBtn" type="button" class="btn btn-primary">메인페이지로</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</main>

	</div>


</body>
</html>
