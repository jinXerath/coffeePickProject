//유효성 체크 상태
let pw_status = 0;
let pw_chk_status = 0;
let name_status = 1;
let phone_status = 1;
let email_status = 1;

$(function(){
	// 이름 유효성 검사
	const nameRegExp = /^[가-힣]{2,20}$/;
	$("#admin_name").on("keyup",function(){
		if($("#admin_name").val() === ""){
			$('#name_chk').css('visibility', 'hidden');
			name_status = 0;
		}else if(!nameRegExp.test($("#admin_name").val())){
			openHint('#name_chk', 'red', '이름은 한글로 2~20자리로 입력해주세요')
			name_status = 0;
		}else {
			$('#name_chk').css('visibility', 'hidden');
			name_status = 1;
		}
	})
	
	// 전화번호 유효성 검사
	const phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	$("#admin_phone").on("keyup",function(){
		phoneHyphenFormat(this)
		if($("#admin_phone").val() === ""){
			$('#phone_chk').css('visibility', 'hidden');
			phone_status = 0;
		}else if(!phoneRegExp.test($("#admin_phone").val())){
			openHint('#phone_chk', 'red', '올바른 형식의 전화번호를 입력해주세요')
			phone_status = 0;
		}else {
			$('#phone_chk').css('visibility', 'hidden');
			phone_status = 1;
		}
	})
	
	// 이메일 유효성 검사
	const emailRegExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	$("#admin_email").on("keyup",function(){
		if($("#admin_email").val() === ""){
			$('#email_chk').css('visibility', 'hidden');
			email_status = 0;
		}else if(!emailRegExp.test($("#admin_email").val())){
			openHint('#email_chk', 'red', '올바른 형식의 이메일을 입력해주세요')
			email_status = 0;
		}else {
			$('#email_chk').css('visibility', 'hidden');
			email_status = 1;
		}
	})
	
	// 비밀번호 유효성 검사
	const pwRegExp = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{4,20}$/;
	$("#admin_pw").on("keyup",function(){
		if($("#admin_pw").val() === ""){
			$('#pw_chk').css('visibility', 'hidden');
			pw_status = 0;
		}else if(!pwRegExp.test($("#admin_pw").val())){
			openHint('#pw_chk', 'red', '영문 대소문자, 숫자 또는 특수문자 4~20자리를 입력해주세요')
			pw_status = 0;
		}else {
			$('#pw_chk').css('visibility', 'hidden');
			pw_status = 1;
		}
		if($("#admin_pw_chk").val() === ""){
			$('#pw_chk_chk').css('visibility', 'hidden');
			pw_chk_status = 0;
		}else if($("#admin_pw").val() !== $("#admin_pw_chk").val()){
			openHint('#pw_chk_chk', 'red', '비밀번호가 일치하지 않습니다')
			pw_chk_status = 0;
		}else if($("#admin_pw").val() === $("#admin_pw_chk").val()){
			openHint('#pw_chk_chk', 'green', '비밀번호가 일치합니다')
			pw_chk_status = 1;
		}
	})
	
	// 비밀번호 확인 유효성 검사
	$("#admin_pw_chk").on("keyup",function(){
		if($("#admin_pw_chk").val() === ""){
			$('#pw_chk_chk').css('visibility', 'hidden');
			pw_chk_status = 0;
		}else if($("#admin_pw").val() !== $("#admin_pw_chk").val()){
			openHint('#pw_chk_chk', 'red', '비밀번호가 일치하지 않습니다')
			pw_chk_status = 0;
		}else if($("#admin_pw").val() === $("#admin_pw_chk").val()){
			openHint('#pw_chk_chk', 'green', '비밀번호가 일치합니다')
			pw_chk_status = 1;
		}
	})

	// 회원 정보 수정 모달 버튼
	$("#updateModalBtn").click(function(){
		// 이름 공백 검사
		if(!chkData("#admin_name","이름을")) {
			return;
		}
		// 이름 유효성 검사
		if(name_status === 0){
			alert("이름을 확인해주세요.")
			return;
		}
		// 전화번호 공백 검사
		if(!chkData("#admin_phone","전화번호를")) {return;}
		// 전화번호 유효성 검사
		if(phone_status === 0){
			alert("전화번호를 확인해주세요.")
			return;
		}
		// 이메일 공백 검사
		if(!chkData("#admin_email","이메일을")) {return;}
		// 이메일 유효성 검사
		if(email_status === 0){
			alert("이메일을 확인해주세요.")
			return;
		}
		$("#adminUpdateModal").modal("show");
	})
	// 회원 수정 버튼
	$("#adminUpdateBtn").click(function(){
		$.ajax({
			url : "/admin/adminPwConfirm",
			type : "post",
			data : $("#adminPwForm").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다');
			},
			success: function(resultData){
				if(resultData=="성공") {
					$("#adminUpdateForm").attr({
						"method" : "post",
						"action" : "/admin/update"
					});
					$("#adminUpdateForm").submit();
				}else if(resultData=="실패") {
					alert('비밀번호를 확인해주세요.');
				}
			}
		});
	});
	
	//비밀번호 수정 모달 비밀번호 체크 버튼
	$("#adminPwUpdateFormBtn").click(function(){
		$.ajax({
			url : "/admin/adminPwConfirm",
			type : "post",
			data : $("#adminPwForm2").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다');
			},
			success: function(resultData){
				if(resultData=="성공") {
					$("#hiddenDiv").show();
				}else if(resultData=="실패") {
					alert('비밀번호를 확인해주세요.');
				}
			}
		});
	})
	
	$("#adminPwUpdateBtn").click(function(){
		// 비밀번호 공백 검사
		if(!chkData("#admin_pw","비밀번호를")) {return;}
		// 비밀번호 유효성 검사
		if(pw_status === 0){
			alert("비밀번호를 확인해주세요.")
			return;
		}
		// 비밀번호 확인 공백 검사
		if(!chkData("#admin_pw_chk","비밀번호 확인을")) {return;}
		// 비밀번호 확인 유효성 검사
		if(pw_chk_status === 0){
			alert("비밀번호 확인을 확인해주세요.")
			return;
		}
		$("#adminPwUpdateForm").attr({
			"method" : "post",
			"action" : "/admin/pwUpdate"
		});
		$("#adminPwUpdateForm").submit();
	})
	
	
	
	// 회원 탈퇴 버튼
	$("#adminDeleteBtn").click(function(){
		$.ajax({
			url : "/admin/adminPwConfirm",
			type : "post",
			data : $("#adminDeleteForm").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다');
			},
			success: function(resultData){
				if(resultData=="성공") {
					$("#adminDeleteForm").attr({
						"method" : "post",
						"action" : "/admin/delete"
					});
					$("#adminDeleteForm").submit();
				}else if(resultData=="실패") {
					alert('비밀번호를 확인해주세요.');
				}
			}
		});
	});
	
})