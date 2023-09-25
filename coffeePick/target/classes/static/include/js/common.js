/*************************************************** 
*	함수명: chkData(유효성 체크 대상, 메세지 내용)
*	출력영역: alert dmfh.
*	예시 : if(!chkData("#ekyword","검색어를")) return;
****************************************************/
function chkData(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}



function formCheck(item, msgId, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		$(msgId).text(msg + " 입력해 주세요.")
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

/* 함수명: checkForm(유효성 체크 대상, 메시지 내용)

 * 출력영역: placeholder 속성을 이용.

 * 예시 : if(!checkForm("#keyword","검색어를")) return;

 */

function checkForm(item, msg) {
	let message = "";
	if ($(item).val().replace(/\s/g, "") == "") {
		message = msg + " 입력해 주세요.";
		$(item).attr("placeholder", message);
		return false;
	} else {
		return true;
	}
}



/* 함수명: chkFile(파일명 객체)
 * 설명: 이미지 파일 여부를 확인하기 위해 확장자 확인 함수.
 * if(!chkFile($("#file"))) return;
 */

function chkFile(item) {
	/*
		참고사항
		jQuery.inArray(찾을 값, 검색 대상의 배열): 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우-1반환)
		pop(): 배열의 마지막 요소를 제거한 후, 제거한 요소를 반환
	*/
	let ext = item.val().split('.').pop().toLowerCase();
	if (jQuery.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
		item.val("");
		return false;
	} else {
		return true;
	}

}
 /* Alert */
var MsgBox = {
   
    Alert: function(msg, okhandler) {
        new Promise((resolve, reject) => {
            $("#msg_popup #btn_confirm").hide();
            $("#msg_popup #btn_alert").show();
            
            $("#msg_popup #alert_ok").unbind();
            $("#msg_popup .modal-body").html(msg);
            $('#msg_popup').modal('show');

            $("#msg_popup #alert_ok").click(function() {
                $('#msg_popup').modal('hide');
            });

            $("#msg_popup").on("hidden.bs.modal", function(e) {
                e.stopPropagation();
                if(okhandler != null) resolve();
                else reject();
            });
        }).then(okhandler).catch(function() {});
    },

    /* Confirm */
    Confirm: function(msg, yeshandler, nohandler) {
        new Promise((resolve, reject) => {
            var flag = false;
            $("#msg_popup #btn_alert").hide();
            $("#msg_popup #btn_confirm").show();
            
            $("#msg_popup #confirm_yes").unbind();
            $("#msg_popup #confirm_no").unbind();
            $("#msg_popup .modal-body").html(msg);
            $('#msg_popup').modal('show');

            $('#msg_popup').on('keypress', function (e) {
                var keycode = (e.keyCode ? e.keyCode : e.which);
                if(keycode == '13') {
                    flag = true;
                    $('#msg_popup').modal('hide');
                }
            });

            $("#msg_popup #confirm_yes").click(function() {
                flag = true;
            });
            $("#msg_popup #confirm_no").click(function() {
                flag = false;
            });

            $("#msg_popup").on("hidden.bs.modal", function(e) {
                e.stopPropagation();
                if(yeshandler != null && flag == true) resolve(1); 
                else if(nohandler != null && flag == false) resolve(2);
                else reject();
            });

        }).then(function(value) {
            if(value == 1)      yeshandler();
            else if(value == 2) nohandler();
        }).catch(function() {});
    },
}