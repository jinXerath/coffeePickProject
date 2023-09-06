<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
    
    <!-- Bootstrap core JS -->
	<script type="text/javascript" src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script type="text/javascript">
		$(function(){
		    	// 드롭다운 메뉴 사용하기 위해서 아래의 소스 추가.
		    	$('.dropdown-toggle').dropdown();
		});
	</script>
    
    
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
		  <a href="member/cart">장바구니이동</a>
		  <h3>드랍박스좀고쳐주세여</h3>
		</div>
    </div>




    <footer class="footer">
    	<tiles:insertAttribute name="footer" />
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  -->
    <script src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.min.js"></script>   
  </body>
</html>
