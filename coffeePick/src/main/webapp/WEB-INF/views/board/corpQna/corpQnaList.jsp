<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script>
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word="<c:out value='${qnaVO.keyword}' />";
		let value="";
		if(word!=""){
			$("#keyword").val("<c:out value='${qnaVO.keyword}' />");
			$("#search").val("<c:out value='${qnaVO.search}' />");
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
		
		// 글쓰기 버튼 클릭시 처리
		$('#insertFormBtn').click(function() {
			location.href = '/board/corpQna/corpQnaForm';
		});

		$(".goDetail").click(function() {
			let qna_no = $(this).parents("tr").attr("data-num");
			$("#qna_no").val(qna_no);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/corpQna/corpQnaDetail"
			});
			$("#detailForm").submit();
		});

		$(".paginate_button a").click(function(e) {
			e.preventDefault();
			$("#corpQnaSearchForm").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		
	});// function 끝
	
	
	function goPage() {
		if ($("#search").val() == "") {
			$("#keyword").val("");
		}
		$("#corpQnaSearchForm").attr({
			"method" : "get",
			"action" : "/board/corpQna/corpQnaList"
		});
		$("#corpQnaSearchForm").submit();
	}
	
</script>
<section class="container py-3">
	<div id="corpQnaSearch">
		<form id="corpQnaSearchForm" name="corpQnaSearchForm" class="row gx-3 gy-2 align-items-center">
			<input id="pageNum" name="pageNum" type="hidden" value="${pageMaker.cvo.pageNum}">
			<div class="col-auto">
				<select id="search" name="search" class="form-select">
					<option value="" selected>검색 조건</option>
					<option value="corp_qna_title">제목</option>
					<option value="corp_id">아이디</option>
					<option value="store_name">닉네임</option>
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
		<input type="hidden" id="qna_no" name="qna_no" />
	</form>
	<div class="text-end mb-2">
		<button class="btn btn-primary" id="insertFormBtn" type="button">글쓰기</button>
	</div>
    <div id="corpQnaList" >
        <table class="table table-hover align-middle">
	        <thead class="text-center table-light">
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
	        		<c:when test="${not empty corpQnaList}">
	        			<c:forEach var="corpQna" items="${corpQnaList}" varStatus="status">
							<tr data-num="${corpQna.qna_no}">
								<td>${corpQna.qna_no}</td>
								<td class="text-center">
									${corpQna.qna_secret =='Y' ? '<i class="fa-solid fa-lock"></i>' : '<i class="fa-solid fa-lock-open"></i>'}
								</td>
								<td style="color: ${corpQna.qna_reply_status == 'Y' ? 'green' : 'red'}">
									${corpQna.qna_reply_status =='Y' ? '답변 완료' : '답변 대기'}
								</td>
								<td class="goDetail">${corpQna.qna_title}</td>
								<td>
									${corpQna.store_name == undefined ? '등록된 매장 없음' : corpQna.store_name}<br/>(${fn:substring(corpQna.id, 0, 3)}${'*****'})
								</td>
								<td>${corpQna.qna_regdate}</td>
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
