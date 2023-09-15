<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page JS -->
<script type="text/javascript">

</script>
<!-- Page CSS -->
<style>
</style>
</head>

	<!-- ////////////// -->
	<body>
   	<div class="container">
   	
   	<!--  
		<%-- 검색 --%>
		<div id="orderSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<%-- 페이징 처리를 위한 파라미터 --%>
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}"> 
				<div class="form-group">
					<label>검색조건</label>
					<select id="search" name="search" class="form-control">
						<option value="all">전체조회</option>
						<option value="b_title">제목</option>
						<option value="b_content">내용</option>
						<option value="b_name">작성자</option>
					</select> 
					<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control"/>
					<button type="button" id="searchData" class="btn btn-success">검색</button>
				</div>
			</form>
		</div>-->
		
		<%-- ========== 리스트시작 ========== --%>
		<div id="orderList" class="table-height">
			<table class="table table-striped">
				<thead>
					<tr>
					<tr>
						<th data-value="b_num" class="order text-center col-md-1">글번호</th>
						<th class="text-center col-md-4">글제목</th>
						<th class="text-center col-md-2">작성자</th>
						<th data-value="b_date" class="order col-md-1">작성일</th>
						<th class="text-center col-md-1">조회수</th>
							<th class="text-center col-md-1">이미지</th>
					</tr>
				</thead>
		
				
				<tbody id="list" class="table-striped">
				
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty orderList}">
							<c:forEach items="${orderList}" var="order" varStatus="status">
								<tr class="text-center" data-num="${order.order_no}">
									<td class="order_no">${order.order_no}</td>
									<td class="order_status">${order.order_status}</td>
									<td class="order_store_name">${order.order_store_name}</td>
									<td class="order_regdate">${order.order_regdate}</td>
									<!--  
									<td>
										<c:if test="${not empty order.b_file}">
											<img src="/uploadStorage/order/${order.b_file}" class="file">
										</c:if>
										<c:if test="${empty order.b_file}">
											<img src="/resources/images/no-image.png">
										</c:if>
										
									</td>
									-->
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!--  
		<%-- ========== 리스트 종로 ========== --%>
		<%-- ========== 페이징 출력 시작 ========== --%>
		<div class="text-center">
			<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인.
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage -1}">Previous</a>
				</li>
			</c:if>
			
			<!-- 바로가기 번호 출력 
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}"> 
	 				<a href="${num}">${num}</a>
	 			</li>
			</c:forEach>
			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인.
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage + 1}">Next</a>
				</li>
			</c:if>
			</ul>
		</div>
-->
	
	</div>
   	
	</body>
</html>