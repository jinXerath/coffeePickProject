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




  <!-- 헤더 푸터 부트스트랩 관련 링크-->
    <link rel="icon" type="image/x-icon" href="/resources/images/cp-icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/resources/include/css/sidebars.css" rel="stylesheet">
   <link href="/resources/include/css/common.css" rel="stylesheet">    
    <link href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Core theme JS-->
    <script src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
   <script src="/resources/include/js/common.js"></script>   
    <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
    <script src="/resources/include/js/color-modes.js"></script>
    <script src="/resources/include/js/sidebars.js"></script>
    <script src="/resources/include/js/scripts.js"></script>
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<tiles:insertAttribute name="header" />
	</nav>



		<div class="d-flex flex-nowrap">
			<div>
			
			<tiles:insertAttribute name="sidebar" />
			
			</div>
			<tiles:insertAttribute name="body" />
			
		</div>

	<!--사이드바 끝-->

	<footer class="footer py-5 bg-dark">
		<tiles:insertAttribute name="footer" />
	</footer>


	
</body>
</html>
