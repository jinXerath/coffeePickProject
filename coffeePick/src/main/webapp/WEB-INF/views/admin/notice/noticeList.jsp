<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf"%>
<link href="/resources/include/css/board.css" rel="stylesheet"/>

<script type="text/javascript">
	$(function(){
		
		// 초기화 버튼
		$("#cancel").click(function(){
			$("#f_search").each(function() {
				  this.reset();
				});
			$("#pageNum").val(1)
			goPage();
		})
		
		// 입력 양식 enter 제거 --일단 보류
		$("#keyword").bind("keydown",function(event){
			if(event.keyCode == 13) {
				event.preventDefault();
			}
		});
		
		// 검색 후 검색 대상과 단어 유지
		let keyword="<c:out value='${boardVO.keyword}' />";
		let start_date="<c:out value='${boardVO.start_date}' />";
		let searchRadio="<c:out value='${boardVO.searchRadio}' />"
		if(keyword!=""){
			$("#keyword").val("<c:out value='${boardVO.keyword}' />");
			$("#search").val("<c:out value='${boardVO.search}' />");
		}
		if(start_date!=""){
			$("#searchDate").val("<c:out value='${boardVO.searchDate}' />");
			$("#start_date").val("<c:out value='${boardVO.start_date}' />");
			$("#end_date").val("<c:out value='${boardVO.end_date}' />");
		}
		
		if (searchRadio != "") {
		    $(":input:radio[name=searchRadio][value='" + searchRadio + "']").prop('checked', true);
		}
		
		
		// 검색 대상이 변결 될 때 자동으로 커서 이동
		$("#search").change(function(){
			if($("#search").val() != "choice"){
				//console.log($("#search").val());
				$("#keyword").val("");	
				$("#keyword").focus();
				$("#keyword").attr("placeholder","");
			}else if($("#search").val() == "choice"){
				$("#keyword").attr("placeholder","검색어를 선택해 주세요.");
			}
		});
		
		// 검색 버튼 클릭
		$("#searchData").click(function(){
			if($("#search").val()!="choice"){
				if(!chkData("#keyword","검색어를")) return;
			}
			if($("#searchDate").val()!="choiceDate"){
				if(!chkData("#start_date","시작 날짜를")) return;
				else if(!chkData("#end_date","마지막 날짜를")) return;
			}
			$("#pageNum").val(1)
			goPage();
		});
		
		/* 페이지 버튼 클릭 시 이벤트*/
        $(".page-item a").click(function(e){
          e.preventDefault();
          $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
           goPage();
        });
		
      	//글쓰기 버튼 클릭 시 처리 이벤트
		$("#insertFormBtn").click(function() {
			location.href="/admin/notice/writeForm";
		});
      	
		//클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function(){
			let board_no = $(this).parents("tr").attr("data-num");
			$("#board_no").val(board_no);
			//상세 페이지로 이동하기 위해 form추가 (id:detailForm)
			$("#detailForm").attr({
				"method":"get",
				"action":"/admin/notice/noticeDetail"
			});
			$("#detailForm").submit();
			//또 하나의 방법
			//location.href="/board/boardDetail?b_num="+b_num;
		});
		
		
		// 전체 선택/해제 체크박스의 변경 이벤트 처리
	    $("#check_all").click(function () {
	        $(".check_del").prop("checked", this.checked);
	    });
		
	    // 개별 체크박스의 변경 이벤트 처리
	    $(".check_del").click(function () {
	        $("#check_all").prop("checked", $(".check_del").length === $(".check_del:checked").length);
	    });
	    
	    
	    // 체크박스 선택 일괄 삭제
	    $('#checkDelete').click(function() {
	     	if ($(".check_del:checked").length === 0) {
	            alert("삭제할 항목을 선택해 주세요.");
	        } else{
	        	let checkList = [];
	        	
		        $(".check_del:checked").each(function(index, item){
		        	checkList[index] = item.value;
		        });
		        
		        $("#checkList").val(checkList);
	            $("#deleteForm").attr({
	    			"method":"post",
	    			"action":"/admin/notice/checkDelete"
	    		});
	    		$("#deleteForm").submit();
	        	
	        }
	    })
	}); // 함수 종료
	
	//검색 함수
	function goPage(){
		if($("#search").val()=="choice"){
			$("#keyword").val("");
		}
		if($("#searchDate").val()=="choiceDate"){
			$("#start_date").val("");
			$("#end_date").val("");
		}
		
		$("#f_search").attr({
			"method":"get",
			"action":"/admin/notice/noticeList"
		});
		$("#f_search").submit();
	}
	
</script>

<div class="container-fluid px-4">
	<form id="detailForm">
   		<input type="hidden" id="board_no" name="board_no" />
   	</form>
   	<form id="deleteForm" >
    	<input type="hidden" name="checkList" id="checkList" >
	</form>
	<h1 class="mt-4">공지사항 게시판</h1>
	<hr />
	
	
	<form id="f_search" name="f_search" class="card mb-4">
		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }" />
   		<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }" />
		<div class="card-header fs-5">
			<i class="fa-solid fa-magnifying-glass"></i> 검색
		</div>
		<div class="card-body ">
			<!-- 검색 시작 -->
			<div class="row mb-2">
				<div class="col-md-2">
					<select id="search" name="search" class="form-select fontsize" required>
						<option value="choice">선택</option>
						<option value="admin_id">관리자ID</option>
						<option value="admin_name">관리자명</option>
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
						<option value="board_title_content">제목+내용</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" name="keyword" id="keyword" class="form-control fontsize" placeholder="검색어를 선택해 주세요." />
				</div>
			</div>

			<hr />

			<div class="row mb-2">
				<div class="col-md-2">
					<select id="searchDate" name="searchDate" class="form-select fontsize" required>
						<option value="choiceDate">선택</option>
						<option value="regDate">작성일</option>
					</select>
				</div>
				<div class="col-md-2">
					<input type="date" id="start_date" name="start_date" class="form-control fontsize" />
				</div>
				~
				<div class="col-md-2">
					<input type="date" id="end_date" name="end_date" class="form-control fontsize" />
				</div>
			</div>

			<hr />

			<div class="row mb-2 ">
				<div class="col-1 text-center ">
					<input value="m_all" type="radio" name="searchRadio" checked />전체
				</div>
				<div class="col-1 text-center padding" style="margin-right: 15px;">
					<input value="S" type="radio" name="searchRadio" />최고관리자
				</div>
				<div class="col-1 text-center padding">
					<input value="A" type="radio" name="searchRadio" />일반관리자
				</div>
			</div>
			
		</div>
		<div class="card-footer small text-muted text-center">
			<button id="searchData" type="button" class="btn btn-secondary ">검색</button>
			<button id="cancel" type="button" class="btn btn-secondary ">초기화</button>
		</div>
		<!-- 검색 끝 -->
	</form>
	
	<div class="card mb-4">
		<div class="card-header fs-5">
			<i class="fa-solid fa-list me-1 "></i> 공지사항 목록
		</div>
		<div class="card-body ">
			<div class="row">
				<div class="col-sm-4"><p>검색된 레코드 수: <span >${pageMaker.total}</span>개</p></div>
				<div class="col-sm-8 flex">
					<div class="margin2"><input id="checkDelete" type="button" value="삭제" /></div>
					<div class="margin2"><input id="insertFormBtn" type="button" value="글쓰기"/></div>
				</div>
			</div>
			<table class="table table-striped table-hover  ">
				<thead class="text-center table-light">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">관리자ID</th>
						<th scope="col">제목</th>
						<th scope="col">관리자명</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
						<th scope="col">관리</th>
						<th scope="col"><input type="checkbox" id="check_all" /></th>
					</tr>
				</thead>
				<tbody class="text-center ">
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="board" items="${noticeList}" varStatus="status">
								<tr data-num="${board.board_no}" data-title="${board.board_title}" data-id="${board.admin_id}">
									<td>${board.board_no}</td>
									<td>
										<c:if test = "${board.admin.admin_authority =='S'}">
											<i class="fa-solid fa-star fa-2xs"></i>&nbsp;${board.admin_id}
										</c:if>
										<c:if test = "${board.admin.admin_authority !='S'}">
											${board.admin_id}
										</c:if>
									</td>
									<td>${board.board_title}</td>
									<td>${board.admin.admin_name}</td>
									<td>${board.board_regdate}</td>
									<td>${board.board_readcnt}</td>
									<td><input type="button" value="상세보기" class="goDetail" /></td>
									<td scope="col"><input type="checkbox" class="check_del" value="<c:out value='${board.board_no}'/>" /></td>
								</tr>
							</c:forEach>
						</c:when>
					   	<c:otherwise>
 							<tr>
 								<td colspan="7" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
 							</tr>
 						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="text-center">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item previous">
						<a class="page-link" href="${pageMaker.startPage - 1}">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>

				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
				<c:if test="${pageMaker.next}">
					<li class="page-item paginate_button next">
						<a class="page-link" href="${pageMaker.endPage + 1}">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>