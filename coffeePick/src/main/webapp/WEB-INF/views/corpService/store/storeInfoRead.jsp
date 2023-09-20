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
	<script type="text/javascript">
		$(function(){
			$("#storeInfoUpdateBtn").click(function(){
				$("#storeInfoForm").attr({
					"method" : "get",
					"action" : "/store/corpService/updateForm"
				});
				$("#storeInfoForm").submit();
			});
			
			$
		});
	</script>
</head>

<body>
    
   
            <div class="container">
                <!--매장 정보 조회 폼 시작-->

                <div class="form-control">
                    <div class="py-5 text-center">
                        <h2>매장 정보</h2>
                    </div>
                    <form id="storeInfoForm" class="needs-validation" novalidate>
                        <div class="row g-3">

							<div>
								<input type="hidden" id="corp_id" name="corp_id" value="${storeVO.corp_id }"/>
							</div>								
                            <!--매장명-->
                            <div class="row">
                                <div class="col-4">
                                    <label class="form-label">매장명</label>
                                    <p>${storeVO.store_name }</p>
                                    
                                </div>
                            </div>
                            <hr />
                            <!--매장명 작성-->
		
                            <!--매장 로고 이미지-->
                            <div class="row">
                                <div class="col-6">
                                    <label class="form-label">매장 로고(이미지)</label>
                                    <div>
										<c:if test="${not empty storeVO.store_img }">
											<img src="/coffeePickStorage/store/${storeVO.store_img }" class="file" width="50px"/>
										</c:if>
										<c:if test="${empty storeVO.store_img }">
											<img src="/resources/images/no-image.png" width="50px"/>
										</c:if>
                                	</div>
                                </div>
                            </div>
                            <!--매장 로고 이미지 끝-->
                            <hr />

                            <!--매장 영업시간-->
                            <div class="row">
                                <div class="col-8">
                                    <label class="form-label">매장 영업시간</label>
                                    <p>${storeVO.store_operate_hour}</p>   
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

                        </div>  
                    </form>
                       <!-- storeVO가 없을 때 메시지 표시 -->
                    
                   	<c:if test="${empty storeVO}">
                   	    <div class="alert alert-info" role="alert">
                   	        매장정보가 없습니다. 매장정보를 등록해주세요.
                   	    </div>
                   	</c:if>
					<!--매장 정보 수정 버튼-->
                    <div class="row mb-4">
                    	<div class="col-4 mx-auto">
                        	<input type="button" class=" btn btn-primary btn-lg" id="storeInfoUpdateBtn" value="매장정보 수정하기">
                            <input type="button" class=" btn btn-danger btn-lg" id="storeInfoDeleteBtn" value="매장 삭제하기">
                        </div>
                   	</div>
                 	<!-- 매장 정보 수정 버튼 끝 -->
                </div>
            </div>
            <!--매장정보 조회 폼 끝-->
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