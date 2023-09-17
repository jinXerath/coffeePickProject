<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<div class="container-fluid px-4">
    <h1 class="my-4">Main</h1>
    <div class="card my-4">
        <div class="card-body">
            여기에서 카드형식 받아서 사용하면 편할지도 몰라요
        </div>
    </div>
    <div class="card my-4">
        <div class="card-header">
            <i class="fas fa-chart-area me-1"></i>
            카드 헤더
        </div>
        <div class="card-body">
            카드 바디
        </div>
        <div class="card-footer small text-muted">카드 푸터</div>
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    절반 카드1
                </div>
                <div class="card-body">바디</div>
                <div class="card-footer small text-muted">푸터</div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-pie me-1"></i>
                    절반 카드2
                </div>
                <div class="card-body">바디</div>
                <div class="card-footer small text-muted">푸터</div>
            </div>
        </div>
    </div>
</div>