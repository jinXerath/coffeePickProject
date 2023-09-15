<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page JS -->
  <script type="text/javascript">
  $(function(){
	// 검색 후 검색 대상과 검색 단어 출력
	  let word="<c:out value='${storeVO.keyword}' />";
	  let value="";
	  if(word!=""){
	    $("#keyword").val("<c:out value='${storeVO.keyword}' />");
	    $("#search").val("<c:out value='${storeVO.search}' />");

	    if($("#search").val() != 'b_content'){
	      if($("#search").val() == 'store_name') value = ".card h3";  // 매장 이름을 포함하는 h3 태그 선택
	      else if($("#search").val() == 'store_addr') value = ".card small";  // 매장 주소를 포함하는 small 태그 선택

	      console.log($(value+":contains('"+word+"')").html());

	      $(value+":contains('"+word+"')").each(function(){
	        let regex = new RegExp(word, 'gi');
	        $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
	      });
	    }
	  }

      
      /* 입력 양식 enter 제거*/
      $("#keyword").bind("keydown", function(event){
         if(event.keyCode == 13){
            event.preventDefault();
         }
      });
      
      /*검색 대상이 변경될 때마다 처리 이벤트*/
      $("#search").change(function(){
         if($("#search").val()=="all"){
            $("#keyword").val("전체 목록 조회합니다.");
         } else if($("#search").val()!="all"){
            $("#keyword").val("");
            $("#keyword").focus();
         }
      });
      
      /* 검색 버튼 클릭 시 처리 이벤트*/
      $("#searchData").click(function(){
         if($("#search").val() != "all"){ // 제목 / 내용 / 작성자 선택시 검색어 유효성 체크
            if(!chkData("#keyword","검색어를")) return;
         }
         //$("#pageNum").val(1); // ㅍㅔ이지 초기화
         //goPage();
      });
      
   }); //$함수 종료
   </script>
   <!-- Page CSS -->
</head>

<body>
<div class="ContentContainer container">
 

  <!-- 네비와 드롭다운,검색창 부분 사이 공간 mt-5로 제어해 주는 부분 시작-->
<div class="container d-flex justify-content-center mt-5">
    <!-- ==========================검색기능 시작============================== -->
    <div id="boardSearch" class="text-right d-flex">
        <form id="f_search" name="f_search" class="form-inline d-flex justify-content-center">
            <!-- 페이징 처리를 위한 파라미터 -->
            <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
            <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
            <div class="form-group d-flex align-items-center">
                <select id="search" name="search" class="form-control mr-5">
                    <option value="all">전체</option>
                    <option value="store_name">매장</option>
                    <option value="store_addr">지역</option>
                </select>
                <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control mr-4"/>
                <button type="button" id="searchData" class="btn btn-success">검색</button>
            </div>
        </form>
    </div>
    <!-- ==========================검색기능 종료============================== -->
</div>


  <!-- 매장 리스트 시작-->
  <div class="album py-5" id="storeList">
    <div class="container">
      <div class="row row-cols-1 row-cols-md-6 g-3">

        
      <!-- 데이터 출력 -->
      <c:choose>
        <c:when test="${not empty storeList}">
          <c:forEach var="store" items="${storeList}" varStatus="status">
            <div class="col">
              <div class="card shadow-sm">
                <img src="${store.store_img}" style="object-fit:contain;" class="bd-placeholder-img card-img-top"
                  width="100%" height="225" alt="Your Image Description">
                <div class="card-body">
                  <h3 class="card-text">${store.store_name}</h3>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" id="storeBtn"class="btn btn-sm btn-outline-secondary">매장이동</button>
                    </div>
                  </div>
                  <small>${store.store_addr}</small>
                </div>
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="col">
            <div class="card shadow-sm">
              <div class="card-body">
                등록된 매장이 없습니다.
              </div>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
	  <!-- 데이터 출력 끝 -->			
        
      </div>
    </div>
  </div>
  <!-- 매장 리스트 끝-->
  
  <!-- 페이징 출력 시작 -->
  <!-- 페이징 출력 끝 -->
  
</div>


  
</body>

</html>