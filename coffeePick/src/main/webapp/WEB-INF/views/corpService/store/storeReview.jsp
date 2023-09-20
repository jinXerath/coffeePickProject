<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

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




</head>

<body>
   

              <!--매장쪽 리뷰 관리 시작-->
            <div class="container">
                <div class="container-fluid px-4">
                    <h1 class="mt-4">리뷰 관리</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            검색
                        </div>
                        <div class="card-body">
                             <div class="row mb-2">
                                <div class="col-md-2">
                                    <select class="form-select" required>
                                        <option value="">검색 조건</option>
                                        <option>매장 이름</option>
                                        <option>매장 아이디</option>
                                        <option>회원 닉네임</option>
                                        <option>회원 아이디</option>
                                        <option>신고 여부</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-secondary">초기화</button>
                                </div>
                            </div>
                            <div class="input-group mb-2">
                                <input type="text" class="form-control">
                                <button class="btn btn-outline-secondary" type="button">검색</button>
                            </div>
                        </div>
                    </div>

                   


                    <!-- 리뷰 리스트 시작 -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fa-solid fa-list me-1"></i>
                            리뷰 리스트
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover">
                                <thead class="text-center table-light">
                                    <tr>
                                        <th scope="col">리뷰 번호</th>
                                        <th scope="col">매장 이름</th>
                                        <th scope="col">매장 아이디</th>
                                        <th scope="col">회원 닉네임</th>
                                        <th scope="col">회원 아이디</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">신고 여부</th>
                                        <th scope="col">조회</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>크노커피</td>
                                        <td>qwer1234</td>
                                        <td>커피좋아</td>
                                        <td>asdf1234</td>
                                        <td>2023-09-01</td>
                                        <td>없음</td>
                                        <td><button class="btn btn-secondary">조회</button></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>크노커피</td>
                                        <td>qwer1234</td>
                                        <td>커피좋아</td>
                                        <td>asdf1234</td>
                                        <td>2023-09-01</td>
                                        <td class="text-danger fw-bolder">신고</td>
                                        <td><button class="btn btn-secondary">조회</button></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>크노커피</td>
                                        <td>qwer1234</td>
                                        <td>커피좋아</td>
                                        <td>asdf1234</td>
                                        <td>2023-09-01</td>
                                        <td>확인 완료</td>
                                        <td><button class="btn btn-secondary">조회</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        
                    </div>
                    <!-- 리뷰 리스트 끝 -->

                    <!-- 리뷰 상세 시작 -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fa-solid fa-list me-1"></i>
                            리뷰 상세
                        </div>
                        <div class="card-group">
                            <!-- 리뷰 -->
                            <div class="card">
                                <div class="card-header">
                                    <div>
                                        <i class="fa-solid fa-user"></i>
                                        최진혁
                                    </div>
                                    <div>
                                        ★★★★★
                                    </div>
                                </div>
                                <div class="text-center">
                                    <img src="../../../images/review/review-image.jpg"class="img-thumbnail" alt="..." width="20%">
                                </div>
                                <div class="card-body">
                                    <p class="card-text">
                                        가성비 최고 카페에용
                                        24시해서 더 좋아여 ㅎㅎ 
                                        조용하고 깔끔해여
                                        두부 베이글 왕 추천!!!! 고소하고 맛있어용 ㅎㅎ.크노먹을때 두부베이글은 꼭 주문한답니당
                                    </p>
                                </div>
                                <div class="card-footer small text-muted">
                                    리뷰 작성일 : 2023-09-01
                                </div>
                            </div>
                            <!-- 답글 -->
                            <div class="card">
                                <div class="card-header">
                                    <div>
                                        <i class="fa-solid fa-store"></i>
                                        크노커피
                                    </div>
                                    <div>
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">이용해주셔서 감사합니다.</p>
                                </div>
                                <div class="card-footer small text-muted">
                                    답글 작성일 : 2023-09-01
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-center">
                            <div class="text-center">
                                <button type="button" class="btn btn-primary btn-lg">확인</button>
                                <button type="button" class="btn  btn-danger btn-lg">삭제</button>
                                <button type="button" class="btn btn-secondary btn-lg">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>                
                <!--매장쪽 리뷰 관리 끝-->
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