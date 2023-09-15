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
});


</script>
<!-- Page CSS -->
<style>
</style>
</head>

<!-- ////////////// -->

<body>
	<div class="container">


		<%-- 검색 --%>
		<div id="orderSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<%-- 페이징 처리를 위한 파라미터 --%>
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"> <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				<div class="form-group">
					<label>검색조건</label> <select id="search" name="search" class="form-control">
						<option value="all">전체조회</option>
						<option value="order_regdate">주문일</option>
						<option value="order_method">결제수단</option>
						<option value="order_store_name">가게명</option>
					</select> 
					<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
					<button type="button" id="searchData" class="btn btn-success">검색</button>
				</div>
			</form>
		</div>
		
		
		<%-- ========== 리스트시작 ========== --%>
		<div id="orderList" class="table-height">
			<table class="table table-hover">
				<thead>
					<tr>
						<th data-value="order_num" class="text-center col-md-auto">주문번호</th>
						<th class="text-center col-md-auto">주문상태</th>
						<th class="text-center col-md-auto">결제수단</th>
						<th class="text-center col-md-auto">매장이름</th>
						<th class="text-center col-md-auto">결제가격</th>
						<th class="text-center col-md-auto">주문일</th>
						
						
					</tr>
				</thead>
				<tbody id="list">
					<!-- 데이터 출력 -->
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
				</tbody>
			</table>
		</div>
		<%-- ========== 리스트 종로 ========== --%>
		
		
<%-- 페이징 --%>
  <ul class="pagination justify-content-center">
    <c:if test="${pageMaker.prev}">
      <li class="page-item">
        <a class="page-link" href="?pageNum=${pageMaker.startPage - 1}" aria-label="Previous">
          <span aria-hidden="true">Previous</span>
        </a>
      </li>
    </c:if>
    
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
      <li class="page-item ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
        <a class="page-link" href="?pageNum=${num}">${num}</a>
      </li>
    </c:forEach>
    
    <c:if test="${pageMaker.next}">
      <li class="page-item">
        <a class="page-link" href="?pageNum=${pageMaker.endPage + 1}" aria-label="Next">
          <span aria-hidden="true">Next</span>
        </a>
      </li>
    </c:if>
  </ul>

	



	</div>

</body>

</html>