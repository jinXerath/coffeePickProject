<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <!-- sidenav-menu -->
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">main</div>
                <a class="nav-link" href="/admin">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-gear"></i></div>
                    Main
                </a>

                <div class="sb-sidenav-menu-heading">management</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fa-regular fa-user"></i></div>
                    회원관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="layout-static.html">개인 회원</a>
                        <a class="nav-link" href="layout-sidenav-light.html">기업 회원</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fa-regular fa-comments"></i></div>
                    게시판 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="/admin/notice/noticeList">공지사항</a>
                        <a class="nav-link" href="/admin/event/eventList">이벤트</a>
                        <a class="nav-link" href="/admin/memberQna/memberQnaManage">상담/문의 (개인)</a>
                        <a class="nav-link" href="/admin/corpQna/corpQnaManage">상담/문의 (기업)</a>
                    </nav>
                </div>
                <a class="nav-link" href="/admin/review/reviewList">
                    <div class="sb-nav-link-icon"><i class="fa-regular fa-comment"></i></div>
                    리뷰 관리
                </a>
            </div>
        </div>


        <!-- sidenav-footer -->
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            ${adminLogin.admin_id}
        </div>

    </nav>
</div>