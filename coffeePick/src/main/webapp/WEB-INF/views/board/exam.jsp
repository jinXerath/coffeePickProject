<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>메뉴 리스트 메인 화면</title>
    <!-- 헤더 푸터 부트스트랩 관련 링크-->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/resources/include/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
        integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
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
                    <li class="nav-item"><a class="nav-link" href="#!">매장서비스</a></li>
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




    <!--메뉴/매장정보 구분 버튼 시작-->
    <div class="d-flex justify-content-center mt-5">
        <div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
            <button type="button" class="btn btn-outline-primary">메뉴</button>
            <button type="button" class="btn btn-outline-primary">매장정보</button>
        </div>
    </div>
    <!--메뉴/매장정보 구분 버튼 끝-->




    <!--매장명-->
    <div class="text-center p-3">
        <h1 class="display-5 fw-bold">빽다방</h1>
    </div>
    <!--매장명 끝-->




    <!--로고,영업여부,영업시간,매장전화번호 + 지도,매장 주소 묶어주는 부분 시작-->
    <div class="container py-2">
        <div class="row align-items-md-stretch">
            <!--메장로고,영업여부,영업시간,전화번호 시작-->
            <div class="col-md-6" style="margin-top: -100px;"> <!--로고 영업 상태,영업시간,매장 전화번호 위 아래 이동 설정-->
                <div class="h-100 p-5 bg-body-tertiary rounded-3">
                    <div class="container-fluid py-5">
                        <div class="mb-4"> <!-- 이미지와 영업 여부 사이의 공간 설정 -->
                            <!--매장 로고-->
                            <img src="/images/빽다방 로고.png" style="object-fit:contain;" class="me-4" width="350"
                                height="200"> 
                        </div>
                        <!--영업 여부-->
                        <h1>영업 중</h1>
                    </div>
                    <!--매장 간략 설명-->
                    <h1>안녕하세요 빽다방입니다.</h1>
                    <!--매장 전화번호-->
                    <h4>02-1111-1111</h4>
                </div>
            </div>
            <!--매장로고,영업여부,영업시간,전화번호 끝-->

            <!-- 지도,매장 주소 시작-->
            <div class="col-md-6">
                <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                    <div class="mb-3"> <!--지도와 매장주소 사이의 공간 설정-->
                        <img src="/images/빽다방 지도.png"> <!--매장 지도-->
                    </div>
                    <!--매장 주소-->
                    <p>강남역 4번출구 도보3분거리, 강남역 1번출구 도보5분거리</p>
                </div>
            </div>
            <!-- 지도,매장 주소 끝-->
        </div>
    </div>
    <!--로고,영업여부,영업시간,매장전화번호 + 지도,매장 주소 묶어주는 부분 끝-->




    <!--전체메뉴,커피,논커피,디저트 구분 버튼 시작-->
    <div class="d-flex justify-content-center">
        <div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
            <button type="button" class="btn btn-outline-primary">All</button>
            <button type="button" class="btn btn-outline-primary">Coffee</button>
            <button type="button" class="btn btn-outline-primary">Non-Coffee</button>
            <button type="button" class="btn btn-outline-primary">Desert</button>
        </div>
    </div>
    <!--전체메뉴,커피,논커피,디저트 구분 버튼 끝-->




    <!--메뉴 리스트 + 장바구니 시작-->
    <div class="container">
        <!--메뉴 리스트 + 장바구니 row 제어 시작-->
        <div class="row">
            <!--메뉴 리스트 공간 할당 col-8 시작-->
            <div class="col-8">
                <h7 class="fw-bolder mb-4">원하는 메뉴를 장바구니에 담아주세요.</h7>
                <!--메뉴 리스트 출력 갯수,간격 설정 시작-->
                <div class="row gx-5 row-cols-xl-4 justify-content-center">

                    <!--메뉴 리스트 시작-->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!--메뉴 이미지-->
                            <img class="card-img-top" src="/images/ICED-앗메리카노-450x588.png" width="200"
                                height="250" style="object-fit:contain;" />
    
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 메뉴 이름-->
                                    <h3 class="fw-bolder">아메리카노</h3>
                                    <!-- 메뉴 가격-->
                                    <h4>7000원</h4>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center btn-outline-primary mt-auto"><button type="button" name="bbtn"
                                        id="bbtn" class="btn btn-outline-primary mt-auto">장바구니에 담기</button></div>
                            </div>
                        </div>
                    </div>

                

                    <!--메뉴 리스트 끝-->
                </div>
                <!--메뉴 리스트 출력 갯수,간격 설정 끝-->
            </div>
            <!--메뉴 리스트 공간 할당 col-8 끝-->



            <!--추가옵션 선택 창 시작-->
            <!-- 추가옵션 선택 창 (모달) -->
            <div class="modal fade" id="optionsModal" tabindex="-1" aria-labelledby="optionsModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="optionsModalLabel">추가 옵션 선택</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- 여기에 추가 옵션 선택 폼이나 내용을 추가하세요 -->
                            <p>옵션을 선택하세요:</p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="option1">
                                <label class="form-check-label" for="option1">옵션 1</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="option2">
                                <label class="form-check-label" for="option2">옵션 2</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary">장바구니에 추가</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--추가옵션 선택 창 끝-->


            <!--장바구니 시작-->
            <div class="col-4">
                <!--장바구니 고정,윗 공간 설정 시작-->
                <div class="sticky-top" style="top: 30px;">
                    <!--장바구니 넓이 조절 시작-->
                    <div class="col-md-14"> 
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">장바구니</span>
                        </h4>
                        <!--장바구니 목록 시작-->
                        <ul class="list-group mb-3">
                            <!--장바구니에 담을 메뉴 시작-->
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h4 class="my-0">아메리카노</h4>
                                    <h6 class="text-body-secondary mt-2">얼음 추가</h6>
                                    <h6 class="text-body-secondary mt-2">얼음 추가</h6>
                                    <h6 class="text-body-secondary mt-2">얼음 추가</h6>
                                    <h7 class="text-body-secondary mt-2">얼음 추가</h7>
                                </div>
                                <button type="button" class="btn btn-outline-primary"
                                    style="height: fit-content;">+</button>
                                <h4 class="text-center mt-1">1</h4>
                                <button type="button" class="btn btn-outline-primary"
                                    style="height: fit-content;">-</button>
                                <h5 class="text-body-secondary mt-1">7000원</h5>
                                <button type="button" class="btn btn-outline-primary"
                                    style="height: fit-content;">X</button>
                            </li>

                            <!--장바구니에 담을 메뉴 끝-->

                            <li class="list-group-item d-flex justify-content-between">
                                <h2>결제예정금액</h2>
                                <h2><strong>28000원</strong></h2>
                            </li>
                            <div class="text-center mt-4">
                                <button type="button" class="btn btn-outline-primary" style="width: 150px;">장바구니
                                    비우기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-primary"
                                    style="width: 150px;">결제하기</button>
                            </div>
                        </ul>
                        <!--장바구니 목록 끝-->
                    </div>
                    <!--장바구니 넓이 조절 끝-->
                </div>
                <!--장바구니 고정,윗 공간 설정 시작-->
            </div>
            <!--장바구니 끝-->
        </div>
        <!--메뉴 리스트 + 장바구니 row 제어 끝-->
    </div>
    <!--메뉴 리스트 + 장바구니 끝-->

    <!-- 푸터 -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
        </div>
    </footer>
    <!-- 푸터 끝-->

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/resources/include/js/scripts.js"></script>
    <script src="/include/js/jquery-3.7.0.min.js"></script>

    <!--모달 창 나오게 하는 스크립-->
    <script>
        // 모든 '장바구니에 담기' 버튼을 선택하고 이벤트 리스너를 추가
        var buttons = document.querySelectorAll('button[name="bbtn"]');
        buttons.forEach(function (button) {
            button.addEventListener('click', function () {
                $('#optionsModal').modal('show');
            });
        });
    </script>

</body>

</html>