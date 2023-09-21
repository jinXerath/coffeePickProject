<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf"%>
<link href="/resources/include/css/board.css" rel="stylesheet"/>

<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"/admin/member/memberCount",
			type:"get",
			dataType:"text",
			success: function(data){
				$("#memberCount").html(data);
			}
		});
		
		// 탈퇴 버튼 제어
		$(".statusBtn").click(function(){
			let member_id = $(this).parents("tr").attr("data-num");
			let member_name = $(this).parents("tr").attr("data-name");
			let member_regdate = $(this).parents("tr").attr("data-regdate");
			let member_point = $(this).parents("tr").attr("data-point");
			let member_pickmoney = $(this).parents("tr").attr("data-pickmoney");
			
			let result = confirm("\n아이디: "+ member_id +
								"\n이   름: "+ member_name +
								"\n가입일: "+ member_regdate+
								"\n\n보유 포인트: " + member_point +
								"\n보유 픽머니: "+ member_pickmoney +
								"\n\n※  회원을 정말 탈퇴시키겠습니까?  ※");
			if(result){
				$("#member_id").val(member_id);
				$("#statusForm").attr({
					"method":"get",
					"action":"/admin/member/memberStatus"
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
		let keyword="<c:out value='${memberVO.keyword}' />";
		let start_date="<c:out value='${memberVO.start_date}' />";
		let searchRadio="<c:out value='${memberVO.searchRadio}' />"
		if(keyword!=""){
			$("#keyword").val("<c:out value='${memberVO.keyword}' />");
			$("#search").val("<c:out value='${memberVO.search}' />");
		}
		if(start_date!=""){
			$("#searchDate").val("<c:out value='${memberVO.searchDate}' />");
			$("#start_date").val("<c:out value='${memberVO.start_date}' />");
			$("#end_date").val("<c:out value='${memberVO.end_date}' />");
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
			"action":"/admin/member/memberList"
		});
		$("#f_search").submit();
	}
</script>

<div class="container-fluid px-4">
	<form id="statusForm">
   		<input type="hidden" id="member_id" name="member_id" />
   	</form>


	<h1 class="mt-4">이용자 관리</h1>
	<hr />


	<form id="f_search" name="f_search" class="card mb-4">
		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }" />
   		<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }" />
		<div class="card-header fs-5">
			<i class="fa-solid fa-magnifying-glass"></i> 검색
		</div>
		<div class="card-body">
			<!-- 검색 시작 -->
			<div class="row mb-2">
				<div class="col-md-2">
					<select id="search" name="search" class="form-select fontsize" required>
						<option value="choice">검색어 선택</option>
						<option value="member_id">아이디</option>
						<option value="member_name">이름</option>
						<option value="member_nickname">닉네임</option>
						<option value="member_email">이메일</option>
						<option value="member_addr">주소</option>
						<option value="member_phone">전화번호</option>
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
			<i class="fa-solid fa-list me-1"></i> 회원 목록
		</div>
		<div class="card-body fontsize">
			<!-- <p>가입한 회원 수: <span id="memberCount"></span>명</p> -->
			<p>검색된 레코드 수: <span >${pageMaker.total}</span>개</p>
			
			
			<table class="table table-striped table-hover ">
				<thead class="text-center table-light">
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">닉네임</th>
						<th scope="col">이메일</th>
						<th scope="col">주소</th>
						<th scope="col">전화번호</th>
						<th scope="col">포인트</th>
						<th scope="col">픽머니</th>
						<th scope="col">가입일</th>
						<th scope="col">관리</th>
						<th scope="col">탈퇴일</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<!-- 데이터 출력 --> 
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach var="member" items="${memberList}" varStatus="status">
								<tr data-num="${member.member_id}" data-name="${member.member_name}" data-pickmoney="${member.pickmoney.pickmoney_total}"
									data-point="${member.point.point_total}"  data-regdate="${member.member_regdate}">
									<td>${member.member_id}</td>
									<td>${member.member_name}</td>
									<td>${member.member_nickname}</td>
									<td>${member.member_email}</td>
									<td>${member.member_addr}</td>
									<td>${member.member_phone}</td>
									<td>${member.point.point_total}</td>
									<td>${member.pickmoney.pickmoney_total}</td>
									<td>${member.member_regdate}</td>
									<td class=status>
										<c:if test="${member.member_status == 'Y' }">
											<button class="statusBtn btn btn-secondary ">탈퇴</button>
										</c:if>
										<c:if test="${member.member_status != 'Y' }">
											<span>탈퇴됨</span>
										</c:if>
									</td>
									<td>${member.member_leavedate}</td>
								</tr>
							</c:forEach>
						</c:when>
					   	<c:otherwise>
 							<tr>
 								<td colspan="10" class="tac text-center">등록된 회원이 존재하지 않습니다.</td>
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