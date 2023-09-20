<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">
    $(function(){
    	
		let successMsg = "${successMsg}";
		if(successMsg != ""){
			alert(successMsg);
			successMsg = "";
		}
		
		let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			alert(errorMsg);
			errorMsg = "";
		}
		
		
	    let lastOrderNo = null;
		let emptyList = "주문정보가 없습니다.";
		
	    function updateOrders() {
	        $.ajax({
	            url: '/order/store/getOrderReceive',
	            type: 'get',
	            dataType: 'json',
	            success: function (data) {
	                $("#list").empty();
	                if (data && data.length > 0) {
	                    for (let i = 0; i < data.length; i++) {
	                        let order = data[i];
	                        if (order.order_no !== lastOrderNo) {
	                            let row = '<tr class="text-center" data-num="' + order.order_no + '">' +
	                                '<td class="goDetail text-center">' + order.order_no + '</td>' +
	                                '<td class="text-center">' + order.order_regdate + '</td>' +
	                                '<td class="text-center">' + order.order_basic_price + '</td>' +
	                                '<td class="text-center"><input type="button" class="btn btn-primary" id="orderAcceptBtn" value="수락"/></td>' +
	                                '<td class="text-center"><input type="button" class="btn btn-danger" id="orderCancelBtn" value="거절"/></td>' +
	                                '</tr>';
	                            $("#list").append(row);
	                            lastOrderNo = order.order_no;
	                        }
	                    }
	                } else {
	                	let row = '<tr class="text-center">' + 
	                				'<td colspan="6" class="tac text-center">' + emptyList + '</td>' +
	                				'</tr>'
	                	$("#list").append(row);
	                }
	            },
	            complete: function () {
	                setTimeout(updateOrders, 5000);
	            }
	        });
	    }

	    // 페이지 로딩 후 한 번 호출
	    $(document).ready(function () {
	        updateOrders();
	    });

        // 주문번호 클릭 시
		$(document).on('click', '.goDetail', function(event) {
		    event.preventDefault();
		    let order_no = $(this).closest("tr").data('num');
		
		    $.ajax({
		        url: '/order/store/orderDetail',
		        type: 'get',
		        data: { "order_no" : order_no },
		        dataType: 'json',
		        success: function(data) {
		            // 모달 내부의 <tbody>를 찾아서 초기화합니다.
		            $('#orderDetailTable tbody').empty();
		            
		            // 데이터를 반복해서 행을 생성하고 추가합니다.
		            for (let i = 0; i < data.length; i++) {
		                let item = data[i];
		                let row = '<tr>' +
		                    '<td>' + item.order_detail_menu_name + '</td>' +
		                    '<td>' + item.order_detail_menu_count + '</td>' +
		                    '<td>' + item.order_detail_menu_price + '</td>' +
		                    '</tr>';
		                $("#orderDetailTable tbody").append(row);
		            }
		
		            // 모달을 열고 모달 주소로 내용을 로드
		            $('#orderDetailModal').modal('show');
		        },
		        error: function(xhr, status, error) {
		            // 에러 발생 시 처리
		            console.error(error);
		        }
		    });
		});	        
        
        // 수락버튼 클릭시
        $("table").on("click", "input#orderAcceptBtn", function() {
            let order_no = $(this).closest("tr").data("num");
            
            // 주문 정보를 서버로 전송
            $.ajax({
                type: "post",
                url: "/order/store/orderAccept",
                data: { order_no: order_no },
                success: function(data) {
                    // Ajax 요청이 성공하면 주문 테이블에서 해당 주문 삭제
                    $("tr[data-num='" + order_no + "']").remove();
                },
                error: function(xhr, status, error) {
                    // Ajax 요청이 실패하면 에러 처리
                    console.error(error);
                }
            });
        });
        
        
        // 주문 거절 버튼 클릭 시
        $("table").on("click", "input#orderCancelBtn", function() {
            let order_no = $(this).closest("tr").data("num");
            if(confirm("정말 거절하시겠습니까?")){
            // 주문 정보를 서버로 전송
	            $.ajax({
	                type: "post",
	                url: "/order/store/orderCancel",
	                data: { "order_no": order_no },
	                success: function(data) {
	                    // Ajax 요청이 성공하면 주문 테이블에서 해당 주문 삭제
	                    $("tr[data-num='" + order_no + "']").remove();
	                },
	                error: function(xhr, status, error) {
	                    // Ajax 요청이 실패하면 에러 처리
	                    console.error(error);
	                }
	            });
            }
        });
    });
</script>
	



            <div class="container mt-4 col-md-9">
            	<div class="page-header"><h3 class="text-left">주문 접수</h3></div>
            	
            	<form id="detailForm">
            		<input type="hidden" id="order_no" name="order_no"/>
            	</form>	
                <!--매장 정보 조회 폼 시작-->
				<table summary="주문접수 리스트" class="table table-striped">
				
				
					<thead>
						<tr>
							<th data-value="order_no" class="order text-center col-md-2">주문번호</th>
							<th data-value="order_regdate" class="order col-md-4">주문시간</th>
							<th data-value="order_basic_price" class="text-center col-md-4">총 가격</th>
							<th class="text-center col-md-1">수락</th>
							<th class="text-center col-md-1">거절</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty orderList }">
								<c:forEach var="order" items="${orderList }" varStatus="status">
									<tr class="text-center" data-num="${order.order_no }">
										<td class="goDetail text-center">${order.order_no}</td>
			       <!-- goDetail -->	<td class="text-center">${order.order_regdate}</td>
										<td class="text-center">${order.order_basic_price}</td>
										<td class="text-center"><input type="button" class="btn btn-primary" id="orderAcceptBtn" value="수락"/></td>
										<td class="text-center"><input type="button" class="btn btn-danger" id="orderCancelBtn" value="거절"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="tac text-center">아직 주문정보가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
            </div>
            <div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-scrollable">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="orderModalLabel">주문 상세 정보</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            	</div>
			            <div class="modal-body">
							<table id="orderDetailTable" class="table caption-top">
								<caption class="text-bg-secondary p-3">주문내용</caption>
								<thead class="table-dark">
									<tr>
										<th>메뉴명</th>
										<th>수량</th>
										<th>메뉴가격</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			            </div>
			        </div>
			    </div>
			</div>