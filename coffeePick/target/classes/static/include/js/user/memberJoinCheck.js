// 유효성 체크 상태
let id_status = 0;
let pw_status = 0;
let pw_chk_status = 0;
let name_status = 0;
let phone_status = 0;
let email_status = 0;
let key_status = 0;


//아이디 글자제한 체크
function idChkData(item) {
    const value = $(item).val().replace(/\s/g, "");
    const regex = /^[a-zA-Z0-9]{4,15}$/; // 영문 대소문자 또는 숫자로 이루어진 4~15자리

    if (!regex.test(value)) {
        return false;
    }

    if (value == "") {
        $(item).val("");
        $(item).focus();
        return false;
    } else {
        return true;
    }

}

  
//비밀번호체크  영문대소문자랑 숫자 혼합해서 6~15자 
function pwChkData(item){
    const value = $(item).val();
    const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,15}$/;

    if (!regex.test(value)) {
        return false;
    } else {
        return true;
    }
}
//닉네임 글자제한 체크
function nickNameChkData(item){
    var nickName = $(item).val();
    var regExp = /^[a-zA-Z가-힣]{2,8}$/; // 영문 대소문자 또는 한글, 2자 이상 8자 이하

    if (!regExp.test(nickName)) {
        return false;
    } else {
        return true;
    }
}

