<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script>
$(function(){
	// 수정 버튼
	$("#qnaUpdateBtn").click(function(){
		if("${qnaDetail.qna_reply_status}"=="Y"){
			alert("답변이 달린 글은 수정할 수 없습니다.");
			return;
		}
		$("#qna_data").attr({
			"method" : "get",
			"action" : "/board/memberQna/memberQnaUpdateForm"
		});
		$("#qna_data").submit();
	})
	// 삭제 버튼
	$("#qnaDeleteBtn").click(function(){
		if("${qnaDetail.qna_reply_status}"=="Y"){
			$.ajax({
				type : "post",
				url : "/board/memberQna/memberQnaReplyDelete",
				data : {
					"qna_no" : '${qnaDetail.qna_no}',
					"qna_reply_img" : '${qnaReplyDetail.qna_reply_img}'
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
		$("#qna_data").attr({
			"method" : "post",
			"action" : "/board/memberQna/memberQnaDelete"
		});
		$("#qna_data").submit();
	})
})
// 합치고 만들기 리턴 true false
function idCheck(){
	
}
</script>
<section class="py-3 container">
	<div class="text-end mb-2">
		<form id="qna_data">
			<input type="hidden" name="id" value="${qnaDetail.id}">
			<input type="hidden" name="qna_no" value="${qnaDetail.qna_no}">
			<input type="hidden" name="qna_img" value="${qnaDetail.qna_img}">
		</form>
		<button class="btn btn-primary" id="qnaUpdateBtn" type="button">문의 수정</button>
		<button class="btn btn-danger" id="qnaDeleteBtn" type="button">문의 삭제</button>
	</div>
    <div>
        <table class="table table-bordered">
	         <colgroup>
	            <col width=15%>
	            <col width=55%>
	            <col width=10%>
	            <col width=20%>
	        </colgroup>
	        <tr>
	        	<td class="text-center">문의 제목</td>
	        	<td colspan="5">
	        		${qnaDetail.qna_secret =='Y' ? '<i class="fa-solid fa-lock"></i>' : '<i class="fa-solid fa-lock-open"></i>'}&nbsp;${qnaDetail.qna_title}
	        	</td>
	        </tr>
	        <tr>
	        	<td class="text-center">닉네임</td>
	        	<td>${qnaDetail.member_nickname}&nbsp;(${fn:substring(qnaDetail.id, 0, 3)}${'*****'})</td>
	        	<td class="text-center">작성일자</td>
	        	<td class="text-center">${qnaDetail.qna_regdate}</td>
	        </tr>
	        <tr style="height: 400px;">
	        	<td class="text-center">문의 내용</td>
	        	<td colspan="5">${qnaDetail.qna_content}</td>
	        </tr>
	        <c:if test="${not empty qnaDetail.qna_img}">
	        <tr>
        		<td class="text-center">이미지</td>
        		<td colspan="5">
        			<img src="/coffeePickStorage/memberQna/${qnaDetail.qna_img}" width="500px"/>
        		</td>
	        </tr>
	        </c:if>
	    </table>	
    </div>
    <c:if test="${qnaDetail.qna_reply_status eq 'Y'}">
   	<div>
        <table class="table table-bordered">
	         <colgroup>
	            <col width=15%>
	            <col width=85%>
	        </colgroup>
	        <tr style="height: 400px;">
	        	<td class="text-center">문의 답변</td>
	        	<td>${qnaReplyDetail.qna_reply_content}</td>
	        </tr>
	        <c:if test="${not empty qnaReplyDetail.qna_reply_img}">
	        <tr>
        		<td class="text-center">이미지</td>
        		<td>
        			<img src="/coffeePickStorage/memberQnaReply/${qnaReplyDetail.qna_reply_img}" width="500px"/>
        		</td>
	        </tr>
	        </c:if>
	    </table>	
    </div>
    </c:if>
    
    
</section>