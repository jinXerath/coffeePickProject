<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf" %>

<div class="container-fluid px-4">
	<h1 class="mt-4">리뷰 관리</h1>
	<div class="card mb-4">
	    <div class="card-header">
	        <i class="fa-solid fa-magnifying-glass"></i>
	        검색
	    </div>
	    <div class="card-body text-center">
	        <form>
	            <div class="row mb-2">
	                <div class="col-2 text-center"> <!-- Date input -->
	                    <input class="form-control" id="date" name="date" type="date"/>
	                </div>
	                <div class="col-1 text-center">
	                    ~
	                </div>
	                <div class="col-2"> <!-- Date input -->
	                    <input class="form-control" id="date" name="date" type="date"/>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-md-2">
	                    <select class="form-select">
	                        <option value="">검색 조건</option>
	                        <option>매장 이름</option>
	                        <option>매장 아이디</option>
	                        <option>회원 닉네임</option>
	                        <option>회원 아이디</option>
	                        <option>신고 여부</option>
	                    </select>
	                </div>
	                <div class="col-md-3">
	                    <input type="text" class="form-control" placeholder="검색어를 입력해주세요">
	                </div>
	            </div>
	            <hr>
	            <div class="row mb-2 text-center">
	                <div class="col">
	                    <button class="btn btn-secondary" type="button">검색</button>
	                    <button class="btn btn-secondary">초기화</button>
	                </div>
	            </div>
	        </form>
	        
	    </div>
	</div>
	
	<!-- 리뷰 리스트 시작 -->
	<div class="card mb-4">
	    <div class="card-header">
	        <i class="fa-solid fa-list me-1"></i>
	        리뷰 리스트
	    </div>
	    <div class="card-body">
	        <table class="table table-striped table-hover">
	            <thead class="text-center table-light">
	                <tr>
	                    <th scope="col">리뷰 번호</th>
	                    <th scope="col">매장 이름</th>
	                    <th scope="col">매장 아이디</th>
	                    <th scope="col">회원 닉네임</th>
	                    <th scope="col">회원 아이디</th>
	                    <th scope="col">작성일</th>
	                    <th scope="col">신고 여부</th>
	                    <th scope="col">조회</th>
	                </tr>
	            </thead>
	            <tbody class="text-center">
	                <tr>
	                    <th scope="row">1</th>
	                    <td>크노커피</td>
	                    <td>qwer1234</td>
	                    <td>커피좋아</td>
	                    <td>asdf1234</td>
	                    <td>2023-09-01</td>
	                    <td>없음</td>
	                    <td><button class="btn btn-secondary">조회</button></td>
	                </tr>
	                <tr>
	                    <th scope="row">2</th>
	                    <td>크노커피</td>
	                    <td>qwer1234</td>
	                    <td>커피좋아</td>
	                    <td>asdf1234</td>
	                    <td>2023-09-01</td>
	                    <td class="text-danger fw-bolder">신고</td>
	                    <td><button class="btn btn-secondary">조회</button></td>
	                </tr>
	                <tr>
	                    <th scope="row">3</th>
	                    <td>크노커피</td>
	                    <td>qwer1234</td>
	                    <td>커피좋아</td>
	                    <td>asdf1234</td>
	                    <td>2023-09-01</td>
	                    <td>확인 완료</td>
	                    <td><button class="btn btn-secondary">조회</button></td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	    
	    
	</div>
	<!-- 리뷰 리스트 끝 -->
	
	<!-- 리뷰 상세 시작 -->
	<div class="card mb-4">
	    <div class="card-header">
	        <i class="fa-solid fa-list me-1"></i>
	        리뷰 상세
	    </div>
	    <div class="card-group">
	        <!-- 리뷰 -->
	        <div class="card">
	            <div class="card-header">
	                <div>
	                    <i class="fa-solid fa-user"></i>
	                    최진혁
	                </div>
	                <div>
	                    ★★★★★
	                </div>
	            </div>
	            <div class="text-center">
	                <img src="../../../images/review/review-image.jpg"class="img-thumbnail" alt="..." width="20%">
	            </div>
	            <div class="card-body">
	                <p class="card-text">
	                    가성비 최고 카페에용
	                    24시해서 더 좋아여 ㅎㅎ 
	                    조용하고 깔끔해여
	                    두부 베이글 왕 추천!!!! 고소하고 맛있어용 ㅎㅎ.크노먹을때 두부베이글은 꼭 주문한답니당
	                </p>
	            </div>
	            <div class="card-footer small text-muted">
	                리뷰 작성일 : 2023-09-01
	            </div>
	        </div>
	        <!-- 답글 -->
	        <div class="card">
	            <div class="card-header">
	                <div>
	                    <i class="fa-solid fa-store"></i>
	                    크노커피
	                </div>
	                <div>
	                    &nbsp;
	                </div>
	            </div>
	            <div class="card-body">
	                <p class="card-text">이용해주셔서 감사합니다.</p>
	            </div>
	            <div class="card-footer small text-muted">
	                답글 작성일 : 2023-09-01
	            </div>
	        </div>
	    </div>
	    <div class="card-body text-center">
	        <div class="text-center">
	            <button type="button" class="btn btn-primary btn-lg">확인</button>
	            <button type="button" class="btn  btn-danger btn-lg">삭제</button>
	            <button type="button" class="btn btn-secondary btn-lg">닫기</button>
	        </div>
	    </div>
	</div>
	<!-- 리뷰 상세 끝 -->
</div>