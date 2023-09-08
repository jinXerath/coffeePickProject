<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/resources/images/co-icon.png">

<title><tiles:getAsString name="title" /></title>

<!-- Bootstrap core CSS -->
<link href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/css/common.css" rel="stylesheet">


<!-- JQUERY -->
<script type="text/javascript" src="/resources/include/js/jquery-3.7.1.min.js"></script>


<!--사이드바 부트스트랩 관련 스크립트-->
<script src="/resources/include/js/scripts.js"></script>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/include/css/styles.css" rel="stylesheet" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->



</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<tiles:insertAttribute name="header" />
	</nav>



	<!-- Begin page content -->
	<div class="mainLayout container">
		<div>
			<h1>메인 페이지 입니다</h1>
			<a href="corp/read">매장저</a>
		</div>
	</div>




	<footer class="footer py-5 bg-dark">
		<tiles:insertAttribute name="footer" />
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  -->
	<!-- Bootstrap core JS-->
	<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
	<!-- Core theme JS-->
    <!-- Bootstrap core JS-->
  <!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
    <!-- Core theme JS-->
    <script src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/include/js/color-modes.js"></script>
    <script src="/resources/include/js/sidebars.js"></script>
    <script src="/resources/include/js/scripts.js"></script>	
</body>
</html>
