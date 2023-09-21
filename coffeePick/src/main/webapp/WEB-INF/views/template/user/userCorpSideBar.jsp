<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!-- 스크립트 만들어서 세션이 이 -->
			<div class="flex-shrink-0 p-3" style="width: 280px;">
		
		
				<a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
					<svg class="bi pe-none me-2" width="30" height="24">
		                      <use xlink:href="#bootstrap" />
		                  </svg> 
		                  <span class="fs-5 fw-semibold">매장서비스</span>
				</a>
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							    data-bs-toggle="collapse" data-bs-target="#4collapse"
							    aria-expanded="false">매장정보관리
						</button>
						<div class="collapse" id="4collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li>
									<a href="/store/corpService/storeInfoRead"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보조회</a>
								</li>
								<li>
									<a href="/store/corpService/registForm"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">매장정보등록</a>
								</li>
								<li><a href="/store/corpService/storeReview"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">리뷰조회</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#3collapse"
								aria-expanded="false">메뉴관리
						</button>
						<div class="collapse" id="3collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="#"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">메뉴조회</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#2collapse"
								aria-expanded="false">영업하기
						</button>
						<div class="collapse" id="2collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/order/store/orderReceive"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">주문접수</a>
								</li>
								<li><a href="/order/store/orderProcess"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">처리중</a>
								</li>
								<li><a href="/order/store/orderProcessComplete"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">주문완료내역</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#1collapse"
							aria-expanded="false">매출관리
						</button>
						<div class="collapse" id="1collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="#"
										class="link-body-emphasis d-inline-flex text-decoration-none rounded">매출조회</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>