<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      
		<title><tiles:getAsString name="title"/></title>
		
		<!-- 아이콘 -->
		<link rel="shortcut icon" href="/resources/images/cp-icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/cp-icon.png" />
		
		<!-- Bootstrap core CSS-->
		<link href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.css" rel="stylesheet"/>
		<!-- user-common CSS -->
		<link href="/resources/include/css/user/user-common.css" rel="stylesheet"/>
		<!-- fontawesome CSS -->
		<link href="/resources/include/css/fontawesome.min.css" rel="stylesheet"/>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<!--==================== script ====================-->
		<!-- jQuery -->
		<script src="/resources/include/js/jquery-3.7.1.min.js" type="text/javascript"></script>
		<!-- fontawesome -->
		<script src="/resources/include/js/fontawesome-all.js" type="text/javascript"></script>
		<!-- bootstrap.bundle.js -->
		<script src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.js" type="text/javascript"></script>
		<!-- user-common.js -->
		<script src="/resources/include/js/user/user-common.js" type="text/javascript"></script>
        <!-- common.js -->
        <script src="/resources/include/js/common.js" type="text/javascript"></script>
	</head>
	<body class="d-flex flex-column min-vh-100">
	        <tiles:insertAttribute name="header" />
	        <main>
	            <tiles:insertAttribute name="main" />
	        </main>
	        <tiles:insertAttribute name="footer" />
	</body>
</html>
