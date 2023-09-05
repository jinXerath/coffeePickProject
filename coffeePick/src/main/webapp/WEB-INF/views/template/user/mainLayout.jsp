<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<title>Insert title here</title>

<!-- icon image  -->
<link rel="shortcut icon" href="/resources/images/cp-icon.png" />
<link rel="apple-touch-icon" href="/resources/images/cp-icon.png" />

<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.min.css" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />	

<!-- Custom styles for this template -->

<!-- Bootstrap core JS -->
<script type="text/javascript" src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.min.js"></script>


<!-- JS  -->
<script type="text/javascript" src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>


<title><tiles:getAsString name="title" /></title>



<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!--  <script
	src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
-->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	$(function() {
		// 드롭다운 메뉴 사용하기 위해서 아래의 소스 추가.
		$('.dropdown-toggle').dropdown();
	});
</script>
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<tiles:insertAttribute name="header" />
	</nav>

	<!-- Begin page content -->
	<div class="contentLayout container">
		<h2>메인페이지</h2>
	</div>

	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
