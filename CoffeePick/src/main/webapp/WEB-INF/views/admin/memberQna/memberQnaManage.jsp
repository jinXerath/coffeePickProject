<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	#qnaDetailForm{
		display: none;
	}
	#qnaReplyFormDiv{
		display: none;
	}
</style>
<script>
/**
 * 개인 회원 문의 리스트 출력
 * 문의 검색 및 페이징
 */
function getMemberQnaList() {
	$.ajax({
		type : "post",
		url : "/admin/memberQna/memberQnaList",
		data : {
			"pageNum" : ($("#pageNum").val() == "") ? 1 : $("#pageNum").val(),
			"amount" : $('#amount').val(),
			"search" : $('#search').val(),
			"keyword" : $('#keyword').val()
		},
		dataType : "json",
		success : function(data) {
			let memberQnaList = data.memberQnaList;
			let pageMaker = data.pageMaker;
			
			$('#pageNum').val(pageMaker.cvo.pageNum);
			
			let tbody = $("#list");
			let paging = $("#paging");
			
			tbody.empty()
			if (memberQnaList.length > 0) {
				$.each(memberQnaList, function(index, memberQna){
					let row = $('<tr>').attr('data-no', memberQna.qna_no); 
					row.append('<td>' + memberQna.qna_no + '</td>');
	                row.append('<td>' + (memberQna.qna_secret=='Y' ?'<i class="fa-solid fa-lock"></i>' : '<i class="fa-solid fa-lock-open"></i>')+ '</td>');
	                
	                let textColor = (memberQna.qna_reply_status === 'Y') ? 'green' : 'red';
	                row.append('<td  style="color: ' + textColor + '">' + (memberQna.qna_reply_status=='Y' ? '답변 완료' : '답변 대기') + '</td>');
	                
	                row.append('<td>' + memberQna.qna_title + '</td>');
	                row.append('<td>' + memberQna.member_nickname + '<br/>' + memberQna.id + '</td>');
	                row.append('<td>' + memberQna.qna_regdate + '</td>');
	                let td7 = $('<td>');
	                let button = $('<button>').attr('type', 'button').addClass('btn btn-secondary memberQnaDetailBtn').text('조회');
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
				tbody.html('<tr><td colspan="7" class="text-center">작성된 상담/문의가 없습니다.</td></tr>');
				paging.empty();
			}
		},
		error : function() {
			alert("상담/문의 리스트를 받아오지 못했습니다.")
		}
	})
}

/**
 * 문의 상세 출력 qna_no 필요
 * 문의 답변 상태가 N이면 답변을 작성할 수 있는 버튼과 삭제 버튼 생성
 * 답변이 있으면 답변과 답변수정,답변삭제,문의삭제 버튼 생성
 */
function getMemberQnaDetail(qna_no) {
	$.ajax({
		type : "post",
		url : "/admin/memberQna/memberQnaDetail",
		data : {
			"qna_no" : qna_no,
		},
		dataType : "json",
		success : function(data) {
			let qnaDetail = $("#qnaDetail");
			qnaDetail.empty();
			
	        let qnaTable = '<table class="table table-bordered">' +
	            '<colgroup>' +
	            '<col width="15%">' +
	            '<col width="55%">' +
	            '<col width="10%">' +
	            '<col width="20%">' +
	            '</colgroup>' +
	            '<tr>' +
	            '<td class="text-center">문의 제목</td>' +
	            '<td colspan="5">' +
	            (data.qna_secret == 'Y' ? '<i class="fa-solid fa-lock"></i>' : '<i class="fa-solid fa-lock-open"></i>') + '&nbsp;' + data.qna_title +
	            '</td>' +
	            '</tr>' +
	            '<tr>' +
	            '<td class="text-center">닉네임(아이디)</td>' +
	            '<td>' + data.member_nickname + '&nbsp;(' + data.id + ')</td>' +
	            '<td class="text-center">작성일자</td>' +
	            '<td class="text-center">' + data.qna_regdate + '</td>' +
	            '</tr>' +
	            '<tr style="height: 400px;">' +
	            '<td class="text-center">문의 내용</td>' +
	            '<td colspan="5">' + data.qna_content + '</td>' +
	            '</tr>';
	        if (data.qna_img) {
	            qnaTable += '<tr>' +
	                '<td class="text-center">이미지</td>' +
	                '<td colspan="5">' +
	                '<img src="/coffeePickStorage/memberQna/' + data.qna_img + '" width="300px"/>' +
	                '</td>' +
	                '</tr>';
	        }
	        qnaTable += '</table>';
			
	        if(data.qna_reply_status == "N") {
	        let qnaBtn = '<div id="qnaBtn" class="text-center">';
	        	qnaBtn += '<button id="qnaReplyFormBtn" data-no="'+ data.qna_no +'" class="btn btn-primary me-2">답변작성</button>'
	        	qnaBtn += '<button id="qnaDeleteBtn" data-no="'+ data.qna_no +'" data-img="'+ ((data.qna_img == null) ? "" : data.qna_img) +'" class="btn btn-danger">문의삭제</button>'+
	            		  '</div>';
	            let qnaContent = qnaTable + qnaBtn;
	            qnaDetail.html(qnaContent);
	        }else if(data.qna_reply_status == "Y") {
	        	$.ajax({
	        		type : "post",
	        		url : "/board/memberQna/memberQnaReplyDetail",
	        		data : {
	        			"qna_no" : qna_no,
	        		},
	        		dataType : "json",
	        		success : function(replyData) {
	        			let qnaReplyDiv = '<div id="qnaReplyDiv">'+
					       				'<hr/>'+
					       				'<table class="table table-bordered">'+
					       				'<colgroup><col width=15%><col width=85%></colgroup>'+
					       				'<tr>'+
					       				'<td class="text-center">관리자 아이디</td>'+
					       				'<td>'+replyData.admin_id+'</td>'+
					       				'</tr>'+
					       				'<tr style="height: 400px;">'+
					    	        	'<td class="text-center">문의 답변</td>'+
					    	        	'<td>'+replyData.qna_reply_content+'</td>'+
					    	        	'</tr>';
						if(replyData.qna_reply_img){
							qnaReplyDiv += '<tr>';
							qnaReplyDiv += '<td class="text-center">이미지</td>';
							qnaReplyDiv += '<td>';
							qnaReplyDiv += '<img src="/coffeePickStorage/memberQnaReply/'+replyData.qna_reply_img+'" width="300px"/>';
							qnaReplyDiv += '</td>';
							qnaReplyDiv += '</tr>';
						}
						qnaReplyDiv += '</table>';
						qnaReplyDiv += '<div id="qnaReplyBtn" class="col text-center">'+
			            			'<button id="qnaReplyUpdateFormBtn" data-no="'+ qna_no +'" data-reply_content="'+ replyData.qna_reply_content +'"  data-reply_img="'+ ((replyData.qna_reply_img == null) ? "" : replyData.qna_reply_img) +'" class="btn btn-primary me-2">답변수정</button>'+
			            			'<button id="qnaReplyDeleteBtn" data-no="'+ qna_no +'" data-reply_img="'+ ((replyData.qna_reply_img == null) ? "" : replyData.qna_reply_img) +'" class="btn btn-danger me-2">답변삭제</button>'+
			            			'<button id="qnaAllDeleteBtn" data-no="'+ qna_no +'" data-img="'+ ((data.qna_img == null) ? "" : data.qna_img) +'" data-reply_img="'+ ((replyData.qna_reply_img == null) ? "" : replyData.qna_reply_img) +'" class="btn btn-danger">문의삭제</button>'+
			            			'</div>';
						qnaReplyDiv += '</div>';
						let qnaContent = qnaTable + qnaReplyDiv;
			            qnaDetail.html(qnaContent);
	        		}
	        	})
	        }
	        $("#qnaDetailForm").show();
		},
		error : function() {
			alert("오류가 발생했습니다 getMemberQnaDetail.")
		}
	})
}
/**
 * 문의 답글 삭제 qna_no, qna_reply_img
 * 문의 답글을 삭제 할 수 있음
 */
function getMemberQnaReplyDelete(qna_no, qna_reply_img) {
	$.ajax({
		type : "post",
		url : "/board/memberQna/memberQnaReplyDelete",
		data : {
			"qna_no" : qna_no,
			"qna_reply_img" : qna_reply_img
		},
		dataType : "text",
		success : function(resultData) {
			if(resultData=="성공") {
				alert("답글 삭제 성공")
			}
		},
		error : function() {
			alert("오류가 발생했습니다.getMemberQnaReplyDelete")
		}
	})
}

/**
 * 문의 글을 삭제 qna_no, qna_img
 * 문의 답변이 있으면 getMemberQnaReplyDelete를 사용하고 사용해야 함
 * 문의 글을 먼저 삭제하면 db에서는 문의 답변까지 삭제 하지만
 * 서버 사진 저장소에는 사진이 지워지지 않은 상태로 지워짐
 */
function getMemberQnaDelete(qna_no, qna_img) {
	$.ajax({
		type : "post",
		url : "/admin/memberQna/memberQnaDelete",
		data : {
			"qna_no" : qna_no,
			"qna_img" : qna_img
		},
		dataType : "text",
		success : function(resultData) {
			if(resultData=="성공") {
				alert("상담/문의 글이 삭제되었습니다.");
				$("#qnaDetailForm").hide();
			}else if(resultData=="실패") {
				alert("상담/문의 글 삭제 실패");
			}
		},
		error : function() {
			alert("오류가 발생했습니다.getMemberQnaDelete")
		}
	})
}

/*=====================================================================================*/
$(function(){
	getMemberQnaList();
	
	/*=====================================================================================*/
	// 페이지 이동 버튼
	$(document).on("click", ".page-link", function() {
		$("#pageNum").val($(this).attr("data-num"));
		getMemberQnaList();
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
		getMemberQnaList();
	})
	
	//초기화 버튼
	$("#resetBtn").click(function() {
	    $("#pageNum").val(1);
	    $("#search").val("");
	    $("#keyword").val("");
	    getMemberQnaList();
	})
	/*=====================================================================================*/
	// 문의 상세 닫기
	$(".btn-close").click(function(event){
		event.preventDefault();
		$("#qnaDetailForm").hide();
	})
	$("#qnaDetailFormCloseBtn").click(function(){
		$("#qnaDetailForm").hide();
	})
	/*=====================================================================================*/
	
	// 문의 상세보기
	$(document).on("click", ".memberQnaDetailBtn", function() {
		let qna_no = $(this).parents("tr").attr("data-no");
		getMemberQnaDetail(qna_no);
	})
	// 답변 없는 문의 글 삭제
	$(document).on("click", "#qnaDeleteBtn", function() {
		let qna_no = $(this).attr("data-no");
		let qna_img = $(this).attr("data-img");
		if (confirm("상담/문의 글을 삭제하시겠습니까?")) {
			getMemberQnaDelete(qna_no, qna_img)
			getMemberQnaList();
		}
	})
	/*=====================================================================================*/
	// 답변 창 열기
	$(document).on("click", "#qnaReplyFormBtn", function() {
		let qna_no = $(this).attr("data-no");
		let qnaReplyFormDiv = '<div id="qnaReplyFormDiv">' +
						'<hr/>'+
						'<form id="qnaReplyForm" name="qnaReplyForm" class="col-md-9 m-auto">'+
						'<input type="hidden" id="qna_no" name="qna_no" value="'+qna_no+'">'+
						'<div class="form-group col-md-6 mb-3">'+
						'<label for="admin_id">관리자 아이디</label>'+
						'<input type="text" class="form-control mt-1" id="admin_id" name="admin_id" placeholder="관리자 아이디" value="${adminLogin.admin_id}" readonly>'+
						'</div>'+
            			'<div class="mb-3">'+
            			'<label for="qna_reply_content">문의 답변</label>'+
            			'<textarea class="form-control mt-1" id="qna_reply_content" name="qna_reply_content" placeholder="문의 답변" rows="20"></textarea>'+
            			'</div>'+
            			'<div class="mb-3">'+
            			'<label for="file">이미지 파일 첨부</label>'+
            			'<input type="file" class="form-control mt-1" id="file" name="file">'+
            			'</div>'+
            			'<div class="col text-center">'+
            			'<button id="qnaReplyInsertBtn" data-no="'+ qna_no +'" class="btn btn-primary me-2">답변하기</button>'+
            			'<button id="qnaReplyCloseBtn" class="btn btn-secondary">취소하기</button>'+
            			'</div>'+
            			'</form>'+
            			'</div>';
    	let qnaDetail = $("#qnaDetail");    			
		qnaDetail.append(qnaReplyFormDiv);		
		$("#qnaBtn").hide();
		$("#qnaReplyFormDiv").show();
	})
	
	// 답변 창 닫기
	$(document).on("click", "#qnaReplyCloseBtn", function(event) {
		event.preventDefault();
		$("#qnaReplyFormDiv").hide();
		$("#qnaBtn").show();
	})
	
	// 답변하기 버튼 이벤트
	$(document).on("click", "#qnaReplyInsertBtn", function(event) {
		event.preventDefault();
		
		let qna_no = $(this).attr("data-no");
		let formData = new FormData($('#qnaReplyForm')[0]);
		
		$.ajax({
			type : "post",
			url : "/board/memberQna/memberQnaReplyInsert",
			data : formData,
			dataType : "text",
	        processData: false, // 중요: 데이터 처리를 jQuery에게 위임하지 않습니다.
	        contentType: false, 
			success : function(resultData) {
				if(resultData=="성공") {
					alert("상담/문의 답변이 작성되었습니다.");
					getMemberQnaList();
					getMemberQnaDetail(qna_no);
				}else if(resultData=="실패") {
					alert("답변 작성 실패");
				}
			},
			error : function() {
				alert("오류가 발생했습니다.")
			}
		})
	})
	/*=====================================================================================*/
	
	// 답변 삭제
	$(document).on("click", "#qnaReplyDeleteBtn", function() {
		let qna_no = $(this).attr("data-no");
		let qna_reply_img = $(this).attr("data-reply_img");
		if (confirm("상담/문의 답변을 삭제하시겠습니까?")) {
			getMemberQnaReplyDelete(qna_no, qna_reply_img)
			alert("답변이 삭제되었습니다.")
			getMemberQnaDetail(qna_no);
			getMemberQnaList();
		}
	})
	
	// 답변 있는 문의 글 삭제
	$(document).on("click", "#qnaAllDeleteBtn", function() {
		let qna_no = $(this).attr("data-no");
		let qna_img = $(this).attr("data-img");
		let qna_reply_img = $(this).attr("data-reply_img");
		if (confirm("상담/문의 글을 삭제하시겠습니까?")) {
			getMemberQnaReplyDelete(qna_no, qna_reply_img);
			getMemberQnaDelete(qna_no, qna_img);
			alert("답변이 삭제되었습니다.")
			getMemberQnaList();
		}
	})
	
	// 답변 수정 폼 열기
	$(document).on("click", "#qnaReplyUpdateFormBtn", function() {
		let qna_no = $(this).attr("data-no");
		let qna_reply_content = $(this).attr("data-reply_content");
		let qna_reply_img = $(this).attr("data-reply_img");
		let qnaReplyUpdateFormDiv = '<div id="qnaReplyUpdateDiv">'+
								'<form id="qnaReplyUpdateForm" name="qnaReplyUpdateForm" class="col-md-9 m-auto">'+
								'<input type="hidden" name="qna_no" value="'+ qna_no +'">'+
								'<div class="form-group col-md-6 mb-3">'+
								'<label for="admin_id">관리자 아이디</label>'+
								'<input type="email" class="form-control mt-1" id="admin_id" name="admin_id" placeholder="관리자 아이디" value="${adminLogin.admin_id}" readonly>'+
								'</div>'+
								'<div class="mb-3">'+
								'<label for="qna_reply_content">문의 답변</label>'+
								'<textarea class="form-control mt-1" id="qna_reply_content" name="qna_reply_content" placeholder="문의 답변" rows="20">'+qna_reply_content+'</textarea>'+
								'</div>'+
								'<div class="mb-3">'+
								'<label for="file">이미지 파일 첨부</label>'+
								'<input type="file" class="form-control mt-1" id="updateFile" name="file">'+
								'</div>'+
								'<input type="hidden" id="qna_reply_img" name="qna_reply_img"  value="'+qna_reply_img+'">'+
								'<input type="hidden" id="qna_reply_img_delete" name="qna_reply_img_delete" value="">'+
								'<input type="hidden" id="qna_reply_img_delete_history" name="qna_reply_img_delete_history" value="">';
		if(qna_reply_img != "") {
			qnaReplyUpdateFormDiv += '<div class="mb-3" id="beforeImg">'+
									'<div>등록된 이미지 <button id="imageDeleteBtn" class="btn btn-secondary btn-sm">이미지 지우기</button></div>'+
									'<figure class="figure">'+
									'<img src="/coffeePickStorage/memberQnaReply/'+qna_reply_img+'" class="figure-img img-fluid rounded" width="300px">'+
									'<figcaption class="figure-caption">업로드된 파일: '+qna_reply_img+'</figcaption>'+
									'</figure>'+
									'</div>';
		}
		qnaReplyUpdateFormDiv +='<div class="text-center">'+
								'<button id="qnaReplyUpdateBtn" data-no="'+ qna_no +'" class="btn btn-primary me-2">수정하기</button>'+
								'<button id="qnaReplyUpdateCancelBtn" class="btn btn-secondary">취소하기</button>'+
								'</div>'+
								'</form>'+
								'</div>';
		let qnaDetail = $("#qnaDetail");    			
		qnaDetail.append(qnaReplyUpdateFormDiv);	
		$("#qnaReplyDiv").hide();

		//qnaReplyBtn
								
	})
	// 답변 수정하기
	$(document).on("click", "#qnaReplyUpdateBtn", function(event) {
		event.preventDefault();
		let qna_no = $(this).attr("data-no");
		let formData = new FormData($('#qnaReplyUpdateForm')[0]);
		alert($("#qna_reply_img_delete").val())
		$.ajax({
			type : "post",
			url : "/board/memberQna/memberQnaReplyUpdate",
			data : formData,
			dataType : "text",
	        processData: false, // 중요: 데이터 처리를 jQuery에게 위임하지 않습니다.
	        contentType: false, 
			success : function(resultData) {
				if(resultData=="성공") {
					alert("상담/문의 답변이 수정되었습니다.");
					getMemberQnaList();
					getMemberQnaDetail(qna_no);
				}else if(resultData=="실패") {
					alert("답변 수정 실패");
				}
			},
			error : function() {
				alert("오류가 발생했습니다.")
			}
		})
	})
	
	// 답변 수정 취소하기
	$(document).on("click", "#qnaReplyUpdateCancelBtn", function(event) {
		event.preventDefault();
		$("#qnaReplyUpdateDiv").hide();
		$("#qnaReplyDiv").show();
	})
	
	$(document).on("change", "#updateFile", function(event) {
		event.preventDefault();
     		alert("파일이 들어왔습니다.");
       	 	if (this.files.length > 0) {
       	 		if($("#beforeImg").is(":visible")){
       	 			$("#beforeImg").hide();
       				$("#qna_reply_img_delete").val("delete");
       				$("#qna_reply_img_delete_history").val("delete");
       	 		}
				$("#qna_reply_img_delete").val("");
       	 	} else {
	       	 	if($("#qna_reply_img_delete_history").val() == "delete"){
	       	 		$("#qna_reply_img_delete").val("delete");
			    }else {
			    	$("#qna_reply_img_delete").val("");
			    }
       	 	}
       	 	alert($("#qna_reply_img_delete").val())
	});
	
	$(document).on("click", "#imageDeleteBtn", function(event) {
		event.preventDefault();
		$("#beforeImg").hide();
		$("#qna_reply_img_delete").val("delete");
		$("#qna_reply_img_delete_history").val("delete");
	})
	/*=====================================================================================*/
})

</script>
<div class="container-fluid px-4">
    <h1 class="my-4">상담/문의 (개인)</h1>
	<div class="card my-4">
		<div class="card-header">
			<i class="fa-solid fa-list me-1"></i>
			상담/문의 리스트
		</div>
	    <div class="card-body">
			<!-- 상담/문의 검색 -->
	        <div id="adminSearch" class="mb-2">
				<form id="adminSearchForm" name="adminSearchForm" class="row gx-3 gy-2 align-items-center">
					<input id="pageNum" name="pageNum" type="hidden">
					<input id="amount" name="amount" type="hidden" value="10">
					<div class="col-auto">
						<select id="search" name="search" class="form-select">
							<option value="" selected>검색 조건</option>
							<option value="member_qna_title">문의 제목</option>
							<option value="member_id">아이디</option>
							<option value="member_nickname">닉네임</option>
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
			<!-- 상담/문의 리스트 -->
	       	<div id="memberQnaList">
	       		<table class="table table-striped table-hover align-middle" summary="개인회원 상담/문의 리스트">
					<thead class="text-center table-light">
	                	<tr>
		                    <th scope="col">번호</th>
		                    <th scope="col">비밀</th>
		                    <th scope="col">답변</th>
		                    <th scope="col">문의 제목</th>
		                    <th scope="col">작성자</th>
		                    <th scope="col">작성일자</th>
		                    <th scope="col">조회</th>
	                   	</tr>
	              	</thead>
	              	<tbody id="list" class="text-center"></tbody>
	       		</table>
	       	</div>
	       	<!-- 페이징 -->
	       	<div id="paging"></div>
		</div>
	</div>
	
	<div class="card my-4" id="qnaDetailForm">
		<div class="card-header d-flex justify-content-between align-items-center">
		    <div>
		        <i class="fa-solid fa-list me-1"></i>
		        상담/문의 상세
		    </div>
		    <div class="ml-auto">
		        <button type="button" class="btn-close"></button>
		    </div>
		</div>
	    <div class="card-body" id="qnaDetail"></div>
	    
	    
		<div class="card-footer text-center">
            <button type="button" class="btn btn-secondary" id="qnaDetailFormCloseBtn">닫기</button>
	    </div>
	</div>
</div>