<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf"%>
<link href="/resources/include/css/board.css" rel="stylesheet"/>

<div class="container-fluid px-4">
	<h1 class="mt-4">가맹점 관리</h1>
	<hr />


	<form class="card mb-4">
		<div class="card-header fs-5">
			<i class="fa-solid fa-magnifying-glass"></i> 검색
		</div>
		<div class="card-body ">
			<!-- 검색 시작 -->
			<div class="row mb-2">
				<div class="col-md-2">
					<select class="form-select fontsize" required>
						<option value="">검색어 선택</option>
						<option>아이디</option>
						<option>대표명</option>
						<option>사업자등록번호</option>
						<option>매장명</option>
						<option>매장주소</option>
						<option>매장 전화번호</option>
						<option>대표 전화번호</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control fontsize" />
				</div>
			</div>

			<hr />

			<div class="row mb-2">
				<div class="col-md-2">
					<select class="form-select fontsize" required>
						<option value="">날짜 선택</option>
						<option value="">매장등록</option>
						<option value="">가입일</option>
					</select>
				</div>
				<div class="col-md-2">
					<input type="date" class="form-control fontsize" />
				</div>
				~
				<div class="col-md-2">
					<input type="date" class="form-control fontsize" />
				</div>
			</div>

			<hr />

			<div class="row mb-2 ">

				<div class="col-1 text-center ">
					<input type="radio" name="corp_status" checked> 전체</input>
				</div>
				<div class="col-1 text-center ">
					<input type="radio" name="corp_status" /> 회원탈퇴
				</div>
				<div class="col-1 text-center ">
					<input type="radio" name="corp_status" /> 미탈퇴
				</div>

			</div>

		</div>
		<div class="card-footer small text-muted text-center">
			<button class="btn btn-secondary ">초기화</button>
			<button class="btn btn-secondary ">검색</button>
		</div>
		<!-- 검색 끝 -->
	</form>

	<div class="card mb-4">
		<div class="card-header fs-5">
			<i class="fa-solid fa-list me-1 "></i> 매장 목록
		</div>
		<div class="card-body fontsize">
			<p class="">총 회원수: 5명</p>

			<table class="table table-striped table-hover">
				<thead class="text-center table-light">
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">대표명</th>
						<th scope="col">사업자등록번호</th>
						<th scope="col">매장명</th>
						<th scope="col">매장주소</th>
						<th scope="col">이메일</th>
						<th scope="col">가입일</th>
						<th scope="col">매장 등록일</th>
						<th scope="col">매장 전화번호</th>
						<th scope="col">대표 전화번호</th>
						<th scope="col">관리</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<td>hhhh111</td>
						<td>최진환</td>
						<td>1234567899</td>
						<td>다람쥐카페</td>
						<td>경기도 수원시 행복동</td>
						<td>rrrrrr@naver.com</td>
						<td>2023-09-01</td>
						<td>2023-09-01</td>
						<td>051-721-3281</td>
						<td>010-1111-1111</td>
						<td>탈퇴됨</td>
					</tr>
					<tr>
						<td>asdf222</td>
						<td>배준영</td>
						<td>2222222222</td>
						<td>빵좋아카페</td>
						<td>서울특별시 강남구 연남동 ㅇㅇㅇㅇ</td>
						<td>tttttt@naver.com</td>
						<td>2023-09-04</td>
						<td>2023-09-04</td>
						<td>02-123-1234</td>
						<td>010-2222-2222</td>
						<td><button class="btn btn-secondary ">탈퇴</button></td>
					</tr>
					<tr>
						<td>qwer333</td>
						<td>최지훈</td>
						<td>3333333333</td>
						<td>밀크티전문점</td>
						<td>경기 성남시 분당구 성남대로43번길 11</td>
						<td>yyyyyy@naver.com</td>
						<td>2023-09-04</td>
						<td>2023-09-04</td>
						<td>031-719-1111</td>
						<td>010-3333-3333</td>
						<td><button class="btn btn-secondary ">탈퇴</button></td>
					</tr>
					<tr>
						<td>zxcv444</td>
						<td>윤채림</td>
						<td>4444444444</td>
						<td>망고좋아카페</td>
						<td>경기 의왕시 갈미4로 444</td>
						<td>mmmmmm@naver.com</td>
						<td>2023-09-05</td>
						<td>2023-09-05</td>
						<td>031-719-1111</td>
						<td>010-3333-3333</td>
						<td><button class="btn btn-secondary ">탈퇴</button></td>
					</tr>
					<tr>
						<td>zxcv444</td>
						<td>윤2</td>
						<td>4444444447</td>
						<td>-</td>
						<td>-</td>
						<td>mm@naver.com</td>
						<td>2023-09-05</td>
						<td>-</td>
						<td>-</td>
						<td>010-3333-6333</td>
						<td><button class="btn btn-secondary ">탈퇴</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>