<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
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

            <div class="container mt-4 col-md-9">
                <!--매장 등록 폼 시작-->
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
  