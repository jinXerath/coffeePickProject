<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Item - Start Bootstrap Template</title>
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
	<script type="text/javascript">
		$(function(){
			$("#storeInfoUpdateBtn").click(function(){
				$("#updateForm").attr({
					"method":"post",
					"enctype" : "multipart/form-data",
					"action":"/store/corpService/storeInfoUpdate"
				})
				$("#updateForm").submit();
			})
			
		})	
	</script>
</head>

<body>
    <!-- 네비게이션 시작 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!">CoffeePick</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">개인서비스</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">주문하기</a></li>
                            <li><a class="dropdown-item" href="#!">주문내역</a></li>
                            <li><a class="dropdown-item" href="#!">장바구니</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="/store/storeInfoRead">매장서비스</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">이벤트</a></li>
                            <li><a class="dropdown-item" href="#!">공지사항</a></li>
                            <li><a class="dropdown-item" href="#!">상담/문의</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                </ul>
                <form class="d-flex">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                            Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                    <button class="btn btn-outline-dark" type="button">로그인</button>
                    <button class="btn btn-outline-dark" type="button">회원가입</button>
                </form>
            </div>
        </div>
    </nav>
    <!--네비게이션 끝-->

    <!-- 사이드바 시작-->
    <div>
        <div class="d-flex flex-nowrap">

            <div class="flex-shrink-0 p-3" style="width: 280px;">


                <a href="/"
                    class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                    <svg class="bi pe-none me-2" width="30" height="24">
                        <use xlink:href="#bootstrap" />
                    </svg>
                    <span class="fs-5 fw-semibold">매장서비스</span>
                </a>
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#4collapse" aria-expanded="false">
                            매장정보관리
                        </button>
                        <div class="collapse" id="4collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="/store/storeInfoRead"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보조회</a>
                                </li>
                                <li><a href="/store/registForm"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보등록</a>
                                </li>
                                <li><a href="/store/storeReview"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">리뷰조회</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#3collapse" aria-expanded="false">
                            메뉴관리
                        </button>
                        <div class="collapse" id="3collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">메뉴조회</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="mb-1">
                        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#2collapse" aria-expanded="false">
                            영업하기
                        </button>
                        <div class="collapse" id="2collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">주문접수</a>
                                </li>
                                <li><a href="#"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">주문처리내역</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="mb-1">
                        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#1collapse" aria-expanded="false">
                            매출관리
                        </button>
                        <div class="collapse" id="1collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">매출조회</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="container">
                <!--매장 등록 폼 시작-->

                <div class="form-control">
                    <div class="py-5 text-center">
                        <h2>매장 정보 수정</h2>
                    </div>
                    <div>
                        <div>
                            <form id="updateForm" class="needs-validation" novalidate>
                                <div class="row g-3">



                                    <!--매장명 수정 시작-->
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label">매장명</label>
                                            <input type="text" class="form-control" name="store_name" id="store_name" value="${updateData.store_name} " />
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장명 수정 끝-->

                                    <!--매장 로고 이미지 삽입-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label">매장 로고(이미지)</label>
                                            <input type="file" class="form-control" name="file" id="file" />
                                        </div>
                                    </div>
                                    <!--매장 로고 이미지 삽입 끝-->
                                    <hr />

                                    <!--매장 영업시간 수정 시작-->
                                    <div class="row">
                                        <div class="col-8">
                                            <label class="form-label">매장 영업시간</label>
                                            <textarea rows="7" class="form-control" name="store_operate_hour" id="store_operate_hour">${updateData.store_operate_hour}</textarea>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 영업시간 수정 끝-->

                                    <!--매장 간략 설명 시작-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="address" class="form-label">매장 설명</label>
                                            <textarea class="form-control" name="store_content" id="store_content">${updateData.store_content}</textarea>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 간략 설명 수정 끝-->
                                    <!--매장 상세 설명 수정 시작-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="address" class="form-label">매장 상세 설명</label>
                                            <textarea class="form-control" name="store_content_detail" id="store_content_detail">${updateData.store_content_detail}</textarea>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 상세 설명 수정 끝-->

                                    <!--매장 주소 수정 시작-->
                                    <div class="row">
                                        <div class="col-8">
                                            <label for="address" class="form-label">매장 주소</label>
                                            <input type="text" class="form-control" name="store_addr" id="store_addr" value="${updateData.store_addr}"/>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 주소 수정 끝-->


                                    <!--매장 정보 수정완료,취소 버튼-->
                                    <div class="row mb-4">
                                        <div class="col-4 mx-auto">
                                            <input type="button" class=" btn btn-primary btn-lg" id="storeInfoUpdateBtn" value="수정 완료"/>
                                            <input type="button" class=" btn btn-danger btn-lg" id="resetBtn" value="취소"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--메뉴등록  끝-->
            </div>
        </div>
    </div>
    <!--사이드바 끝-->


    <!-- 푸터 -->

    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
        </div>
    </footer>

    <!-- 푸터 끝-->

</body>

</html>