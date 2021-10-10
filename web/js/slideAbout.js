var mySwiper = new Swiper('.swiper-container', {
    loop: true, // ??????
    mousewheel: true,
    autoplay:{
        delay: 3000,
        stopOnLastSlide: false,
        disableOnInteraction: true,
    },
    // ???????
    pagination: {
        el: '.swiper-pagination',
        type: 'progressbar'
    },

    // ??????????
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },

    // ???????
    scrollbar: {
        el: '.swiper-scrollbar',

    },
});
$(document).ready(function (){
    var height = $("#aboutBackground").height()+"px";
    $(".swiper-container").css("height",height);
})