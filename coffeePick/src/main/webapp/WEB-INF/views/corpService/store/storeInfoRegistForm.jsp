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
	         $("#storeInfoRegistBtn").click(function(){      	  
			 	if($("#file").val() !=""){ 
					if(!chkFile($("#file"))) return;
				}
	             	// enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". post방식 폼 전송에 기본값으로 사용.
	            $("#storeRegistForm").attr({
	            	"method" : "post",
	                "enctype" : "multipart/form-data",
	                "action" : "/store/corpService/storeInfoRegist"
	            });
	            $("#storeRegistForm").submit();
	             
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
   

    

            <div class="container">
                <!--매장 등록 폼 시작-->

                <div class="form-control">
                    <div class="py-5 text-center">
                        <h2>매장 정보 등록</h2>
                    </div>
 
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
                <!--메뉴등록 폼 끝-->
                
            </div>
     


    <!-- 푸터 

    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
        </div>
    </footer>

    -->



</body>

</html>