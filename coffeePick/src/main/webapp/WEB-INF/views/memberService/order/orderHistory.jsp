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
            window.location.href = "/order/orderDetail?merchant_uid=" + merchantUid;
        } else {
            alert("주문 번호가 유효하지 않습니다.");
        }
    });

	/*	입력 양식 enter 제거*/
	$("#keyword").bind("keydown",function(event){
		if(event.keyCode==13){
			event.preventDefault();
		}
	});
	
	/*	검색 대상이 변경될 때마다 처리 이벤트*/
	$("#search").change(function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 목록 조회합니다.");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	



	/*	키워드 검색 버튼 클릭 시 처리 이벤트*/
	$("#searchData").click(function(){
		if($("#search").val()!="all"){//제목/내용/작성자 선택시 검색어 유효성 체크
			if(!chkData("#keyword","검색어를"))return;
		}
		$("#pageNum").val(1); // 페이지 초기화
		goPage(); 
	})
	
  $("#searchStatus").click(function() {
    
    $("#search").val("order_status");
    $("#keyword").val("1,2,3"); 

    
    $("#startDate").val("");
    $("#endDate").val("");
    $("#pageNum").val(1);

    goPage();
});

	 /* 날짜별 검색 버튼 클릭 시 처리 이벤트 */
	    $("#searchDate").click(function() {
	        // 시작 날짜와 종료 날짜 값을 가져와서 서버로 전달
	        var startDate = $("#startDate").val();
	        var endDate = $("#endDate").val();

	        // 검색 대상과 키워드 초기화
	        $("#search").val("all");
	        $("#keyword").val("");

	        $("#pageNum").val(1); // 페이지 초기화
	        $("#startDate").val(startDate); // 시작 날짜 설정
	        $("#endDate").val(endDate); // 종료 날짜 설정

	        goPage();
	    });

});//함수 종료문


/*	검색을 위한 실질적인 처리 함수*/
function goPage(){
	if($("#search").val()=="all"){
		$("#keyword").val("");
	}
	
	$("#f_search").attr({
		"method":"get",
		"action":"/order/orderList"
	});
	
	
	$("#f_search").submit();
}
</script>
<!-- Page CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

</head>

<!-- ////////////// -->

<body>
	<div class="container">

		<br />
		<%-- ========== 검색 ========== --%>

		<div class="card">
			<div id="orderSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<table class="table">
						<tr class="table-light">
							<th colspan="3">키워드검색 <i class="bi bi-search"></i></th>
						</tr>
						<tr class="">
							<td><select id="search" name="search" class="form-control">
									<option value="all">전체조회</option>
									<option value="order_store_name">가게명</option>
							</select></td>
							<td><input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" /></td>
							<td><button type="button" id="searchData" class="btn btn-success">검색</button></td>
						</tr>

						<tr class="table-light table-sm">
							<th colspan="3">날짜별검색 <i class="bi bi-calendar"></i></th>
						</tr>
						<tr class="table-light">
							<td class="text-center">시작일</td>
							<td class="text-center">종료일</td>
							<td></td>
						</tr>
						<tr class="">
							<td><input type="date" id="startDate" name="startDate" class="form-control" placeholder="시작일"></td>
							<td><input type="date" id="endDate" name="endDate" class="form-control" placeholder="종료일"></td>
							<td><button type="button" id="searchDate" class="btn btn-success">검색</button></td>

						</tr>
					</table>
					<!-- 페이징 처리를 위한 파라미터 -->
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"> 
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

				</form>
			</div>
		</div>
		<%-- ========== 검색끝 ========== --%>

		<br />
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
						<button type="button" id="searchStatus" class="btn btn-info">진행중인 주문 보기</button>
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
																<strong>픽업완료</strong>
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
                                        <c:when test="${orderList[status.index].order_method == 3}">
                                            포인트결제
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
											<td colspan="6" class="text-center">주문내역이 없습니다</td>
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