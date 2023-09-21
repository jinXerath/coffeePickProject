<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf"%>  
<link href="/resources/include/css/board.css" rel="stylesheet"/>

	<script type="text/javascript">
		$(function() {
			/*저장 버튼 클릭 시 처리 이벤트*/
			$("#boardInsertBtn").click(function() {
				//입력값 체크
				if(!chkData("#board_title","제목을")) return;
				else if(!chkData("#board_content","작성할 내용을")) return;
				else {
					if($("#file").val()!=""){
						if(!chkFile($("#file"))) return;
					}
					$("#f_writeForm").attr({
						"method":"post",
						"enctype":"multipart/form-data", // 파일전송할려면 여기 필수
						"action":"/admin/event/eventInsert"
					});
					$("#f_writeForm").submit();
				}
			});
		
			/*초기화 버튼 클릭 시 처리 이벤트*/
			$("#boardCancelBtn").click(function() {
				$("#f_writeForm").each(function(){
					this.reset();
				});
			});
			
			/*목록 버튼 클릭 시 처리 이벤트*/
			$("#boardListBtn").click(function() {
				location.href="/admin/event/eventList";
			});
		});
	
	</script>
	
		<div class="container"><br/><br/>
			<div class="contentTit page-header"><h3 class="text-center">게시글 작성</h3></div>
			
			<div class="text-center">
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
					<br/><br/><br/>
					<div class="text-start">
						관리자ID:
						<c:if test = "${adminLogin.admin_authority =='S'}">
							 <i class="fa-solid fa-star fa-2xs"></i><input class="admin_id" type="text"  name="admin_id" value="${adminLogin.admin_id}" > 
						</c:if>
						<c:if test = "${adminLogin.admin_authority !='S'}">
							<input class="admin_id" type="text"  name="admin_id" value="${adminLogin.admin_id}" >
						</c:if>
					</div>
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						
						<tbody>
							<tr>
								<td>글제목</td>
								<td class="text-start">
									<input type="text" name="board_title" id="board_title" class="form-control" />
								</td>
							</tr>
							<tr class="table-tr-height">
   								<td>글내용</td>
   								<td class="text-start">
   									<textarea name="board_content" id="board_content" class="form-control"></textarea>
   								</td>
   							</tr>
							<tr>
								<td>이미지파일첨부</td>
								<td class="text-start">
									<input type="file" name="file" id="file" />
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="text-right">
						<input type="button" value="저장" id="boardInsertBtn" class="btn btn-success" />
						<input type="button" value="초기화" id="boardCancelBtn" class="btn btn-success" />
						<input type="button" value="목록" id="boardListBtn" class="btn btn-success" />
					</div>
				</form>
			</div>
		</div>
