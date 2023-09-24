<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<style>
		textarea{
			resize: none;
		}
	</style>
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
	    	  // 저장 버튼 클릭시 처리 이벤트
	         $("#storeInfoRegistBtn").click(function(){
	            if(!chkData("#store_name", "매장명 을")) return;
	            else if(!chkData("#store_phone", "매장 전화번호를")) return;
	            else if(!chkData("#store_operate_hour", "매장 운영시간을")) return;
	            else if(!chkData("#store_addr", "매장 주소를")) return;
	            else{
	            	if($("#file").val() !=""){ 
	            		if(!chkFile($("#file"))) return;
	            	}
	            
	       
		            $("#storeRegistForm").attr({
		            	"method" : "post",
		                "enctype" : "multipart/form-data",
		                "action" : "/store/storeInfoRegist"
		            });
		            $("#storeRegistForm").submit();
	            }
	          });
	          
	          /* 취소 버튼 클릭 시 처리 이벤트*/
	          $("#resetBtn").click(function(){
	             $("#storeRegistForm").each(function(){
	                this.reset();
	             });
	          });
	     }); 
	</script>

            <div class="container mt-4 col-md-9">
                <!--매장 등록 폼 시작-->

               	<c:if test="${ not empty store}">
	   	    		<div class="alert alert-info" role="alert">
	      	        		이미 매장 정보가 등록되어있습니다.
	        	    </div>
               	</c:if>
               	<c:if test="${empty store}">
                    <div class="py-5 text-center">
                        <h2>매장 정보 등록</h2>
                    </div>
	                    <form id="storeRegistForm" class="needs-validation" novalidate>
	                        <div class="row g-3">
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
	                                        placeholder="매장 전화번호를 입력해주세요" required />
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
					</c:if>
                </div>
                <!--메뉴등록 폼 끝-->
                
