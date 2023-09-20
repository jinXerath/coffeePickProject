<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
	    $(function(){
			$(".goDetail").on("click",(function(){
				let order_no = $(this).closest("tr").data("num");
				
				$.ajax({
					type: "post",
					url: "/order/store/orderCompleteDetail"
				})
				$("#orderProcessComplete").attr({
					"method" : "get",
					"action" : "/order/store/orderCompleteDetail"
				});
				$("#orderProcessComplete").submit();
			});
	    });
	</script>

			<div class="container mt-4 col-md-9">
				<div class="page-header">
					<h3 class="text-left">주문 처리 내역</h3>
				</div>
				<!--매장 정보 조회 폼 시작-->
				<form id="orderProcessComplete">
					<table summary="주문처리내역 리스트" class="table table-striped">
						<thead>
							<tr>
								<th data-value="order_no" class="order text-center col-md-3">주문번호</th>
								<th data-value="order_regdate" class="order text-center col-md-3">주문시간</th>
								<th data-value="order_basic_price" class="text-center col-md-3">총
									가격</th>
								<th class="text-center col-md-3">주문처리내역</th>
							</tr>
						</thead>
						<tbody id="list" class="table-striped">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty orderProcessCompleteList }">
									<c:forEach var="order" items="${orderProcessCompleteList }"
										varStatus="status">
										<tr class="text-center" data-num="${order.order_no }">
											<td class="goDetail text-center">${order.order_no}</td>
											<!--  	<td class="goDetail">${order.order_no}</td> -->
											<!-- goDetail -->
											<td class="text-center">${order.order_regdate}</td>
											<td class="text-center">${order.order_basic_price}</td>
											<td class="text-center"><c:if
													test="${order.order_status == 0}">
														거절된 주문
													</c:if> <c:if test="${order.order_status == 4}">
														픽업완료된 주문
													</c:if></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" class="tac text-center">주문처리완료된 주문정보가
											없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</form>
			</div>

