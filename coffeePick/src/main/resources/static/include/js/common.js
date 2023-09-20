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


function chkFile(item){
	
	let ext=item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext,['gif','png','jpg','jpeg'])==-1){
		alert('gif,png,jpg,jpeg 파일만 업로드 할 수 있습니다.');
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