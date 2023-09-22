<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	#key_chk{
		visibility: hidden;
	}
</style>
<script>
	let key_status = 1;
	$(function(){
		getAdminKey();
		
		const adminKeyRegExp = /^[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}$/;
		$("#admin_key").on("keyup",function() {
			adminKeyHyphenFormat(this)
			if($("#admin_key").val() === ""){
				$('#key_chk').css('visibility', 'hidden');
				key_status = 0;
			}else if(!adminKeyRegExp.test($("#admin_key").val())){
				openHint('#key_chk', 'red', '관리자 키는 영문 대소문자 또는 숫자 12자리를 입력해주세요')
				key_status = 0;
			}else {
				$('#key_chk').css('visibility', 'hidden');
				key_status = 1;
			}
		});
		
		$("#adminKeyUpdateBtn").click(function(){
			if(!chkData("#admin_key","관리자 키를")) {return;}
			// 관리자 키와 일치 하는 지 검사
			if(key_status === 0){
				alert("관리자 키를 확인해주세요.")
				return;
			}
			$.ajax({
				type : "post",
				url : "/admin/keyUpdate",
				data : { admin_key : unhyphen($("#admin_key").val()) },
				dataType : "text",
				success: function(resultData){
					if(resultData=="성공") {
						alert("관리자 키가 변경되었습니다.");
						$("#adminKeyUpdateModal").modal('hide');
						getAdminKey();
					}else if(resultData=="실패") {
						alert("관리자 키가 변경되지 않았습니다.");
					}
				},
				error : function() {
					console.log("오류가 발생하였습니다.");
				}
			})
		});
	})
	
	function getAdminKey(){
		$.ajax({
			type : "post",
			url : "/admin/adminKey",
			dataType : "json",
			success : function(data) {
				console.log(data.admin_key)
				$("#adminKey").html(keyHyphen(data.admin_key));
				$("#admin_key").val(keyHyphen(data.admin_key));
			},
			error : function() {
				alert("오류가 발생하였습니다.")
			}
		})
	}
</script>
<div class="card my-4">
       <div class="card-header">
           <i class="fa-solid fa-key"></i>
           관리자 키
       </div>
       <div class="card-body text-center">
           <span id="adminKey" class="border border-4 fs-2 border-secondary-subtle p-2">
           </span>
       </div>
       <div class="card-footer text-center">
		<button type="button" class="btn btn-primary" id="adminKeyUpdateFormBtn" data-bs-toggle="modal" data-bs-target="#adminKeyUpdateModal">
			수정
		</button>
       </div>
   </div>
<!-- 관리자키 Modal -->
<div class="modal fade" id="adminKeyUpdateModal" tabindex="-1" aria-labelledby="adminKeyUpdateModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="adminKeyUpdateModalLabel">관리자 키 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="text-center mb-3">
	            	<p>새로운 관리자 키를 입력해주세요</p>
	          	</div>
				<form id="adminKeyUpdateForm">
		          	<div class="form-floating mb-1">
                           <input class="form-control" id="admin_key" name="admin_key" type="text" maxlength="14" placeholder="관리자 키"/>
                           <label for="admin_key">관리자 키</label>
                       </div>
                       <div class="row mb-1" id="key_chk">
                       	<span>관리자 키</span>
                       </div>
		        </form>
			</div>
			<div class="modal-footer">
				<div class="col text-center">
					<button type="button" class="btn btn-primary" id="adminKeyUpdateBtn">수정</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>