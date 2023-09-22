<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			// 매장 수정 버튼 클릭시
			$("#storeInfoUpdateBtn").click(function(){
				$("#storeInfoForm").attr({
					"method" : "get",
					"action" : "/store/corpService/updateForm"
				});
				$("#storeInfoForm").submit();
			});
			
			// 매장 등록 버튼 클릭시
			$("#storeInfoRegistBtn").click(function(){
				$("sotreInfoForm").attr({
					"method" : "get",
					"action" : "/store/corpService/registForm"
				});
				$("#storeInfoForm").submit();
			});
		});
			
	</script>

            <div class="container mt-4 col-md-9">
                <!--매장 정보 조회 폼 시작-->

                <div class="form-control">
                    <div class="py-5 text-center">
                        <h2>매장 정보</h2>
                    </div>
                    <form id="storeInfoForm" class="needs-validation" novalidate>
                    	<div class="row g-3">
                    		<c:if test="${empty storeVO}">
                   	    		<div class="alert alert-info" role="alert">
                   	        		매장정보가 없습니다. 매장정보를 등록해주세요.
		                   	    </div>
		            	        <div class="text-center">
		              	    		<input type="button" class=" btn btn-primary btn-lg" id="storeInfoRegistBtn" value="매장등록 하러하기">
		                   		</div>
		                   	</c:if>

                   			<c:if test="${not empty storeVO}">
  
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
												<img src="/coffeePickStorage/store/${storeVO.store_img }" class="file" width="150px"/>
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
		                        <div class="row mb-4 text-center">
		                   			<div class="row col-4 mx-auto">
		                       		 	<input type="button" class=" btn btn-primary" id="storeInfoUpdateBtn" value="매장정보 수정하기">
		                       	    	<input type="button" class=" btn btn-danger" id="storeInfoDeleteBtn" value="매장 삭제하기">
		                        	</div>
		                   		</div>  
	                        </c:if>
	                    </div>
                    </form>
            
 
                </div>
            </div>
            <!--매장정보 조회 폼 끝-->
