<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	
			<script type="text/javascript" src="/resources/dist/js/jquery-3.7.0.min.js"></script>		
			<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
	
	
		<title>Insert title here</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		
				
		<!--[if lt IE 9]>
		<script src="/include/js/html5shiv.js"></script>
		<![endif]-->
		<script>
		$(function(){
			$("#member_id_find").click(function(){
				window.location.href="/member/memberIdFind";
			});
			$("#corp_id_find").click(function(){
				window.location.href="/corp/corpIdFind";
			})
			
			
		});
		
	
		</script>
<title>Insert title here</title>
</head>
<body>
	<form id="form" class="form">
		<div>
		<button type="button" id="member_id_find">사용자 아이디 찾기</button>
		</div>
		<br/>
		<div>
		<button type="button" id="corp_id_find">사업자 아이디 찾기</button>
		</div>


	</form>	
</body>
</html>