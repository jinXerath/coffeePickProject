<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

  
   <script type="text/javascript">
      $(function(){
         
         //매장 등록하기 버튼 클릭시 이벤트 처리
         $("#storeInfoRegistBtn").click(function(){
               location.href = "/store/registForm";
         });
         
         // 매장 수정버튼 클릭시 이벤트 처리
         $("#storeInfoUpdateBtn").click(function(){
            $("#storeInfoForm").attr({
               "method" : "get",
               "action" : "/store/updateForm"
            })
            $("#storeInfoForm").submit();
         })
      })
   </script>
</head>

<body>
    
   
            <div class="container">
                <!--매장 정보 조회 폼 시작-->

                <div>
                    <div class="py-5 text-center">
                        <h2>매장 정보</h2>
                    </div>

                            <form id="storeInfoForm" class="needs-validation" novalidate>
                                <div class="row g-3">

                     
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
                              <div class=" row mb-4 col-4 mx-auto alert alert-info text-center" role="alert">
                                  매장정보가 없습니다. 매장정보를 등록해주세요.
                                  <div class="text-center">
                                     <input type="button" class=" btn btn-primary btn-lg" id="storeInfoRegistBtn" value="매장 등록 하러가기">
                                  </div>
                              </div>
                          </c:if>
                            <!--매장 정보 수정 버튼-->
                            <div class="row mb-4">
                                <div class="col-4 mx-auto">
                                    <input type="button" class=" btn btn-primary btn-lg" id="storeInfoUpdateBtn" value="매장 정보 수정하기">
                                </div>
                            </div>
                            <!-- 매장 정보 수정 버튼 끝 -->
                </div>
                <!--매장정보 조회 폼 끝-->
            </div>


</body>

</html>