<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>매장 정보 페이지</title>
  <!-- 헤더 푸터 부트스트랩 관련 링크-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="/resources/include/css/styles.css" rel="stylesheet" />
</head>

<body>
  <!-- 네비게이션 시작 -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
      <a class="navbar-brand" href="#!">CoffeePick</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
          class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">개인서비스</a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#!">주문하기</a></li>
              <li><a class="dropdown-item" href="#!">주문내역</a></li>
              <li><a class="dropdown-item" href="#!">장바구니</a></li>
            </ul>
          </li>
          <li class="nav-item"><a class="nav-link" href="#!">매장서비스</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">게시판</a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#!">이벤트</a></li>
              <li><a class="dropdown-item" href="#!">공지사항</a></li>
              <li><a class="dropdown-item" href="#!">상담/문의</a></li>
            </ul>
          </li>
          <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
        </ul>
        <form class="d-flex">
          <button class="btn btn-outline-dark" type="submit">
            <i class="bi-cart-fill me-1"></i>
            Cart
            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
          </button>
          <button class="btn btn-outline-dark" type="button">로그인</button>
          <button class="btn btn-outline-dark" type="button">회원가입</button>
        </form>
      </div>
    </div>
  </nav>
  <!--네비게이션 끝-->




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
      <div class="p-5 text-center bg-body-tertiary rounded-3">
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
      <div class="p-5 text-center bg-body-tertiary">
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

  


  <!-- 푸터 -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
    </div>
  </footer>
  <!-- 푸터 끝-->



  <!--헤더,푸터 관련 부트스트랩-->
  <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="/resources/include/js/scripts.js"></script>
</body>

</html>