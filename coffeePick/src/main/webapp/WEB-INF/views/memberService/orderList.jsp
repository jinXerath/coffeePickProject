<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Page JS -->
<script type="text/javascript">
$(function() {
    /* 행 클릭시 이벤트 - 주문상세정보*/
    $("td.orderDetail").click(function() {
        let merchantUid = $(this).parent().attr("data-order-no");  
        let validOrderNos = [
            <c:forEach items="${orderList}" var="order" varStatus="status">
                "${order.order_no}",
            </c:forEach>
        ];
        if (validOrderNos.includes(merchantUid)) {
            // merchantUid가 유효한 order_no 값 중 하나와 일치하는 경우에만 요청을 보냅니다.
            window.location.href = "/order/orderEnd?merchant_uid=" + merchantUid;
        } else {
            // merchantUid가 유효한 order_no 값과 일치하지 않는 경우에는 오류를 제어할 수 있습니다.
            alert("주문 번호가 유효하지 않습니다.");
        }
    });
    
   

});//함수 종료문

</script>
<!-- Page CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<style>
</style>
</head>

<!-- ////////////// -->

<body>
	<div class="container">


		<%-- ========== 검색 ========== --%>
		<div id="orderSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<!-- 페이징 처리를 위한 파라미터 -->
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"> <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				<div class="form-group">
					<label>검색조건</label> <select id="search" name="search" class="form-control">
						<option value="all">전체조회</option>
						<option value="order_regdate">주문일</option>
						<option value="order_store_name">가게명</option>
					</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
				</div>
				<div class="form-group">
					<label for="startDate">시작 날짜</label> <input type="date" id="startDate" name="startDate" class="form-control">
				</div>
				<div class="form-group">
					<label for="endDate">종료 날짜</label> <input type="date" id="endDate" name="endDate" class="form-control">
				</div>

				<button type="button" id="searchData" class="btn btn-success">검색</button>
			</form>
		</div>

		<%-- ========== 검색끝 ========== --%>

		<%-- ========== 리스트시작 ========== --%>
		<div class="row">
			<div class="col-12 mb-3 mb-lg-5">
				<div class="position-relative card table-nowrap table-card">
					<div class="card-header align-items-center">
						<h5 class="mb-0">
							<i class="bi bi-card-list"></i> 주문 내역
						</h5>
						<span>진행중인 주문</span>
						<p class="mb-0">${orderStatusCnt}</p>
						<p class="small text-muted">주문 ID 클릭시 주문 상세보기가 가능합니다</p>
					</div>
					<div class="table-responsive">
						<table class="table mb-0 table-hover">
							<thead class="small text-uppercase bg-body text-muted">
								<tr>
									<th class="text-center">주문 ID</th>
									<th class="text-center">주문상태</th>
									<th class="text-center">결제수단</th>
									<th class="text-center">주문매장</th>
									<th class="text-center">주문총액</th>
									<th class="text-center">주문날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty orderList}">
										<c:forEach items="${orderList}" var="order" varStatus="status">

											<tr data-order-no="${order.order_no}" class="orderDetail">
												<td class="text-center order_no orderDetail link-primary ">${orderList[status.index].order_no}</td>
												<td class="text-center order_status">
													<div>
														<c:choose>
															<c:when test="${orderList[status.index].order_status == 1}">
						                                            접수대기
						                                        </c:when>
															<c:when test="${orderList[status.index].order_status == 2}">
						                                            제조중
						                                        </c:when>
															<c:when test="${orderList[status.index].order_status == 3}">
							                                            제조완료
							                                        </c:when>
															<c:when test="${orderList[status.index].order_status == 4}">
                                            픽업완료
                                        </c:when>
															<c:when test="${orderList[status.index].order_status == 0}">
                                            취소
                                        </c:when>
															<c:otherwise>
                                             정보 없음
                                        </c:otherwise>
														</c:choose>
													</div>
												</td>
												<td class="text-center order_method">
													<div>
														<c:choose>
															<c:when test="${orderList[status.index].order_method == 1}">
                                            카드
                                        </c:when>
															<c:when test="${orderList[status.index].order_method == 2}">
                                            픽머니
                                        </c:when>
															<c:otherwise>
                                            정보 없음
                                        </c:otherwise>
														</c:choose>
													</div>
												</td>
												<td class="text-center order_store_name">${orderList[status.index].order_store_name}</td>
												<td class="text-center order_total_price">${orderList[status.index].order_total_price}</td>
												<td class="text-center order_regdate">${orderList[status.index].order_regdate}</td>
											</tr>


										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" class="tac text-center">주문내역이 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<%-- ========== 리스트 종로 ========== --%>
							</tbody>
						</table>
					</div>
					<%-- ========== 페이징 ========== --%>
					<div class="card-footer text-end">

						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="paginate_button page-link" href="?pageNum=${pageMaker.startPage - 1}" aria-label="Previous"><span aria-hidden="true">이전</span></a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button page-item ${pageMaker.cvo.pageNum == num ? 'active' : ''}"><a class="page-link" href="?pageNum=${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="paginate_button page-link" href="?pageNum=${pageMaker.endPage + 1}" aria-label="Next"><span aria-hidden="true">다음</span></a></li>
							</c:if>
						</ul>

					</div>
					<%-- ========== 페이징 끝 ========== --%>
				</div>
			</div>
		</div>







	</div>

</body>

</html>