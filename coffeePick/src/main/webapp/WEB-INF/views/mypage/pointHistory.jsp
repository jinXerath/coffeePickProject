<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<script type="text/javascript">
    // 문서가 준비되면 실행
    $(function() {

        /* 포인트 적립/사용에 따른 분류 */
        $('.point_history_reason').each(function() {
            var reasonText = $(this).text().trim();
            var parentTr = $(this).closest('tr');

            if (reasonText === '적립') {
                parentTr.addClass('table-primary');
            } else if (reasonText === '사용') {
                parentTr.addClass('table-danger');

                var amountCell = parentTr.find('.point_history_amount');
                var amountValue = amountCell.text().trim();
                amountCell.html('-' + amountValue);
            }
        });
    });
</script>
</head>
<body>

	<div class="container">

		<br>
		<div class="row">
			<div class="col-12 mb-3 mb-lg-5">
				<div class="position-relative card table-nowrap table-card">
					<div class="card-header align-items-center">
						<h5 class="mb-0">포인트 사용/적립 내역</h5>

						<span><i class="bi bi-stars"></i>총 보유 포인트</span>
						<div class="havePoint">${pointInfo.point_total}</div>
					</div>

					<div class="table-responsive">
						<table class="table mb-0 table-hover">
							<thead class="small text-uppercase bg-body text-muted">
								<tr>
									<th class="text-center">NO</th>
									<th class="text-center">적립/사용</th>
									<th class="text-center">변경금액</th>
									<th class="text-center">날짜</th>
								</tr>
							</thead>
							<tbody>
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty pointHistoryInfo}">
										<c:forEach items="${pointHistoryInfo}" var="pointHistory" varStatus="status">

											<tr data-point_history-no="${pointHistory.point_history_no}">
												<td class="text-center point_history_no">${pointHistory.point_history_no}</td>
												<td class="text-center point_history_reason">
													<div>
														<c:choose>
															<c:when test="${pointHistory.point_history_reason == 'I'}">
                                                    적립
                                                </c:when>
															<c:when test="${pointHistory.point_history_reason == 'O'}">
                                                    사용
                                                </c:when>
														</c:choose>
													</div>
												</td>
												<td class="text-center point_history_amount">${pointHistory.point_history_amount}</td>
												<td class="text-center  point_history_date">${pointHistory.point_history_date}</td>
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
