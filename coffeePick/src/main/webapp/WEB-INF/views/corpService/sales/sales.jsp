<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>




<script>
    $(document).ready(function () {
        // 조회 버튼 클릭 이벤트
        $("#searchBtn").click(function () {
            var startDate = $("#start_date").val();
            var endDate = $("#end_date").val();

            // AJAX 요청
            $.ajax({
                type: "POST",
                url: "/order/store/totalSalesInfo",
                data: {
                    "start_date": startDate,
                    "end_date": endDate
                },
                dataType: "json",
                success: function (data) {
                    // 주문 총합계 업데이트
                    $("#orderSale").text(data.orderSale);
                },
                error: function () {
                    alert("조회에 실패하였습니다.");
                }
            });
        });
    });
</script>

	
<div class="container mt-4 col-md-9">
                <!--매장 정보 조회 폼 시작-->

	<div id="order_result" class="form-control">
		<div class="py-5 text-center">
			<h2>매출 정보</h2>
		</div>

<!-- 시작 날짜와 종료 날짜 입력 폼 -->
		<div class="row mb-2">

			<div class="col-md-4">
				<input type="date" id="start_date" name="start_date" class="form-control fontsize" />
			</div>
				~
			<div class="col-md-4">
				<input type="date" id="end_date" name="end_date" class="form-control fontsize" />
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-primary" id="searchBtn" value="조회">
     		</div>
     	</div>
		<div>
        	주문 총합계: <span id="orderSale"></span>
		</div>
    </div>
</div>

   
         


	
	
	

