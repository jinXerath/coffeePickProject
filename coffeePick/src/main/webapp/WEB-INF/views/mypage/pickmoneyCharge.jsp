<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
    var IMP = window.IMP;
    IMP.init("imp63623734");

    function pickmoneyRequestPay(pgValue) {
        /* 결제 API 사용 */
        IMP.request_pay({
            pg : pgValue, 
            pay_method : $("#paymentMethod").val(),
            name : "픽머니 충전",
            amount : parseInt($("#chargeAmount").val().replace(/,/g, '')),
            buyer_email : "${memberInfo.member_email}",
            buyer_name : "${memberInfo.member_name}",
            buyer_tel : "${memberInfo.member_phone}",
            buyer_addr : "${memberInfo.member_addr}"
        }, function(rsp) {
            /* 결제 성공 시 */
            if (rsp.success) {
                var msg = '충전가 완료되었습니다.';
                // 결제검증
                $.ajax({
                    type : "POST",
                    url : "/verifyIamport/" + rsp.imp_uid
                }).done(function(data) {

                    if (rsp.paid_amount == data.response.amount) {

                        /* 결제관련 데이터 전송 */
                        $.ajax({
                            type : "POST",
                            url : "/pickmoney/payMent",
                            contentType : "application/json",
                            data : JSON.stringify({
                                amount : rsp.paid_amount
                            }),
                            success : function(data) {

                                $('#chargeModal').modal('hide');
                                location.reload();
                            },
                            error : function(xhr, status, error) {
                                alert("충전  중 오류가 발생했습니다");
                            }
                        });

                    } else {
                        var msg = '충전에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        alert(msg);
                    }
                });
            } else {
                var msg = '충전에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    };

    $(function() {
        /* plus button 클릭 이벤트 */
        $(".plusBtn").on("click", function() {
            var amount = parseInt($(this).data("amount"));
            var chargeAmount = $("#chargeAmount");
            var currentAmount = parseInt(chargeAmount.val()) || 0;
            chargeAmount.val(currentAmount + amount);
            $("#pickmoneyChargeAlert").text("");
        });

        /* 비우기 버튼 클릭 이벤트 */
        $("#clearAmount").on("click", function() {
            $("#chargeAmount").val("");
        });

        /* 충전 클릭 이벤트 */
        $(".chargeBtn").on("click", function() {
            var chargeAmount = parseInt($("#chargeAmount").val());
            if (isNaN(chargeAmount) || chargeAmount <= 0) {
                $("#pickmoneyChargeAlert").text("올바른 충전금액을 입력해주세요");
                $("#chargeAmount").focus();
            }  else {
                var selectedPaymentMethod = $("#paymentMethod").val();
                if (selectedPaymentMethod === "card") {
                   pickmoneyRequestPay("danal_tpay.9810030929");
                } else if (selectedPaymentMethod === "kakao") {
                    pickmoneyRequestPay("kakaopay.TC0ONETIME");
                } else if (selectedPaymentMethod === "toss") {
                    pickmoneyRequestPay("tosspay.tosstest");
                }
                $("#chargeAmount").val("");
            }
        });
    });
</script>
</head>
<body>



   <span class="me-2">보유픽머니:</span>
   <strong class="pickmoney_total">${pickmoneyInfo.pickmoney_total}</strong>

   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chargeModal">픽머니 충전</button>


   <!-- Modal -->
   <div class="modal fade" id="chargeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">픽머니 충전</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <form>
                  <p class="text-center">
                     보유픽머니 : <strong class="pickmoney_total">${pickmoneyInfo.pickmoney_total}</strong>
                  </p>
                  <div class="btn-group d-flex justify-content-center" role="group">
                     <button type="button" class="plusBtn btn btn-outline-primary" data-amount="100">+100</button>
                     <button type="button" class="plusBtn btn btn-outline-primary" data-amount="1000">+1000</button>
                     <button type="button" class="plusBtn btn btn-outline-primary" data-amount="2000">+2000</button>
                     <button type="button" class="plusBtn btn btn-outline-primary" data-amount="5000">+5000</button>
                     <button type="button" class="plusBtn btn btn-outline-primary" data-amount="10000">+10000</button>
                  </div>
                  <br />
                  <div class="form-group d-flex justify-content-between align-items-center">
                     <label for="chargeAmount" class="col-form-label" style="width: 100px;">충전금액</label>
                     <div class="input-group">
                        <input type="number" class="form-control" id="chargeAmount" readonly>
                        <button type="button" id="clearAmount" class="btn btn-outline-primary">
                           비우기 <i class="bi bi-trash"></i>
                        </button>
                     </div>
                  </div>
                  <span class="text-center" id="pickmoneyChargeAlert" style="color: red"></span>
                  <br />
                  <div class="form-group">
                     <select id="paymentMethod" class="form-select" aria-label="Default select example">
                        <option value="card">카드</option>
                        <option value="toss">카카오페이</option>
                        <option value="kakao">토스페이</option>
                     </select>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
               <button class="chargeBtn btn btn-primary" type="button">충전</button>
            </div>
         </div>
      </div>
   </div>
</body>
</html>