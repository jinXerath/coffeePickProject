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
		
		$("#loginBtn").click(function(){
			console.log("로그인");
			$("#loginForm").attr({
				"method" : "post",
				"action" : "/corp/login"
			});
			
			$("#loginForm").submit();
		});
	});
</script>

	<div class="container">

		<form id="loginForm">
			<p>ID</p>
			<input type="text" name="corp_id" id="corp_id" />
			<p>Password</p>
			<input type="password" name="corp_pw" id="corp_pw" />
		</form>
		<input type="button" id="loginBtn" value="로그인">

	</div>