<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script>
$(function () {
    var currentUrl = window.location.pathname;
    var navLinks = $(".nav-link");

    navLinks.each(function () {
        var href = $(this).attr("href");

        if (currentUrl.startsWith(href.substring(0, href.lastIndexOf('/')))) {
            $(this).addClass("active");
        }
    });
});
</script>
<section class="container py-4">
	<ul class="nav nav-underline justify-content-center text-center">
    	<li class="nav-item flex-fill">
    		<a class="nav-link fs-5 fw-bold" href="/board/event/eventList">이벤트</a>
  		</li>
  		<li class="nav-item flex-fill">
    		<a class="nav-link fs-5 fw-bold" href="/board/notice/noticeList">공지사항</a>
  		</li>
  		<li class="nav-item flex-fill">
    		<a class="nav-link fs-5 fw-bold" href="/board/memberQna/memberQnaList">상담/문의(개인)</a>
  		</li>
  		<li class="nav-item flex-fill">
    		<a class="nav-link fs-5 fw-bold" href="/board/corpQna/corpQnaList">상담/문의(매장)</a>
  		</li>
	</ul>
</section>