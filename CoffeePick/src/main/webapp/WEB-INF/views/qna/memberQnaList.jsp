<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      
		<title><tiles:getAsString name="title"/></title>
		
		<!-- 아이콘 -->
		<link rel="shortcut icon" href="/resources/images/cp-icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/cp-icon.png" />
		
		<!-- Bootstrap core CSS -->
		<link href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.css" rel="stylesheet"/>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<!--==================== script ====================-->
		<!-- jQuery -->
		<script src="/resources/include/js/jquery-3.7.1.min.js" type="text/javascript"></script>
		<!-- fontawesome -->
		<script src="/resources/include/js/fontawesome-all.js" type="text/javascript"></script>
		<!-- bootstrap.bundle.js -->
		<script src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.js" type="text/javascript"></script>
        <!-- common.js -->
        <script src="/resources/include/js/common.js" type="text/javascript"></script>
	</head>
	<body>
<section class="py-5 container">
	<div id="boardSearch" class="text-right">
		<form id="f_search" name="f_search" class="form-inline">
			<div class="form-group">
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				<label>검색조건</label> 
				<select id="search" name="search" class="form-control">
					<option value="all">전체</option>
					<option value="b_title">제목</option>
					<option value="b_content">내용</option>
					<option value="b_name">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
				<button type="button" id="searchData" class="btn btn-success">검색</button>
			</div>
		</form>
	</div>

    <div id="memberQnaList" >
        <table class="table table-hover">
	        <thead class="text-center table-primary">
	            <tr>
	                <th scope="col" class="col">번호</th>
	                <th scope="col" class="col">비밀</th>
	                <th scope="col" class="col">답변</th>
	                <th scope="col" class="col-5">문의 제목</th>
	                <th scope="col" class="col-2">작성자</th>
	                <th scope="col" class="col-2">작성일자</th>
	            </tr>
	        </thead>
	        <tbody class="text-center table-group-divider">
	        	<c:choose>
	        		<c:when test="${not empty memberQnaList}">
	        			<c:forEach var="memberQna" items="${memberQnaList}" varStatus="status">
							<tr class="text-center" data-num="${memberQna.member_qna_no}">
								<td>${memberQna.member_qna_no}</td>
								<td class="text-center">
									${memberQna.member_qna_secret eq 'y' ? <i class="fa-solid fa-lock"></i> : <i class="fa-solid fa-lock-open"></i>}
								</td>
								<td class="text-center">
									${memberQna.member_qna_reply_status eq 'y' ? '답변 완료' : '답변 대기'}
								</td>
								<td class="goDetail text-left">${memberQna.member_qna_title}</td>
								<td class="text-center">
									${memberQna.member_nickname}<br/>
									(${memberQna.member_id})
								</td>
								<td class="text-center">${memberQna.member_qna_regdate}</td>
							</tr>
						</c:forEach>
	        		</c:when>
        			<c:otherwise>
						<tr>
							<td colspan="6" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
	        	</c:choose>
	        </tbody>
	    </table>
    </div>
 	<div class="text-center">
		<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage - 1 }">Previous</a>
				</li>
			</c:if>
			
			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			
			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage + 1 }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<%--==================== 페이징 출력 종료 ====================--%>
	<%-- =========== 글쓰기 버튼 출력 시작 ============= --%>
	<div class="contentBtn text-right">
		<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success">
	</div>
</section>



	</body>
</html>
