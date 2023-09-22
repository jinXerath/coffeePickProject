<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	#pw_chk, #pw_chk_chk, #name_chk, #phone_chk, #email_chk {
		visibility : hidden;
	}
	#hiddenDiv {
		display : none;
	}
</style>
<script src="/resources/include/js/admin/admin-update.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		let successMsg = "${successMsg}";
		if(successMsg != ""){
			alert(successMsg);
			successMsg = "";
		}
		
		let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			alert(errorMsg);
			errorMsg = "";
		}
	})
</script>
<div class="container-fluid px-4">
    <h1 class="my-4">관리자 정보 수정</h1>
    <div class="card my-4">
        <div class="card-body">
            <form id="adminUpdateForm">
                <div class="form-floating mb-4">
                    <input class="form-control" value="${admin.admin_id}" id="admin_id" name="admin_id" type="text" maxlength="15" placeholder="ID" readonly/>
                    <label for="admin_id">ID</label>
                </div>
                <div class="form-floating mb-1">
                    <input class="form-control" value="${admin.admin_name}" id="admin_name" name="admin_name" type="text" maxlength="20" placeholder="이름"/>
                    <label for="admin_name">이름</label>
                </div>
                <div class="row mb-1" id="name_chk">
                	<span>이름</span>
                </div>
                <div class="form-floating mb-1">
                    <input class="form-control" value="${admin.admin_phone}" id="admin_phone" name="admin_phone" type="text" maxlength="13" placeholder="전화번호"/>
                    <label for="admin_phone">전화번호</label>
                </div>
                <div class="row mb-1" id="phone_chk">
                	<span>전화번호</span>
                </div>
                <div class="form-floating mb-1">
                    <input class="form-control" value="${admin.admin_email}" id="admin_email" name="admin_email" type="text" maxlength="100" placeholder="이메일" />
                    <label for="admin_email">이메일</label>
                </div>
                <div class="row mb-1" id="email_chk">
                	<span>이메일</span>
                </div>
            </form>
       	</div>
		<div class="card-footer text-center py-3">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary" id="updateModalBtn" data-bs-target="#adminUpdateModal">정보수정</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#adminPwUpdateModal">비밀번호 변경</button>
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#adminDeleteModal">회원탈퇴</button>
			</div>
		</div>
    </div>
	<!-- 정보수정 Modal -->
	<div class="modal fade" id="adminUpdateModal" tabindex="-1" aria-labelledby="adminUpdateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="adminUpdateModalLabel">회원 정보 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center">
		            	<p>비밀번호를 입력해주세요.</p>
		          	</div>
					<form id="adminPwForm">
			            <input value="${admin.admin_id}" name="admin_id" type="hidden">
			          	<div>
			            	<label for="m_admin_pw" class="col-form-label">PassWord:</label>
			            	<input type="password" id="m_admin_pw" name="admin_pw" class="form-control" maxlength="20">
			          	</div>
			        </form>
				</div>
				<div class="modal-footer">
					<div class="col text-center">
						<button type="button" class="btn btn-primary" id="adminUpdateBtn">수정</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호변경 Modal -->
	<div class="modal fade" id="adminPwUpdateModal" tabindex="-1" aria-labelledby="adminPwUpdateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="adminPwUpdateModalLabel">비밀번호 변경</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center">
		            	<p>현재 비밀번호를 입력해주세요.</p>
		          	</div>
					<form id="adminPwForm2">
			            <input value="${admin.admin_id}" name="admin_id" type="hidden" class="form-control">
			          	<div class="mb-1">
			            	<label for="m2_admin_pw" class="col-form-label">PassWord:</label>
			            	<input type="password" id="m2_admin_pw" name="admin_pw" class="form-control" maxlength="20">
			          	</div>
			        </form>
			        <button type="button" class="btn btn-secondary" id="adminPwUpdateFormBtn">비밀번호 확인</button>
				</div>
				<div class="modal-body" id="hiddenDiv">
					<hr>
					<form id="adminPwUpdateForm">
						<input value="${admin.admin_id}" name="admin_id" type="hidden" class="form-control">
						<div class="form-floating mb-1">
		                    <input class="form-control" id="admin_pw" name="admin_pw" type="password" maxlength="20" placeholder="New Password"/>
		                    <label for="admin_pw">New Password</label>
	                    </div>
	                    <div class="row mb-1" id="pw_chk">
	                       	<span>비밀번호</span>
	                    </div>
	                    <div class="form-floating mb-1">
		                    <input class="form-control" id="admin_pw_chk" name="admin_pw_chk" type="password" maxlength="20" placeholder="Confirm Password"/>
		                    <label for="admin_pw_chk">Confirm Password</label>
	                    </div>
	                    <div class="row mb-1" id="pw_chk_chk">
	                       	<span>비밀번호 확인</span>
	                    </div>
                    </form>
                    <div class="text-center">
						<button type="button" class="btn btn-primary" id="adminPwUpdateBtn">수정</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원탈퇴 Modal -->
	<div class="modal fade" id="adminDeleteModal" tabindex="-1" aria-labelledby="adminDeleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="adminDeleteModalLabel">회원 탈퇴</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center mb-3">
		            	<h4>정말 탈퇴하시겠습니까?</h4>
		            	<p>탈퇴 버튼 선택 시, 계정은 삭제되며 복구되지 않습니다.</p>
		          	</div>
					<form id="adminDeleteForm">
			          	<div class="mb-1">
			            	<label for="m_admin_id" class="col-form-label">ID:</label>
			            	<input value="${admin.admin_id}" id="m_admin_id" name="admin_id" type="text" class="form-control" >
			          	</div>
			          	<div class="mb-1">
			            	<label for="m3_admin_pw" class="col-form-label">PassWord:</label>
			            	<input type="password" id="m3_admin_pw" name="admin_pw" class="form-control" maxlength="20">
			          	</div>
			        </form>
				</div>
				<div class="modal-footer">
				    <div class="col text-center">
						<button type="button" class="btn btn-danger" id="adminDeleteBtn">탈퇴</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>