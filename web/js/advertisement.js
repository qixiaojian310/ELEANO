// the init of advertisement video init
var player = videojs('my-video', {
    loop: true,
    // controls: false
});
$(document).ready(function () {
    var windowHeight, scrollHeight, topHeight;
    windowHeight = $(window).height();    //window's height
    var group = $("#my-video");
    $(window).scroll(function () {
        scrollHeight = $(this).scrollTop();   //scroll height
        topHeight = group.offset().top;    //the height of scrollbar to the top
        if (windowHeight + scrollHeight > topHeight) {
            player.play();
        } else {
            player.pause();
        }
    });
});