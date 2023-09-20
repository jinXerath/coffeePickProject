function chkData(item, msg) {
	if($(item).val().replace(/\s/g,"")=="") {
		alert(msg+" 입력해 주세요.");
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
	}else{
		return true;
	}
}