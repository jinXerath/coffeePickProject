<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link href="/resources/include/css/board.css" rel="stylesheet"/>
<script>
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word="<c:out value='${boardVO.keyword}' />";
		let value="";
		if(word!=""){
			$("#keyword").val("<c:out value='${boardVO.keyword}' />");
			$("#search").val("<c:out value='${boardVO.search}' />");
		}
		
		/* 입력 양시 enter 제거 */
		$("#keyword").bind("keydown", function(event) {
			if (event.keyCode == 13) {
				event.preventDefault();
			}
		});

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			$("#keyword").val("");
			$("#keyword").focus();
		})
			
		// 검색 버튼
		$("#searchBtn").click(function() {
			if ($("#search").val() == "") {
				alert("검색 조건을 선택해주세요.");
				return;
			}
			if ($("#search").val() != "") {
				if (!chkData("#keyword", "검색어를")) {
					return;
				}
			}
			$("#pageNum").val(1);
			goPage();
		})
		
		//초기화 버튼
		$("#resetBtn").click(function() {
		    $("#pageNum").val(1);
		    $("#search").val("");
		    $("#keyword").val("");
		    goPage();
		})
		
		//디테일페이지로이동
		$(".goDetail").click(function() {
			let board_no = $(this).parents("tr").attr("data-num");
			$("#board_no").val(board_no);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/notice/noticeDetail"
			});
			$("#detailForm").submit();
		});

		$(".paginate_button a").click(function(e) {
			e.preventDefault();
			$("#noticeSearchForm").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		
	});// function 끝
	
	
	function goPage() {
		if ($("#search").val() == "choice") {
			$("#keyword").val("");
		}
		$("#noticeSearchForm").attr({
			"method" : "get",
			"action" : "/board/notice/noticeList"
		});
		$("#noticeSearchForm").submit();
	}
	
</script>
<section class="container py-3">
	<div id="noticeSearch">
		<form id="noticeSearchForm" name="noticeSearchForm" class="row gx-3 gy-2 align-items-center">
			<input id="pageNum" name="pageNum" type="hidden" value="${pageMaker.cvo.pageNum}">
			<div class="col-auto">
				<select id="search" name="search" class="form-select">
					<option value="choice" selected>검색 조건</option>
					<option value="board_title">제목</option>
					<option value="board_content">내용</option>
					<option value="board_title_content">제목+내용</option>
				</select>
			</div>
			<div class="col-4">
				<input name="keyword" id="keyword" type="text" class="form-control" placeholder="검색어를 입력해주세요">
			</div>
			<div class="col-auto">
				<button id="searchBtn" class="btn btn-primary" type="button">검색</button>
			</div>
			<div class="col-auto">
				<button id="resetBtn" class="btn btn-secondary" type="button">초기화</button>
			</div>
		</form>
	</div>
	<form id="detailForm">
		<input type="hidden" id="board_no" name="board_no" />
	</form>
	<div class="text-start mb-2">
		<br/>
		<p class="text-secondary fs-6" >&nbsp;&nbsp;총 <span >${pageMaker.total}</span>건</p>
	</div>
    <div >
        <table class="table table-hover align-middle">
	        <thead class="text-center table-light">
	            <tr>
	                <th scope="col" class="col-1">번호</th>
	                <th scope="col" class="col-7">제목</th>
	                <th scope="col" class="col-2">작성일자</th>
	                <th scope="col" class="col-1">조회수</th>
	            </tr>
	        </thead>
	        <tbody class="text-center table-group-divider">
	        	<c:choose>
	        		<c:when test="${not empty noticeList}">
	        			<c:forEach var="board" items="${noticeList}" varStatus="status">
							<tr data-num="${board.board_no}">
								<td>${board.board_no}</td>
								<td class="goDetail fontweight">${board.board_title}</td>
								<td>${board.board_regdate}</td>
								<td>${board.board_readcnt}</td>
							</tr>
						</c:forEach>
	        		</c:when>
        			<c:otherwise>
						<tr>
							<td colspan="4" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
	        	</c:choose>
	        </tbody>
	    </table>
    </div>
	<nav>
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
			<li class="page-item paginate_button">
				<a class="page-link" href="${pageMaker.startPage - 1 }">
					<span>&laquo;</span>
				</a>
			</li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="page-item paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
				<a class="page-link" href="${num}">${num}</a>
			</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<li class="page-item paginate_button">
				<a class="page-link" href="${pageMaker.endPage + 1 }">
					<span>&raquo;</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>
</section>
