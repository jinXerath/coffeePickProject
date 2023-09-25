<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link href="/resources/include/css/styles.css" rel="stylesheet" />
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
<script src="/resources/include/js/scripts.js"></script>
<script type="text/javascript">
		$(function(){
		    //메뉴 이동 버튼 제어
		    $(".menuBtn").click(function(){
		        location.href = '/order/storeDetailMenu?store_id=${param.store_id}';
		    });

		    //매장 이동 버튼 제어
		    $(".storeBtn").click(function(){
		        location.href = '/order/storeDetailInfo?store_id=${param.store_id}';
		    });
		    
		    // 영업 시간 줄바꿈 처리
		    var storeContentElem = $("#storeContent")
		    if (storeContentElem.length) {
		    	storeContentElem.html(storeContentElem.text().replace(/\n/g, '<br>'));
		    }
		    var operateHourElem = $("#operateHour");
		    if (operateHourElem.length) {
		        operateHourElem.html(operateHourElem.text().replace(/\n/g, '<br>'));
		    }
		    
		});//end
</script>

  <input type="hidden" id="store_id" name="store_id" value="store_id"/>
  <!--메뉴/매장정보 구분 버튼 시작-->
  <div class="d-flex justify-content-center mt-5">
    <div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
			<button type="button" id="menuBtn" name="menuBtn"class="btn btn-outline-primary menuBtn">메뉴</button>
			<button type="button" id="storeBtn" name="storeBtn"class="btn btn-outline-primary storeBtn">매장정보</button>
    </div>
  </div>
  <!--메뉴/매장정보 구분 버튼 끝-->

<c:forEach var="store" items="${storeDetail}">
    <!-- 매장 로고,매장 설명 시작 -->
    <div class="container my-5">
        <div class="p-5 text-center rounded-3">
            <div class="mb-5"> <!--매장 로고와 매장 설명 사이 설정-->
                <img src="/coffeePickStorage/store/${store.store_img}" style="object-fit:contain;" width="350" height="200">
            </div>
            <h1 class="text-body-emphasis mb-3">카페 정보</h1>
                <div id="storeContent">
                	${store.store_content_detail}
                </div>
        </div>
    </div>
    <!-- 매장 로고,매장 설명 끝 -->
    
    <!-- 영업 시간 시작 -->
    <div class="my-5">
        <div class="p-5 text-center">
            <div  class="container py-5">
                <h1 class="text-body-emphasis">영업시간</h1>
                <div id="operateHour">${store.store_operate_hour}</div>
            </div>
        </div>
    </div>
    <!-- 영업 시간 끝 -->
</c:forEach>


  


 




  
  
  
