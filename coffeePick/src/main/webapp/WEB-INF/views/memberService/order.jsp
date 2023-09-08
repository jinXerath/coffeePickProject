<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page JS -->
<!-- Page CSS -->
</head>

<body>
	<!-- Body 전체 container -->
	<div id="container">
		
		<div class="alert alert-primary" role="alert">
			<h1 class="alert-heading">주문/결제</h1>
			<hr>
		
		</div>
		<div id="order-list">
			<form id="order-form">
				<table class="table">
					<thead>
						<tr>
							<th scope="row">매장명</th>
							<th scope="col">매장번호</th>
							<th scope="col">상품사진</th>
							<th scope="col">상품명</th>
							<th scope="col">선택옵션</th>
							<th scope="col">수량</th>
							<th scope="col">가격</th>
							<th scope="col">적립포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">매장명</td>
							<td>매장번호</td>
							<td>상품사진</td>
							<td>상품명</td>
							<td>상품옵션</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6"></td>
							<td>0</td>
							<td colspan="1">0</td>
							<td></td>
					</tfoot>
				</table>

				<div id="list">
					<table class="table table-bordered" id="request-table">
						<caption>요청사항</caption>
						<tr>
							<td>선택 요청사항</td>
							<td><select id="request" name="request">
									<option id="req" value="">----------------------------</option>
									<option id="req1" value="요청사항1">요청사항1</option>
									<option id="req2" value="요청사항2">요청사항2</option>
									<option id="req2" value="요청사항3">요청사항3</option>
									<option id="req2" value="요청사항4">요청사항4</option>
							</select></td>
						</tr>
						<tr>
							<td>기타 요청사항</td>
							<td><textarea id="requestText" name="requestText"></textarea></td>
						</tr>
					</table>
					<table class="table table-bordered" id="point-table">
						<caption>포인트</caption>
						<tr>
							<td>보유포인트</td>
							<td><input class="form-control" id="totalPoint" name="totalPoint" type="text" value="0" readonly></td>
						</tr>
						<tr>
							<td>적립예정포인트</td>
							<td><input class="form-control" id="earnedPoint" name="earnedPoint" type="text" value="0" readonly></td>
						</tr>
						<tr>
							<td>사용포인트</td>
							<td><input class="form-control" type="text" id="usePoint" name="usePoint" placeholder="0"></td>
						</tr>
					</table>
					<table class="table table-bordered" id="payment-table">
						<caption>결제수단 선택</caption>
						<tr>
							<td colspan="2">
								<div class="btn-group">
									<a href="#" class="btn btn-primary">카카오페이</a> <a href="#" class="btn btn-primary">카드결제</a> <a href="#" class="btn btn-primary">픽머니결제</a>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="1">픽머니결제 클릭시 나오는페이지 카카오페이/카드는 결제완료버튼클릭시 해당api이동</td>
							<td><button type="button" class="btn btn-info">픽머니충전</button></td>
						</tr>
						<tr>
							<td>보유 픽머니</td>
							<td><input class="form-control" type="text" id="totalPickmoney" name="totalPickmoney" value="0" readonly></td>
						</tr>
						<tr>
							<td>사용 픽머니</td>
							<td><input class="form-control" type="text" id="usePickmoney" name="usePickmoney" placeholder="0"></td>
						</tr>
					</table>
				</div>
				<div id="buttons">
					<button type="button" class="btn btn-primary">결제하기</button>
					<button type="button" class="btn btn-primary">장바구니로</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>