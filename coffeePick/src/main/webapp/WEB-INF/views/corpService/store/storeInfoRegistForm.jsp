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
    <link href="/resources/include/bootstrap-5.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/include/css/sidebars.css" rel="stylesheet">
	<link href="/resources/include/css/common.css" rel="stylesheet">    
	<script src="/resources/include/js/common.js"></script>   
    <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
	         $("#storeInfoRegistBtn").click(function(){      	  
	             if(!chkData("#store_name", "매장이름을")) return;
	             else if(!chkData("#store_operate_hour", "매장 영업시간을")) return;
	             else if(!chkData("#store_addr", "매장 주소를")) return;
	             else{
				 	if($("#file").val() !=""){ // 업로드할 이미지 파일이 존재한다면 확장자가 png, jpg, gif 외 파일을 업로드 할 수 없다, 또는 gif, png, jpg 파일만 업로드 할 수 있음.
				        if(!chkFile($("#file"))) return; // 이미지 파일만 업로드 가능.
			        }
	             	// enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". post방식 폼 전송에 기본값으로 사용.
	                $("#storeRegistForm").attr({
	                   "method" : "post",
	                   "enctype" : "multipart/form-data",
	                   "action" : "/store/storeInfoRegist"                  
	                })
	                $("#storeRegistForm").submit();
	             }
	          });
	          
	          /* 취소 버튼 클릭 시 처리 이벤트*/
	          $("#boardCancelBtn").click(function(){
	             $("#f_writeForm").each(function(){
	                this.reset();
	             });
	          });
	     }); 
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
                            data-bs-toggle="collapse" data-bs-target="#4collapse" aria-expanded="true">
                            매장정보관리
                        </button>
                        <div class="collapse" id="4collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보조회</a>
                                </li>
                                <li><a href="#"
                                        class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보등록</a>
                                </li>
                                <li><a href="#"
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

                <div>
                    <div class="py-5 text-center">
                        <h2>매장 정보 등록</h2>
                    </div>
                    <div>
                        <div>
                            <form id="storeRegistForm" class="needs-validation" novalidate>
                                <div class="row g-3">
                                <!-- 이건 매장ID 인데 값 받아와야해서 그냥 넣어놨습니더ㅏ. 9/12 -->
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label">매장ID</label>
                                            <input type="text" class="form-control" name="store_id" id="store_id"
                                                placeholder="매장 이름을 입력해주세요" required />
                                        </div>
                                    </div>
                                    <hr />
			

                                    <!-- 삭제할 것 기업회원ID 작성 시작-->
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label">기업회원ID</label>
                                            <input type="text" class="form-control" name="corp_id" id="corp_id"
                                                placeholder="기업회원ID 입력해주세요"/>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장명 작성 시작-->
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label">매장명</label>
                                            <input type="text" class="form-control" name="store_name" id="store_name"
                                                placeholder="매장 이름을 입력해주세요"/>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장명 작성 끝-->

                                    <!--매장 로고 이미지 삽입-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label">매장 로고(이미지)</label>
                                            <input type="file" class="form-control" name="file" id="file"/>
                                        </div>
                                    </div>
                                    <!--매장 로고 이미지 삽입 끝-->
                                    <hr />
                                    <!-- 매장 전화번호 작성 시작-->
                                   <div class="row">
                                        <div class="col-8">
                                            <label for="address" class="form-label">매장 전화번호</label>
                                            <input type="text" class="form-control" name="store_phone" id="store_phone"
                                                placeholder="주소를 입력해주세요" required />
                                        </div>
                                    </div>
                                    <hr />

                                    <!--매장 영업시간 작성 끝-->
                                    <!--매장 영업시간 작성 시작-->
                                    <div class="row">
                                        <div class="col-8">
                                            <label class="form-label">매장 영업시간</label>
                                            <textarea rows="7" class="form-control" name="store_operate_hour" id="store_operate_hour"></textarea>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 영업시간 작성 끝-->
                                    <!--매장  설명 시작-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="address" class="form-label">매장 설명</label>
                                            <textarea class="form-control" name="store_content" id="store_contnet" placeholder="매장 설명을 입력해주세요"
                                                ></textarea>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 간략 설명 작성 끝-->
                                    <!--매장 상세 설명 시작-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="address" class="form-label">매장 상세 설명</label>
                                            <textarea class="form-control" name="store_content_detail" id="store_content_detail" placeholder="매장 상세설명을 입력해주세요"
                                               ></textarea>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 상세 설명 끝-->

                                    <!--매장 주소 작성 시작-->
                                    <div class="row">
                                        <div class="col-8">
                                            <label for="address" class="form-label">매장 주소</label>
                                            <input type="text" class="form-control" name="store_addr" id="store_addr"
                                                placeholder="주소를 입력해주세요" required />
                                        </div>
                                    </div>
                                    <hr />
                                    <!--메뉴 가격 작성 끝-->


                                    <!--매장 정보 등록-->

                           		</div>
                            </form>
                            <div class="row mb-4">
                                <div class="col-4 mx-auto">
                                    <input type="button" value="매장 정보 등록" class=" btn btn-primary btn-lg" id="storeInfoRegistBtn" />
                                    <input type="button" value="취소" class=" btn btn-primary btn-lg" id="resetBtn" />
                                    
                                </div>
                            </div>                           
                        </div>
                    </div>
                </div>
                <!--메뉴등록 폼 끝-->
                
            </div>
        </div>
    </div>
    <!--사이드바 끝-->


    <!-- 푸터 

    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
        </div>
    </footer>

    -->


    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/resources/include/bootstrap-5.3.1-dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/include/js/color-modes.js"></script>
    <script src="/resources/include/js/sidebars.js"></script>
    <script src="/resources/include/js/scripts.js"></script>
</body>

</html>