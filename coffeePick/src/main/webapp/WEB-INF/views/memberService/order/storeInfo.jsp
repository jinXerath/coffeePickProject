<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Page JS -->
<!-- Page CSS -->
</head>
<body>
  


  <!--메뉴/매장정보 구분 버튼 시작-->
  <div class="d-flex justify-content-center mt-5">
    <div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
      <button type="button" class="btn btn-outline-primary">메뉴</button>
      <button type="button" class="btn btn-outline-primary">매장정보</button>
    </div>
  </div>
  <!--메뉴/매장정보 구분 버튼 끝-->


    <!--매장 로고,매장 설명 시작-->
    <div class="container my-5">
      <div class="p-5 text-center">
        <div class="mb-5"> <!--매장 로고와 매장 설명 사이 설정-->
          <img src="/images/빽다방 로고.png" style="object-fit:contain;" width="350" height="200">
        </div>

        <h1 class="text-body-emphasis mb-3">카페 정보</h1>
        <p class="col-lg-8 mx-auto fs-5 text-muted">
          빽다방은 대한민국의 커피 전문 브랜드로, 다양한 커피 음료와 음식을 제공하는 카페 체인입니다. "빽다방"이라는 이름은 커피가 끓는 소리인 "빽"과 휴식을 뜻하는 "다방"을 결합한 것으로, 고객들에게
          여유롭고 편안한 시간을 제공하는 의미를 담고 있습니다.

          빽다방은 다양한 종류의 커피 메뉴뿐만 아니라 음식 메뉴도 다양하게 제공하여 고객들이 커피를 즐기며 식사를 할 수 있는 장소로 자리 잡았습니다. 핫 아메리카노, 카페라떼, 카페모카, 프라푸치노 등
          다양한 커피 음료뿐만 아니라 샌드위치, 브레드, 빵 등 다양한 빵과 음식을 함께 즐길 수 있습니다.

          빽다방은 커피뿐만 아니라 카페 분위기와 서비스에도 신경을 써서 많은 사람들이 휴식과 만남의 장소로 이용하고 있습니다. 빽다방은 다양한 매장 디자인과 분위기를 갖추고 있어서 한 끼 식사부터 친구나
          가족과 함께하는 모임까지 다양한 상황에 적합한 카페입니다.
        </p>

      </div>
    </div>
    <!--매장 로고,매장 설명 끝-->




    <!--영업 시간 시작-->
    <div class="my-5">
      <div class="p-5 text-center ">
        <div class="container py-5">
          <h1 class="text-body-emphasis">영업시간</h1>
          <p class="col-lg-8 mx-auto lead">
          <table class="table">
            <thead>
              <tr>
                <th>요일</th>
                <th>영업 시작</th>
                <th>영업 종료</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>월요일</td>
                <td>09:00</td>
                <td>18:00</td>
              </tr>
              <tr>
                <td>화요일</td>
                <td>09:00</td>
                <td>18:00</td>
              </tr>
              <tr>
                <td>수요일</td>
                <td>09:00</td>
                <td>18:00</td>
              </tr>
              <tr>
                <td>목요일</td>
                <td>09:00</td>
                <td>18:00</td>
              </tr>
              <tr>
                <td>금요일</td>
                <td>09:00</td>
                <td>18:00</td>
              </tr>
              <tr>
                <td>토요일</td>
                <td>10:00</td>
                <td>15:00</td>
              </tr>
              <tr>
                <td>일요일</td>
                <td>휴무</td>
                <td>휴무</td>
              </tr>
            </tbody>
          </table>
          </p>
        </div>
      </div>
    </div>
    <!--영업 시간 끝-->




    <!--카페 방문 리뷰 시작-->
    <div class="card">
      <div class="card-body">
        리뷰 자리
      </div>
    </div>
    <!--카페 방문 리뷰 끝-->

  


S
</body>

</html>