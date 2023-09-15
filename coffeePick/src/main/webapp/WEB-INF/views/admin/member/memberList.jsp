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
			$("#member_id").val(member_id);
			$("#statusForm").attr({
				"method":"get",
				"action":"/admin/member/memberStatus"
			});
			$("#statusForm").submit();
		});
		
		// 캔슬버튼
		$("#cancel").click(function(){
			$("#f_search").each(function() {
				  this.reset();
				});
			$("#searchData").click();
		})
		
		// 입력 양식 enter 제거 --일단 복붙, 보류
		$("#keyword").bind("keydown",function(event){
			if(event.keyCode == 13) {
				event.preventDefault();
			}
		});
		
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
			goPage();
		});
		
		
	}); // 큰 함수 종료
	
	
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
					<select id="searchDate" class="form-select fontsize" required>
						<option value="choiceDate">날짜 선택</option>
						<option value="joinDate">가입 날짜</option>
						<!-- <option value="outDate">탈퇴 날짜</option> -->
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
					<input value="N" type="radio" name="searchRadio" /> 회원탈퇴
				</div>
				<div class="col-1 text-center ">
					<input value="Y" type="radio" name="searchRadio" /> 미탈퇴
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
			<p>총 회원수: <span id="memberCount"></span>명</p>

			<table class="table table-striped table-hover">
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
						<th scope="col">가입날짜</th>
						<th scope="col">관리</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<!-- 데이터 출력 --> 
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach var="member" items="${memberList}" varStatus="status">
								<tr data-num="${member.member_id}">
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
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					
				</tbody>
			</table>
		</div>
	</div>
</div>