<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link href="/resources/include/css/board.css" rel="stylesheet"/>
  
    
    
      
    <script type="text/javascript">
    $(function(){
    	
    	//수정 버튼 클릭 시 처리 이벤트
    	$("#updateFormBtn").click(function() {
    		$("#board_img").remove();
        	$("#f_data").attr({
        		"method":"get",
        		"action":"/admin/event/updateForm"
        	});
        	$("#f_data").submit();
    	});
    	
    	// 삭제 버튼 클릭 시 처리
    	$("#boardDeleteBtn").click(function() {
    		if(confirm("정말 삭제하시겠습니까?")){
    			$("#f_data").attr({
            		"method":"post",
            		"action":"/admin/event/noticeDelete"
            	});
            	$("#f_data").submit();
    		}
    	}); 
    	
    	
    	//비밀번호 입력 양식 enter 제거
    	$("#b_pwd").bind("keydown", function(event) {
    		if(event.keycode===13) {  
    			event.preventDefault();
    		}
    	});
    	
  		// 목록으로 이동
  		$("#boardListBtn").click(function(){
  			window.location.href = "/admin/event/eventList"
  		});
  		
  		// 글쓰기로 이동
  	  $('#insertFormBtn').click(function() {
	        location.href = '/admin/event/writeForm';
	   });
  	});
    </script>
   
  
   
<div class=" container">
	<br/><br/>
	<div class="contentTit page-header"><h3 class="text-center">게시글 상세보기</h3></div>
		<form name="f_data" id="f_data">
			<input type="hidden" name="board_no" value="${detail.board_no }" />
			<input type="hidden" name="board_img" id="board_img" value="${detail.board_img }" />
		</form>		
	<br/><br/><br/>
	<%-- 상세 정보 보여주기 시작 --%>
	<div class="contentTB text-center">
		<table class="table table-bordered ">
			<tbody>
				<tr>
					<td class="col-md-3">작성자</td>
					<td class="col-md-3 text-left">${detail.admin_id } </td>
					<td class="col-md-3">작성일</td>
					<td class="col-md-3 text-left">${detail.board_regdate }</td>
				</tr>
				
				<tr>
					<td class="col-md-4">글제목</td>
					<td colspan="3" class="col-md-8 text-left">${detail.board_title}  (조회수:${detail.board_readcnt})</td>
				</tr>
				
				<c:if test="${not empty detail.board_img}">
					<tr>
						<td class="col-md-4">이미지</td>
						<td colspan="3" class="col-md-8 text-left">
							<img src="/coffeePickStorage/board/${detail.board_img}" />
						</td>
					</tr>
				</c:if>
				
				<tr class="table-tr-height">
					<td class="col-md-4">글내용</td>
					<td colspan="3" class="col-md-8 text-left">${detail.board_content}</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	
	<div class="btnArea col-md-12 text-center">
		<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success"/>
		<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success"/>
		<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success"/>
		<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
	</div>
</div>
   				
   			
   			
   			
