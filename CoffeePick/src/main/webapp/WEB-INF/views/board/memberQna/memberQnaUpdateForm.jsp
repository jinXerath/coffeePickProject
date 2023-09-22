<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">
	$(function(){
		if ($("#qna_secret").val()=="Y") {
			$("#qna_secret_checkbox").prop("checked", true)
		}else {
			$("#qna_secret_checkbox").prop("checked", false)
		}
		
		$("#qna_secret_checkbox").on("change", function () {
            if ($("#qna_secret_checkbox").is(":checked")) {
            	$("#qna_secret").val("Y");
            } else {
            	$("#qna_secret").val("N");
            }
        });
		
		$("#imageDeleteBtn").on("click",function(event){
			event.preventDefault();
			$("#beforeImg").hide();
			$("#qna_img_delete").val("delete");
			$("#qna_img_delete_history").val("delete");
		})
		
		$("#file").change(function() {
       		alert("파일이 들어왔습니다.");
       	 	if (this.files.length > 0) {
       	 		if($("#beforeImg").is(":visible")){
       	 			$("#beforeImg").hide();
       				$("#qna_img_delete").val("delete");
       				$("#qna_img_delete_history").val("delete");
       	 		}
				$("#qna_img_delete").val("");
       	 	} else {
	       	 	if($("#qna_img_delete_history").val() == "delete"){
	       	 		$("#qna_img_delete").val("delete");
			    }else {
			    	$("#qna_img_delete").val("");
			    }
       	 	}
       	 	alert($("#qna_img_delete").val())
		});
		
		$("#qnaUpdateBtn").on("click",function(event){
			event.preventDefault();
			if (!chkData("#qna_title", "문의 제목을")) return;
			if (!chkData("#qna_content","문의 내용을")) return;
			
			$("#qnaUpdateForm").attr({
				"method" : "post",
				"enctype": "multipart/form-data",
				"action" : "/board/memberQna/memberQnaUpdate"
			});
			$("#qnaUpdateForm").submit();
		})
		
		$("#qnaCancelBtn").on("click",function(event){
			event.preventDefault();

			location.href="/board/memberQna/memberQnaDetail?qna_no=${updateData.qna_no}";
		})

	})
</script>
<div class="container py-3">
    <div class="row">
        <form id="qnaUpdateForm" name="qnaUpdateForm" class="col-md-9 m-auto">
        	<input type="hidden" name="qna_no" value="${updateData.qna_no}">
            <div class="row">
                <div class="form-group col-md-6 mb-3">
                    <label for="id">아이디</label>
                    <input type="email" class="form-control mt-1" id="id" name="id" placeholder="아이디" value="${updateData.id}" readonly>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="member_nickname">닉네임</label>
                    <input type="text" class="form-control mt-1" id="member_nickname" name="member_nickname" placeholder="닉네임" value="${updateData.member_nickname}" readonly>
                </div>
            </div>
            <div class="mb-3">
                <label for="qna_title">문의 제목</label>
                <input type="text" class="form-control mt-1" id="qna_title" name="qna_title" placeholder="문의 제목" value="${updateData.qna_title}">
            </div>
            <div class="mb-3">
                <label for="qna_content">문의 내용</label>
                <textarea class="form-control mt-1" id="qna_content" name="qna_content" placeholder="문의 내용" rows="20">${updateData.qna_content}</textarea>
            </div>
            <div class="mb-3">
                <label for="file">이미지 파일 첨부</label>
                <input type="file" class="form-control mt-1" id="file" name="file">
            </div>
            <input type="hidden" id="qna_img" name="qna_img"  value="${updateData.qna_img}">
            <input type="hidden" id="qna_img_delete" name="qna_img_delete">
            <input type="hidden" id="qna_img_delete_history" name="qna_img_delete_history">
            <c:if test="${not empty updateData.qna_img}">
            <div class="mb-3" id="beforeImg">
            	<div>등록된 이미지 <button id="imageDeleteBtn" class="btn btn-secondary btn-sm">이미지 지우기</button></div>
	            <figure class="figure">
					<img src="/coffeePickStorage/memberQna/${updateData.qna_img}" class="figure-img img-fluid rounded">
				  	<figcaption class="figure-caption">업로드된 파일: ${updateData.qna_img}</figcaption>
				</figure>
            </div>
            </c:if>
            <div class="mb-3 d-flex justify-content-end">
			    <div class="form-check form-switch">
			        <input class="form-check-input" type="checkbox" id="qna_secret_checkbox" name="qna_secret_checkbox" value="N">
			        <label class="form-check-label" for="qna_secret_checkbox"><i class="fa-solid fa-lock"></i></label>
			    </div>
			</div>
			<input type="hidden" id="qna_secret" name="qna_secret" value="${updateData.qna_secret}">
            <div class="col text-end">
                <button id="qnaUpdateBtn" class="btn btn-success btn-lg">수정하기</button>
                <button id="qnaCancelBtn" class="btn btn-secondary btn-lg">취소하기</button>
            </div>
        </form>
	</div>
</div>