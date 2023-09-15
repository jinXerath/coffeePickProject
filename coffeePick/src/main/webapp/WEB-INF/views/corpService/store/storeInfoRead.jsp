<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  

</head>

<body>
  
   
            <div class="container">
                <!--매장 정보 조회 폼 시작-->

                <div>
                    <div class="py-5 text-center">
                        <h2>매장 정보 조회</h2>
                    </div>
                    <div>
                        <div>
                            <form class="needs-validation" novalidate>
                                <div class="row g-3">


                           
                                    <!--매장명-->
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label">매장명</label>
                                            <p>${storeVO.store_name}</p>
                                            <p>${storeVO.store_id}</p>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장명 작성-->

                                    <!--매장 로고 이미지-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="form-label">매장 로고(이미지)</label>
                                            <p>아나</p>
                                        </div>
                                    </div>
                                    <!--매장 로고 이미지 끝-->
                                    <hr />

                                    <!--매장 영업시간-->
                                    <div class="row">
                                        <div class="col-8">
                                            <label class="form-label">매장 영업시간</label>
                                             
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 영업시간 끝-->

                                    <!--매장 설명-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="address" class="form-label">매장 설명</label>
                                            <p>${storeVO.store_content}</p>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--메뉴 설명끝-->

                                    <!--매장 상세 설명-->
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="address" class="form-label">매장 상세 설명</label>
                                            <p>${storeVO.store_content_detail}</p>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 상세 설명 끝-->
                                    
                                    <!--매장 주소-->
                                    <div class="row">
                                        <div class="col-8">
                                            <label for="address" class="form-label">매장 주소</label>
                                            <p>${storeVO.store_addr}</p>
                                        </div>
                                    </div>
                                    <hr />
                                    <!--매장 주소 끝-->

                                    <!--매장 정보 수정-->
                                    <div class="row mb-4">
                                        <div class="col-4 mx-auto">
                                            <button class=" btn btn-primary btn-lg" type="submit">매장 정보 수정하기</button>
                                        </div>
                                    </div>
                                </div>  
                            </form>
                        </div>
                    </div>
                </div>
                <!--매장정보 조회 폼 끝-->
            </div>
   

  
</body>

</html>