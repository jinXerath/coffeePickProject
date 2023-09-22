<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script>
function getAdminList() {
	$.ajax({
		type : "post",
		url : "/admin/adminList",
		data : {
			"pageNum" : ($("#pageNum").val() == "") ? 1 : $("#pageNum").val(),
			"amount" : $('#amount').val(),
			"search" : $('#search').val(),
			"keyword" : $('#keyword').val()
		},
		dataType : "json",
		success : function(data) {
			let adminList = data.adminList;
			let pageMaker = data.pageMaker;
			
			$('#pageNum').val(pageMaker.cvo.pageNum);
			
			let tbody = $("#list");
			let paging = $("#paging");
			
			tbody.empty()
			if (adminList.length > 0) {
				$.each(adminList, function(index, admin){
					let row = $('<tr>').attr('data-id', admin.admin_id); 
					row.append('<td>' + admin.admin_id + '</td>');
	                row.append('<td>' + admin.admin_name + '</td>');
	                row.append('<td>' + admin.admin_phone + '</td>');
	                row.append('<td>' + admin.admin_email + '</td>');
	                row.append('<td>' + admin.admin_regdate + '</td>');
	                row.append('<td>' + admin.admin_authority + '</td>');
	                let td7 = $('<td>');
	                let button = $('<button>').attr('type', 'button').addClass('btn btn-secondary adminDeleteBtn').text('탈퇴');
	                td7.append(button);
	                row.append(td7);
	                tbody.append(row);
				});
		        
				let $ul = $('<ul>').addClass('pagination justify-content-center');
				if (pageMaker.prev) {
					let prevContent = "<li class='page-item'>"
						prevContent += "<a class='page-link' data-num='"+ (pageMaker.startPage - 1) +"'>"
						prevContent += "<span aria-hidden='true'>&laquo;</span>"
						prevContent += "</a>"
						prevContent += "</li>"
						
					$ul.append(prevContent);
				}
				for(let num = pageMaker.startPage; num <= pageMaker.endPage; num ++) {
					let	liClass = (pageMaker.cvo.pageNum == num) ? 'page-item active' : 'page-item';
					let content = "<li class='"+ liClass +"'>"
						content += "<a class='page-link' data-num='"+ num +"'>" + num + "</a>";
						content += "</li>"
						
					$ul.append(content);
				}
				if (pageMaker.next) {
					let nextContent = "<li class='page-item'>"
						nextContent += "<a class='page-link' data-num='"+ (pageMaker.endPage + 1) +"'>"
						nextContent += "<span aria-hidden='true'>&raquo;</span>"
						nextContent += "</a>"
						nextContent += "</li>"
							
					$ul.append(nextContent);
				}
		        paging.empty().append($ul);
			}else {
				tbody.html('<tr><td colspan="7" class="text-center">가입된 관리자가 없습니다.</td></tr>');
				paging.empty();
			}
		},
		error : function() {
			alert("관리자 리스트를 받아오지 못했습니다.")
		}
	})
}

$(function(){
	getAdminList();
	
	$(document).on("click", ".page-link", function() {
		$("#pageNum").val($(this).attr("data-num"));
		getAdminList();
	});

	// 검색 폼 enter기능 제거
	$("#keyword").bind("keydown",function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
		}
	})
	
	// 검색 조건 변화 시
	$("#search").change(function() {
		$("#keyword").val("");
		$("#keyword").focus();
	})
	
	//검색 버튼
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
		getAdminList();
	})
	
	//초기화 버튼
	$("#resetBtn").click(function() {
	    $("#pageNum").val(1);
	    $("#search").val("");
	    $("#keyword").val("");
	    getAdminList();
	})
	
	$(document).on("click", ".adminDeleteBtn", function() {
		let admin_id = $(this).parents("tr").attr("data-id");
		$.ajax({
			type : "post",
			url : "/admin/adminInfo",
			data : {
				"admin_id" : admin_id,
			},
			dataType : "json",
			success : function(adminInfo) {
				confirm(adminInfo.admin_name + " 님을 탈퇴처리 하시겠습니까?");	
				$.ajax({
					type : "post",
					url : "/admin/superDelete",
					data : {
						"admin_id" : admin_id,
					},
					dataType : "text",
					success : function(resultData) {
						if(resultData=="성공") {
							alert(adminInfo.admin_name + " 님이 탈퇴처리 되었습니다.");
							getAdminList();
						}else if(resultData=="실패") {
							alert("삭제 실패");
						}
					},
					error : function() {
						alert("오류가 발생했습니다.")
					}
				})
			},
			error : function() {
				alert("오류가 발생했습니다.")
			}
		})
	})
	
})

</script>
<div class="card my-4">
	<div class="card-header">
		<i class="fa-solid fa-list me-1"></i>
		관리자 리스트
	</div>
    <div class="card-body">
		<!-- 관리자 검색 -->
        <div id="adminSearch" class="mb-2">
			<form id="adminSearchForm" name="adminSearchForm" class="row gx-3 gy-2 align-items-center">
				<input id="pageNum" name="pageNum" type="hidden">
				<input id="amount" name="amount" type="hidden" value="10">
				<div class="col-auto">
					<select id="search" name="search" class="form-select">
						<option value="" selected>검색 조건</option>
						<option value="admin_id">아이디</option>
						<option value="admin_name">이름</option>
						<option value="admin_phone">전화번호</option>
						<option value="admin_email">이메일</option>
						<option value="admin_authority">권한</option>
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
		<!-- 관리자 리스트 -->
       	<div id="adminList">
       		<table class="table table-striped table-hover align-middle" summary="관리자 리스트">
				<thead class="text-center table-light">
                	<tr>
	                    <th scope="col">아이디</th>
	                    <th scope="col">이름</th>
	                    <th scope="col">전화번호</th>
	                    <th scope="col">이메일</th>
	                    <th scope="col">가입일</th>
	                    <th scope="col">권한</th>
	                    <th scope="col">탈퇴</th>
                   	</tr>
              	</thead>
              	<tbody id="list" class="text-center"></tbody>
       		</table>
       	</div>
       	<!-- 페이징 -->
       	<div id="paging"></div>
	</div>
</div>