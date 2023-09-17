<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script>
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
		
		// 로그인 버튼 
		$("#loginBtn").click(function(){
			if(!chkData("#admin_id", "ID를")) return
			else if(!chkData("#admin_pw","비밀번호를")) return
			else {
				$("#loginForm").attr({
					"action" : "/admin/sign/login"
				});
				
				$("#loginForm").submit();
			}
		})
		
	})
</script>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-5">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 로그인</h3></div>
                <div class="card-body">
                    <form id="loginForm" method="post">
                        <div class="form-floating mb-3">
                            <input class="form-control" id="admin_id" name="admin_id" type="text" maxlength="15" placeholder="ID"/>
                            <label for="admin_id">ID</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="admin_pw" name="admin_pw" type="password" maxlength="20" placeholder="password"/>
                            <label for="admin_pw">Password</label>
                        </div>
                    </form>
                        <div class="text-center align-items-center justify-content-between mt-4 mb-0">
                        	<button class="btn btn-primary" id="loginBtn">로그인</button>
                        </div>
                </div>
                <div class="card-footer text-center py-3">
                    <div class="small"><a href="/admin/sign/signUp">관리자 회원가입</a></div>
                </div>
            </div>
        </div>
    </div>
</div>

