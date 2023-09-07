<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <!-- sidenav-menu -->
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">main</div>
                <a class="nav-link" href="index.html">
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
                        <a class="nav-link" href="layout-static.html">공지사항</a>
                        <a class="nav-link" href="layout-sidenav-light.html">이벤트</a>
                        <a class="nav-link" href="layout-sidenav-light.html">개인 상담/문의</a>
                        <a class="nav-link" href="layout-sidenav-light.html">기업 상담/문의</a>
                    </nav>
                </div>
                <a class="nav-link" href="/admin/review/reviewList">
                    <div class="sb-nav-link-icon"><i class="fa-regular fa-comment"></i></div>
                    리뷰 관리
                </a>
                
                <div class="sb-sidenav-menu-heading">message</div>
                <a class="nav-link" href="charts.html">
                    <div class="sb-nav-link-icon"><i class="fa-regular fa-envelope"></i></div>
                    쪽지
                    
                </a>
            </div>
        </div>


        <!-- sidenav-footer -->
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            관리자 아이디
        </div>

    </nav>
</div>