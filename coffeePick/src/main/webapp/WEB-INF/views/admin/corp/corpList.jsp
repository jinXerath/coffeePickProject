<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf"%>
<link href="/resources/include/css/board.css" rel="stylesheet"/>

<script type="text/javascript">
	$(function(){
		/* $.ajax({
			url:"/admin/member/memberCount",
			type:"get",
			dataType:"text",
			success: function(data){
				$("#memberCount").html(data);
			}
		}); */
		
		// 탈퇴 버튼 제어
		$(".statusBtn").click(function(){
			let corp_id = $(this).parents("tr").attr("data-num");
			let corp_name = $(this).parents("tr").attr("data-name");
			let corp_regdate = $(this).parents("tr").attr("data-regdate");
			let store_name = $(this).parents("tr").attr("data-storeName");
			let registration = $(this).parents("tr").attr("data-regis");
			
			let result = confirm("\n아이디: "+ corp_id +
								"\n대표명: "+ corp_name +
								"\n가입일: "+ corp_regdate+
								"\n매장명: " + store_name +
								"\n사업자번호: " + registration +
								"\n\n※  회원을 정말 탈퇴시키겠습니까?  ※");
			if(result){
				$("#corp_id").val(corp_id);
				$("#statusForm").attr({
					"method":"get",
					"action":"/admin/corp/corpStatus"
				});
				$("#statusForm").submit();
			}
		});
		
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
		let keyword="<c:out value='${CorpVO.keyword}' />";
		let start_date="<c:out value='${CorpVO.start_date}' />";
		let searchRadio="<c:out value='${CorpVO.searchRadio}' />"
		if(keyword!=""){
			$("#keyword").val("<c:out value='${CorpVO.keyword}' />");
			$("#search").val("<c:out value='${CorpVO.search}' />");
		}
		if(start_date!=""){
			$("#searchDate").val("<c:out value='${CorpVO.searchDate}' />");
			$("#start_date").val("<c:out value='${CorpVO.start_date}' />");
			$("#end_date").val("<c:out value='${CorpVO.end_date}' />");
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
			"action":"/admin/corp/corpList"
		});
		$("#f_search").submit();
	}
</script>

<div class="container-fluid px-4">
	<form id="statusForm">
   		<input type="hidden" id="corp_id" name="corp_id" />
   	</form>
	<h1 class="mt-4">가맹점 관리</h1>
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
						<option value="choice">검색어 선택</option>
						<option value="corp_id">아이디</option>
						<option value="corp_name">대표명</option>
						<option value="corp_registration_number">사업자등록번호</option>
						<option value="store_name">매장명</option>
						<option value="store_addr">매장주소</option>
						<option value="corp_email">이메일</option>
						<option value=store_phone>매장 전화번호</option>
						<option value="corp_phone">대표 전화번호</option>
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
						<option value="choiceDate">날짜 선택</option>
						<option value="regDate">가입일</option>
						<option value="store_regdate">매장 등록일</option>
						<option value="leaveDate">탈퇴일</option>
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
					<input value="m_all" type="radio" name="searchRadio" checked /> 전체
				</div>
				<div class="col-1 text-center ">
					<input value="Y" type="radio" name="searchRadio" /> 가입회원
				</div>
				<div class="col-1 text-center ">
					<input value="N" type="radio" name="searchRadio" /> 탈퇴회원
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
			<i class="fa-solid fa-list me-1 "></i> 매장 목록
		</div>
		<div class="card-body fontsize">
			<p>검색된 레코드 수: <span >${pageMaker.total}</span>개</p>

			<table class="table table-striped table-hover ">
				<thead class="text-center table-light">
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">대표명</th>
						<th scope="col">사업자등록번호</th>
						<th scope="col">매장명</th>
						<th scope="col">매장주소</th>
						<th scope="col">이메일</th>
						<th scope="col">가입일</th>
						<th scope="col">매장 등록일</th>
						<th scope="col">매장 전화번호</th>
						<th scope="col">대표 전화번호</th>
						<th scope="col">관리</th>
						<th scope="col">탈퇴일</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:choose>
						<c:when test="${not empty corpList}">
							<c:forEach var="corp" items="${corpList}" varStatus="status">
								<tr data-num="${corp.corp_id}" data-name="${corp.corp_name}"  data-regdate="${corp.corp_regdate}"
									data-storeName="${corp.store.store_name}" data-regis="${corp.corp_registration_number}">
									<td>${corp.corp_id}</td>
									<td>${corp.corp_name}</td>
									<td>${corp.corp_registration_number}</td>
									<td>${corp.store.store_name}</td>
									<td>${corp.store.store_addr}</td>
									<td>${corp.corp_email}</td>
									<td>${corp.corp_regdate}</td>
									<td>${corp.store.store_regdate}</td>
									<td>${corp.store.store_phone}</td>
									<td>${corp.corp_phone}</td>
									<td class=status>
										<c:if test="${corp.corp_status == 'Y' }">
											<button class="statusBtn btn btn-secondary ">탈퇴</button>
										</c:if>
										<c:if test="${corp.corp_status != 'Y' }">
											<span>탈퇴됨</span>
										</c:if>
									</td>
									<td>${corp.corp_leavedate}</td>
								</tr>
							</c:forEach>
						</c:when>
					   	<c:otherwise>
 							<tr>
 								<td colspan="12" class="tac text-center">등록된 회원이 존재하지 않습니다.</td>
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