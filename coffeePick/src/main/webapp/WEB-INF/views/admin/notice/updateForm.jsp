<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
<link href="/resources/include/css/board.css" rel="stylesheet"/>   

  
   <script type="text/javascript">
    $(function() {
    		$("#boardUpdateBtn").click(function(){
    			//입력값 체크
    			if(!chkData("#board_title","제목을")) return;
    			else if(!chkData("#board_content","작성할 내용을")) return;
    			else{
    				if($("#file").val()!=""){
    					if(!chkFile($("#file"))) return;
    				}
    				$("#f_updateForm").attr({
    					"method":"post",
    					"enctype":"multipart/form-data",
    					"action":"/admin/notice/noticeUpdate"
    				});
    				$("#f_updateForm").submit();
    			}
    		});
    		
    		/*취소 버튼 클릭 시 처리 이벤트*/
    		$("#boardCancelBtn").click(function() {
    			$("#f_updateForm").each(function() {
    				this.reset();
    			});
    		});
    		
    		/*목록 버튼 클릭 시 처리 이벤트*/
    		$("#boardListBtn").click(function(){
    			location.href="/admin/notice/noticeList";
    		});
    	});
    </script>
<div class="container"><br/><br/>
	<div class="contentTit page-header"><h3 class="text-center">게시글 수정</h3></div>
	<br/><br/><br/>
	<div class="contentTB text-center">
		<form id="f_updateForm" name="f_updateForm">
			<input type="hidden" id="board_no" name="board_no" value="${updateData.board_no }" />
			<input type="hidden" id="board_img" name="board_img" value="${updateData.board_img}" />
			<input type="hidden" id="admin_id" name="admin_id" value="${adminLogin.admin_id}" />
			
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-3">글번호</td>
						<td class=" col-md-3">${updateData.board_no }</td>
						<td class="col-md-3">작성일</td>
						<td class=" col-md-3">${updateData.board_regdate }</td>
					</tr>
					<tr>
						<td class="col-md-3">이전 작성자</td>
						<td class="text-start col-md-3">${updateData.admin_id }</td>
						<td class="col-md-3">수정 작성자</td>
						<td class="text-start col-md-3">${adminLogin.admin_id}</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3" class="text-start">
							<input type="text" name="board_title" id="board_title"
							value="${updateData.board_title }" class="form-control" />
						</td>
					</tr>
					
					<tr>
						<td>이미지파일첨부</td>
						<td colspan="3" class="text-left">
							<input type="file" name="file" id="file" />
						</td>
					</tr>
					
					<tr class="">
						<td>내용</td>
						<td colspan="3" class="text-start">
							<textarea name="board_content" id="board_content" class="form-control" rows="8" >${updateData.board_content}</textarea>
								
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	
	<div class="contentBtn text-center">
		<button type="button" id="boardUpdateBtn" class="btn btn-success">수정</button>
		<button type="button" id="boardCancelBtn" class="btn btn-success">초기화</button>
		<button type="button" id="boardListBtn" class="btn btn-success">목록</button>
	</div>
</div>
 