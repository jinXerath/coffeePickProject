/*!
    * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2023 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});

/**
 * 관리자키 하이픈 생성
 */
function adminKeyHyphenFormat(obj) {
    obj.value = keyHyphen(unhyphen(obj.value));
}
/**
 * 전화번호 하이픈 생성
 */
function phoneHyphenFormat(obj) {
    obj.value = phoneHyphen(unhyphen(obj.value));
}
/**
 * 관리자키(4자리씩)에 맞춰 하이픈(-)을 만들어준다.
 */
function keyHyphen(str) {
    str = String(str);
    return str.replace(/(\w)(?=(?:\w{4})+(?!\w))/g, '$1-');
}

/**
 * 전화번호 형식에 맞춰 하이픈(-)을 저절로 삽입해준다.
 */
function phoneHyphen(str) {
	str = String(str);
	return str.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
/**
 * 하이픈(-)을 지워주는 함수이다.
 * 알파벳 + 숫자 + _ 만 남길 수 있다.
 */
function unhyphen(str) {
    str = String(str);
    return str.replace(/[^\w]+/g, '');
}


function openHint(item, color, msg){
	$(item).css('visibility', 'visible');
	$(item).css('color', color);
	$(item + ' span').text(msg);
}