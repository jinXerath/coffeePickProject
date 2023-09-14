<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/adminCommon.jspf"%>
<link href="/resources/include/css/board.css" rel="stylesheet"/>

<div class="container-fluid px-4">
	<h1 class="mt-4">공지사항 게시판</h1>
	<hr />


	<form class="card mb-4">
		<div class="card-header fs-5">
			<i class="fa-solid fa-magnifying-glass"></i> 검색
		</div>
		<div class="card-body ">
			<!-- 검색 시작 -->
			<div class="row mb-2">
				<div class="col-md-2">
					<select class="form-select" required>
						<option value="">선택</option>
						<option>번호</option>
						<option>관리자</option>
						<option>제목</option>
						<option>내용</option>
						<option>작성일</option>
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
						<option value="">선택</option>
						<option value="">작성일</option>
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
					<input type="radio" name="admin_ authority" checked />전체
				</div>
				<div class="col-1 text-center padding" style="margin-right: 15px;">
					<input type="radio" name="admin_ authority" />최고관리자
				</div>
				<div class="col-1 text-center padding">
					<input type="radio" name="admin_ authority" />일반관리자
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
			<i class="fa-solid fa-list me-1 "></i> 공지사항 목록
		</div>
		<div class="card-body">
			<p class="">총 1건</p>

			<table class="table table-striped table-hover">
				<thead class="text-center table-light">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">관리자ID</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
						<th scope="col">관리</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<td>1</td>
						<td>super_admin</td>
						<td>추석 알바 채용관 오픈!</td>
						<td>2023-09-01</td>
						<td>651</td>
						<td><button class="btn btn-secondary ">상세보기</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>