// 유효성 체크 상태
let id_status = 0;
let pw_status = 0;
let pw_chk_status = 0;
let name_status = 0;
let phone_status = 0;
let email_status = 0;
let key_status = 0;

$(function(){
	// 아이디 유효성 검사
	const idRegExp = /^[a-zA-z0-9]{4,15}$/;
	$("#admin_id").on("keyup",function() {
		if($("#admin_id").val() === ""){
			$('#id_chk').css('visibility', 'hidden');
			id_status = 0;
		}else if(!idRegExp.test($("#admin_id").val())){
			openHint('#id_chk', 'red', '아이디는 영문 대소문자 또는 숫자 4~15자리 입력해주세요')
			id_status = 0;
		}else{
			$.ajax({
				url : "/admin/adminIdConfirm",
				type : "post",
				data : { admin_id : $("#admin_id").val()},
				dataType : "text",
				error : function(){
					alert('시스템 오류입니다')
				},
				success: function(resultData){
					if(resultData=="성공") {
						openHint('#id_chk', 'green', '사용 가능한 아이디입니다')
						id_status = 1;
					}else if(resultData=="실패") {
						openHint('#id_chk', 'red', '중복된 아이디입니다')
						id_status = 0;
					}
				}
			});
		}
	});
	
	// 비밀번호 유효성 검사
	const pwRegExp = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{4,20}$/;
	$("#admin_pw").on("keyup",function(){
		if($("#admin_pw").val() === ""){
			$('#pw_chk').css('visibility', 'hidden');
			pw_status = 0;
		}else if(!pwRegExp.test($("#admin_pw").val())){
			openHint('#pw_chk', 'red', '비밀번호는 영문 대소문자, 숫자 또는 특수문자 4~20자리를 입력해주세요')
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
		phoneHyphenFormat(this);
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
	
	// 관리자 키 유효성 검사
	$("#admin_key").on("keyup",function() {
		adminKeyHyphenFormat(this)
		$.ajax({
			url : "/admin/adminKeyConfirm",
			type : "post",
			data : { admin_key : unhyphen($("#admin_key").val())},
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다')
			},
			success: function(resultData){
				if(resultData=="성공") {
					openHint('#key_chk', 'green', '유효한 관리자 키입니다')
					key_status = 1;
				}else if(resultData=="실패") {
					openHint('#key_chk', 'red', '관리자 키를 확인해주세요')
					key_status = 0;
				}
			}
		});
	});
	
	
	// 회원가입 버튼
	$("#signUpBtn").click(function(){
		// ID(아이디) 공백 검사
		if(!chkData("#admin_id", "ID를")) {return;}
		// 아이디 유효성 검사
		if(id_status === 0){
			alert("아이디를 확인해주세요.")
			return;
		}
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
		// 이름 공백 검사
		if(!chkData("#admin_name","이름을")) {return;}
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
		// 관리자 키 공백 검사
		if(!chkData("#admin_key","관리자 키를")) {return;}
		// 관리자 키와 일치 하는 지 검사
		if(key_status === 0){
			alert("관리자 키를 확인해주세요.")
			return;
		}
		$("#signUpForm").attr({
			"method" : "post",
			"action" : "/admin/sign/signUp"
		});
		$("#signUpForm").submit();
	})
})