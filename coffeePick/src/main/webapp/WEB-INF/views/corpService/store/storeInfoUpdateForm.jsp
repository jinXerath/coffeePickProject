<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			
			let successMsg = "${successMsg}";
			if(successMsg != ""){
				alert(successMsg);
				successMsg = "";
			}
			
			let errorMsg = "${errorMsg}";
			if(errorMsg != ""){
				alert(errorMsg);
				errorMsg = "";
			}

			
	         $("#storeInfoUpdateBtn").click(function(){
	            if(!chkData("#store_name", "매장명 을")) return;
	            else if(!chkData("#store_phone", "매장 전화번호를")) return;
	            else if(!chkData("#store_operate_hour", "매장 운영시간을")) return;
	            else if(!chkData("#store_addr", "매장 주소를")) return;
	            else{
	            	if($("#file").val() !=""){ 
	            		if(!chkFile($("#file"))) return;
	            	}
	            	
	                $("#updateForm").attr({
	                    "method" : "post",
	                    "enctype" : "multipart/form-data",
	                    "action" : "/store/storeInfoUpdate"
	                });
	                $("#updateForm").submit();		            
	            }
		    });
			
		})	
	</script>

            <div class="container mt-4 col-md-9">
                <!--매장 등록 폼 시작-->
			    <div class="py-5 text-center">
			        <h2>매장 정보 수정</h2>
			    </div>

			    <div>
			        <div>
			            <form id="updateForm" class="needs-validation" novalidate 
			            	name="updateForm"
							enctype="multipart/form-data">
							<input type="hidden" id="store_id" name="store_id" value="${updateData.store_id }">
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
			
								<!--매장 이미지 수정 시작-->
								<div class="row">
									<div class="col-6">
										<label for="address" class="form-label">매장 이미지(로고)</label>
										 <input type="file" class="form-control" id="file" name="file">
									</div>
								</div>
								<div class="mt-3">
									<img src="/coffeePickStorage/store/${updateData.store_img}" class="file" 
														style="width:200px;" />
								</div>
								<p>업로드된 이미지: ${updateData.store_img}</p>
								<hr />
								
								<!-- 매장 전화번호 수정 -->
	                            <div class="row">
	                                 <div class="col-8">
	                                     <label for="address" class="form-label">매장 전화번호</label>
	                                     <input type="text" class="form-control" name="store_phone" id="store_phone" value="${updateData.store_phone}">
	                                 </div>
	                            </div>
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
  