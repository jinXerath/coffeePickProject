<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	#id_chk, #pw_chk, #pw_chk_chk, #name_chk, #phone_chk, #email_chk, #key_chk{
		visibility: hidden;
	}
</style>
<script src="/resources/include/js/admin/admin-signUp.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			alert(errorMsg);
			errorMsg = "";
		}
	})
</script>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 회원가입</h3></div>
                <div class="card-body">
                    <form id="signUpForm">
                        <div class="form-floating mb-1">
                            <input class="form-control" id="admin_id" name="admin_id" type="text" maxlength="15" placeholder="ID"/>
                            <label for="admin_id">ID</label>
                        </div>
                        <div class="row mb-1" id="id_chk">
                           <span>아이디</span>
                        </div>
                        <div class="row mb-1">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="admin_pw" name="admin_pw" type="password" maxlength="20" placeholder="Password"/>
                                    <label for="admin_pw">Password</label>
                                </div>
                                <div id="pw_chk">
                           			<span>비밀번호<br/>공간</span>
                        		</div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="admin_pw_chk" name="admin_pw_chk" type="password" maxlength="20" placeholder="Confirm Password"/>
                                    <label for="admin_pw_chk">Confirm Password</label>
                                </div>
                                <div id="pw_chk_chk">
                           			<span>비밀번호 확인</span>
                        		</div>
                            </div>
                        </div>
                        <div class="form-floating mb-1">
                            <input class="form-control" id="admin_name" name="admin_name" type="text" maxlength="20" placeholder="이름"/>
                            <label for="admin_name">이름</label>
                        </div>
                        <div class="row mb-1" id="name_chk">
                           	<span>이름</span>
                        </div>
                        <div class="form-floating mb-1">
                            <input class="form-control" id="admin_phone" name="admin_phone" type="text" maxlength="13" placeholder="전화번호"/>
                            <label for="admin_phone">전화번호</label>
                        </div>
                        <div class="row mb-1" id="phone_chk">
                        	<span>전화번호</span>
                        </div>
                        <div class="form-floating mb-1">
                            <input class="form-control" id="admin_email" name="admin_email" type="text" maxlength="100" placeholder="이메일" />
                            <label for="admin_email">이메일</label>
                        </div>
                        <div class="row mb-1" id="email_chk">
                        	<span>이메일</span>
                        </div>
                        <div class="form-floating mb-1">
                            <input class="form-control" id="admin_key" name="admin_key" type="text" maxlength="14" placeholder="관리자 키"/>
                            <label for="admin_key">관리자 키</label>
                        </div>
                        <div class="row mb-1" id="key_chk">
                        	<span>관리자 키</span>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                     <div class="d-grid">
                     	<button class="btn btn-primary" id="signUpBtn">회원가입</button>
                     </div>
                </div>
            </div>
        </div>
    </div>
</div>