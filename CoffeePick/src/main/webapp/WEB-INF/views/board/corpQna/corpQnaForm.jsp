<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">
	$(function(){
		let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			alert(errorMsg);
			errorMsg = "";
		}
		
		
		$("#qna_secret_checkbox").on("change", function () {
            if ($("#qna_secret_checkbox").is(":checked")) {
            	$("#qna_secret").val("Y");
            } else {
            	$("#qna_secret").val("N");
            }
        });
		
		
		$("#qnaInsertBtn").click(function(event){
			event.preventDefault();
			if (!chkData("#qna_title", "문의 제목을")) return;
			else if (!chkData("#qna_content","문의 내용을")) return;
			else {
				if($("#file").val()!=""){
					if(!chkFile($("#file"))) return;
				}
				$("#qnaForm").attr({
					"method" : "post",
					"enctype": "multipart/form-data",
					"action" : "/board/corpQna/corpQnaInsert"
				});
				$("#qnaForm").submit();
			};
		});
		
		// 취소 버튼
		$("#qnaCancelBtn").click(function(event){
			event.preventDefault();
			location.href="/board/corpQna/corpQnaList";
		})
	});
</script>
<div class="container py-5">
    <div class="row py-5">
        <form id="qnaForm" name="qnaForm" class="col-md-9 m-auto">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="id">아이디</label>
                    <input type="email" class="form-control mt-1" id="id" name="id" placeholder="아이디" value="${corp.corp_id}" readonly>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="store_name">매장명</label>
                    <input type="text" class="form-control mt-1" id="store_name" name="store_name" placeholder="store_name" value="${corp.store.store_name}" readonly>
                </div>
            </div>
            <div class="mb-3">
                <label for="qna_title">문의 제목</label>
                <input type="text" class="form-control mt-1" id="qna_title" name="qna_title" placeholder="문의 제목">
            </div>
            <div class="mb-3">
                <label for="qna_content">문의 내용</label>
                <textarea class="form-control mt-1" id="qna_content" name="qna_content" placeholder="문의 내용" rows="20"></textarea>
            </div>
            <div class="mb-3">
                <label for="file">이미지 파일 첨부</label>
                <input type="file" class="form-control mt-1" id="file" name="file">
            </div>
            <div class="mb-3 d-flex justify-content-end">
			    <div class="form-check form-switch">
			        <input class="form-check-input" type="checkbox" id="qna_secret_checkbox" name="qna_secret_checkbox" value="N">
			        <label class="form-check-label" for="qna_secret_checkbox"><i class="fa-solid fa-lock"></i></label>
			    </div>
			</div>
			<input type="hidden" id="qna_secret" name="qna_secret" value="N">
	        <div class="row text-end">
	            <div class="col mt-2">
	                <button id="qnaInsertBtn" class="btn btn-success btn-lg px-3">문의하기</button>
	                <button id="qnaCancelBtn" class="btn btn-secondary btn-lg px-3">취소하기</button>
	            </div>
	    	</div>
        </form>
	</div>
</div>