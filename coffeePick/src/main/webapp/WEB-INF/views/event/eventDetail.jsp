<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link href="/resources/include/css/board.css" rel="stylesheet"/>
<script>
$(function(){
	$("#boardListBtn").click(function(){
		window.location.href = "/board/event/eventList"
	});
	
	$(".nextPage").click(function(){
		let next_num = $("#next_num").html();
		window.location.href = "/board/event/eventDetail?board_no="+next_num;
	});
	
	$(".prevPage").click(function(){
		let prev_num = $("#prev_num").html();
		window.location.href = "/board/event/eventDetail?board_no="+prev_num;
	});
	
	
	
})

</script>
<section class="py-3 container">
    <div>
        <table class="table ">
	        <tr>
	        	<td class="">
		        	<p class="text-secondary fs-6 text-end" >${fn:substring(detail.board_regdate,0,10)} &nbsp;| &nbsp;조회수 ${detail.board_readcnt}</p>
		        	<p class="fs-2 text-primary-emphasis text-center"><b>${detail.board_title}</b></p>
	        	</td>
	        	
	        </tr>
	        <c:if test="${not empty detail.board_img}">
		        <tr>
		        	<td class="text-center"><img src="/coffeePickStorage/board/${detail.board_img}" /></td>
		        </tr>
		    </c:if>
	        <tr>
	        	<td class="text-start" style="height:200px">${detail.board_content}</td>
	        </tr>
	    </table>	
    </div >
    <br/><br/><br/>
    <div>
    	<table class="table tablenp">
    	<c:choose>
    		<c:when test="${not empty detail.next_title}">
		        <tr class="tr">
		        	<td class="col-1 text-start" id="next_num">${detail.next_num}</td>
		        	<td class="col-1 text-start nextPage"><i class="fa-solid fa-caret-up"></i>다음글</td>
		        	<td class="col-9 text-start text-primary-emphasis"><a><b class="nextPage">${detail.next_title}</b></a></td>
		        	<td class="text-secondary fs-6">${detail.next_date}</td>
		        </tr>
		    </c:when>
		    
		</c:choose>
		<c:choose>
		    <c:when test="${not empty detail.prev_title}">
		        <tr>
		        	<td class="text-start col-1" id="prev_num">${detail.prev_num}</td>
		        	<td class="text-start col-1 prevPage"><i class="fa-solid fa-caret-down"></i>이전글</td>
		        	<td class="text-start col-9 text-primary-emphasis"><a><b class="prevPage">${detail.prev_title}</b></a></td>
		        	<td class="text-secondary fs-6">${detail.prev_date}</td>
		        </tr>
		    </c:when>
		 </c:choose>
    	</table>
    </div>
    	
   	<div class="col-12 text-center ">
   		<button class="btn btn-primary btn-lg" style="width:150px" type="button" id="boardListBtn">목록</button>
    </div>
    
    
</section>