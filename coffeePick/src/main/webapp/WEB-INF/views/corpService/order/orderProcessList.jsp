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
			
		    $('.goDetail').click(function(event) {
		        event.preventDefault();
		        let order_no = $(this).parent("tr").attr('data-num');
		        
		        $.ajax({
		            url: '/order/store/orderDetail',
		            type: 'get',
		            data: { "order_no" : order_no },
		            dataType: "json",
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
		            }
		        });
		    });	    	
	    	$(".btnBox").css("visibility","hidden"); // visibility: 화면에 보이지 않으나 공간을 그대로 유지
	    	// 주문 제조완료 버튼 클릭 시
	        $("table").on("click", "input#orderCompleteBtn", function() {
	            let order_no = $(this).closest("tr").data("num");
	            
	            // Ajax 요청 보내기
	            $.ajax({
	                type: "post", // 또는 "GET" 또는 필요한 HTTP 메소드
	                url: "/order/store/orderComplete", // 서버의 처리 URL을 여기에 입력 (실제 주소로 변경해야 함)
	                data: { order_no: order_no }, // 서버로 전송할 데이터
	                success: function(data) {
	                    
	                    // 픽업 완료 버튼 보이게 하기
	                    $("tr[data-num='" + order_no + "'] input#pickUpCompleteBtn").closest("#btnBox").css("visibility", "visible");
	                },
	                error: function(xhr, status, error) {
	                    // Ajax 요청이 실패하면 에러 처리
	                    console.error(error);
	                }
	            });
	        });
	    	
	        $("table").on("click", "input#pickUpCompleteBtn", function() {
	            let order_no = $(this).closest("tr").data("num");
	            
	            
	            // 픽업완료 버튼 클릭시
	            // Ajax 요청 보내기
	            $.ajax({
	                type: "post", // 또는 "GET" 또는 필요한 HTTP 메소드
	                url: "/order/store/pickUpComplete", // 서버의 처리 URL을 여기에 입력 (실제 주소로 변경해야 함)
	                data: { "order_no" : order_no }, // 서버로 전송할 데이터
	                success: function(data) {
	                    $("tr[data-num='" + order_no + "']").remove();    
	                },
	                error: function(xhr, status, error) {
	                    // Ajax 요청이 실패하면 에러 처리
	                    console.error(error);
	                }
	            });
	        });	
	  
	    });
	</script>
	
	        <div class="container mt-4 col-md-9">
            	<div class="page-header"><h3 class="text-left">주문 처리중</h3></div>
                <!--매장 정보 조회 폼 시작-->
				<table summary="주문접수 리스트" class="table table-striped">
					<thead>
						<tr>
							<th data-value="order_no" class="order text-center col-md-2">주문번호</th>
							<th data-value="order_regdate" class="order col-md-3">주문시간</th>
							<th data-value="order_basic_price" class="text-center col-md-3">총 가격</th>
							<th class="text-center col-md-2">제조완료</th>
							<th class="text-center col-md-2"></th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty orderProcessList }">
								<c:forEach var="order" items="${orderProcessList }" varStatus="status">
									<tr class="text-center" data-num="${order.order_no }">
										<td class="goDetail text-center">${order.order_no}</td>
			       						<td class="text-center">${order.order_regdate}</td>
										<td class="text-center">${order.order_basic_price}</td>
										<td class="text-center"><input type="button" class="btn btn-primary" id="orderCompleteBtn" value="제조완료"/></td>
										<td class="text-center">
											<div class="btnBox" id="btnBox">	
												<input type="button" class="btn btn-success" id="pickUpCompleteBtn" value="픽업완료"/>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="tac text-center">수락된 주문정보가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>				
            </div>
   			<!-- 주문내역 모달창 -->
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
