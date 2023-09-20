<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal" id="msg_popup" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <!-- MSG Space-->
            </div>
            <div class="modal-footer" id="btn_confirm">
                <button type="button" id="confirm_yes" class="btn btn-primary" data-dismiss="modal" >YES</button>
                <button type="button" id="confirm_no"class="btn btn-secondary" data-dismiss="modal">NO</button>
            </div>
            <div class="modal-footer" id="btn_alert">
                <button type="button" id="alert_ok"class="btn btn-primary" data-dismiss="modal" >OK</button>
            </div>
        </div>
    </div>
</div>