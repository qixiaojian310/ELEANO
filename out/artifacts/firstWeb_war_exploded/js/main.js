//init the plugin
AOS.init({
    duration: 800,
    easing: 'slide',
    once: true
});

// init the plugin of wow.js
$(function () {
    new WOW().init();
})

jQuery(document).ready(function ($) {

    "use strict";

    // init the slide of .nonloop-block-3
    var slider = function () {
        $('.nonloop-block-3').owlCarousel({
            center: false,
            items: 1,
            loop: false,
            stagePadding: 15,
            margin: 20,
            nav: true,
            navText: ['<span class="icon-arrow_back">', '<span class="icon-arrow_forward">'],
            responsive: {
                600: {
                    margin: 20,
                    items: 2
                },
                1000: {
                    margin: 20,
                    items: 3
                },
                1200: {
                    margin: 20,
                    items: 3
                }
            }
        });
    };
    slider();

    // the map of side bar and the main menu
    var siteMenuClone = function () {

        $('<div class="site-mobile-menu"></div>').prependTo('.site-wrap');

        $('<div class="site-mobile-menu-header"></div>').prependTo('.site-mobile-menu');
        $('<div class="site-mobile-menu-close "></div>').prependTo('.site-mobile-menu-header');
        $('<div class="site-mobile-menu-logo"></div>').prependTo('.site-mobile-menu-header');

        $('<div class="site-mobile-menu-body"></div>').appendTo('.site-mobile-menu');


        $('.js-logo-clone').clone().appendTo('.site-mobile-menu-logo');

        $('<span class="ion-ios-close js-menu-toggle"></div>').prependTo('.site-mobile-menu-close');


        $('.js-clone-nav').each(function () {
            var $this = $(this);
            $this.clone().attr('class', 'site-nav-wrap').appendTo('.site-mobile-menu-body');
        });

        // render content of sidebar
        setTimeout(function () {

            var counter = 0;
            $('.site-mobile-menu .has-children').each(function () {
                var $this = $(this);

                $this.prepend('<span class="arrow-collapse collapsed">');

                $this.find('.arrow-collapse').attr({
                    'data-toggle': 'collapse',
                    'data-target': '#collapseItem' + counter,
                });

                $this.find('> ul').attr({
                    'class': 'collapse',
                    'id': 'collapseItem' + counter,
                });

                counter++;

            });

        }, 1000);

        //add the event of arrow to toggle the dropdown menu
        $('body').on('click', '.arrow-collapse', function (e) {
            var $this = $(this);
            if ($this.closest('li').find('.collapse').hasClass('show')) {
                $this.removeClass('active');
            } else {
                $this.addClass('active');
            }
            e.preventDefault();

        });
        //to ensure the appearance for different divise
        $(window).resize(function () {
            var $this = $(this),
                w = $this.width();

            if (w > 768) {
                if ($('body').hasClass('offcanvas-menu')) {
                    $('body').removeClass('offcanvas-menu');
                }
            }
        })

        $('body').on('click', '.js-menu-toggle', function (e) {
            var $this = $(this);
            e.preventDefault();

            if ($('body').hasClass('offcanvas-menu')) {
                $('body').removeClass('offcanvas-menu');
                $this.removeClass('active');
            } else {
                $('body').addClass('offcanvas-menu');
                $this.addClass('active');
            }
        })

        // click outisde offcanvas
        $(document).mouseup(function (e) {
            var container = $(".site-mobile-menu");
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                if ($('body').hasClass('offcanvas-menu')) {
                    $('body').removeClass('offcanvas-menu');
                }
            }
        });
    };
    siteMenuClone();


    var sitePlusMinus = function () {
        $('.js-btn-minus').on('click', function (e) {
            e.preventDefault();
            if ($(this).closest('.input-group').find('.form-control').val() != 0) {
                $(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) - 1);
            } else {
                $(this).closest('.input-group').find('.form-control').val(parseInt(0));
            }
        });
        $('.js-btn-plus').on('click', function (e) {
            e.preventDefault();
            $(this).closest('.input-group').find('.form-control').val(parseInt($(this).closest('.input-group').find('.form-control').val()) + 1);
        });
    };
    sitePlusMinus();

    //init the price slider range in the shop.jsp
    var siteSliderRange = function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 500,
            values: [75, 300],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) +
            " - $" + $("#slider-range").slider("values", 1));
    };
    siteSliderRange();


    var siteMagnificPopup = function () {
        $('.image-popup').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            closeBtnInside: false,
            fixedContentPos: true,
            mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
            gallery: {
                enabled: true,
                navigateByImgClick: true,
                preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
            },
            image: {
                verticalFit: true
            },
            zoom: {
                enabled: true,
                duration: 300 // don't foget to change the duration also in CSS
            }
        });

        $('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,

            fixedContentPos: false
        });
    };
    siteMagnificPopup();
});

function ClickcartNum(pid) {
    if (pid > 0) {
        var a = parseInt(document.getElementById("cartNum" + pid).value) + 1;
        var b = parseInt(document.getElementById("cartPrice" + pid).innerText);
        var c = document.getElementById("cartTotal" + pid);
        var d = a * b;
        c.innerText = d;
        CartNumToDBP(pid);
    } else {
        var a = parseInt(document.getElementById("cartNum" + Math.abs(pid)).value) - 1;
        var b = parseInt(document.getElementById("cartPrice" + Math.abs(pid)).innerText);
        var c = document.getElementById("cartTotal" + Math.abs(pid));
        var d = a * b;
        c.innerText = d;
        CartNumToDBN(Math.abs(pid));
    }
};
function CartNumToDB(pid){
    //get the content of userID
    $.ajax({
        type : "get",
        url : "./CartNumToDB",
        async : false,
        data:{'UserID':$("#UserID").val(),'ProductID':pid,'ProductNum':$("#cartNum"+pid).val()},
        success : function(result){
        }
    });
}
function CartNumToDBN(pid){
    //get the content of userID
    $.ajax({
        type : "get",
        url : "./CartNumToDB",
        async : false,
        data:{'UserID':$("#UserID").val(),'ProductID':pid,'ProductNum':Number($("#cartNum"+pid).val())-Number(1)},
        success : function(result){
        }
    });
}
function CartNumToDBP(pid){
    //get the content of userID
    $.ajax({
        type : "get",
        url : "./CartNumToDB",
        async : false,
        data:{'UserID':$("#UserID").val(),'ProductID':pid,'ProductNum':Number($("#cartNum"+pid).val())+Number(1)},
        success : function(result){
        }
    });
}
// init the chatbox of website and these code is integrate in the Robot
var chatBoxHeight = $(".chat-box-nonactive").height();
const E = window.wangEditor;
const editor = new E('#div1');
editor.config.height = chatBoxHeight * 0.3;
editor.config.menus = [
    'bold',
    'head',
    'link',
    'italic',
    'underline'
]
$('#send').click(function () {
    var html = editor.txt.html();
    var appendHtml = "<div class=\"col-12 d-flex justify-content-end\"><div class=\"bubble-me\">" + html + "</div></div>"
    var appendHtmlSite = "<div class=\"col-12 d-flex justify-content-start\"><div class=\"bubble-site\"><p>WELCOME</p></div></div>"
    $(".display-box").children("iframe").contents().find("body").append(appendHtml);
    $(".display-box").children("iframe").contents().find("body").append(appendHtmlSite);
    editor.txt.clear();
})

editor.create();
var chatBoxHeightString = chatBoxHeight * 1.4 + "px";
$(".display-box").css({"height": chatBoxHeightString});
//init the windows of robot
$(document).ready(function () {

    var chatBoxFlag = true
    $(".chat-box-toggle").click(function () {
        if (chatBoxFlag == true) {
            $(".chat-box-nonactive").css("animation", "myBounceIn 1s ease-out");
            setTimeout(function () {
                $(".chat-box-nonactive").css({
                    "width": "50%",
                    "margin-left": "-25%",
                    "left": "50%",
                    "height": "80%",
                    "margin-bottom": "-20%"
                });

            }, 1000);
            setTimeout(function () {
                $(".editor-box").show(200);
                $(".display-box").show(200);
                $("#send").show(200);
                var displayWidth=$(".display-box").width();
                $(":root").css("--width",displayWidth+"px");
                setTimeout(function () {
                    $(".piano").show();
                },200);
            }, 800);
            chatBoxFlag = false;
            $(".chat-box-toggle").parent().removeClass("justify-content-center").removeClass("align-items-center").addClass("justify-content-end").css({"height": "auto"});
            $(".chat-box-toggle").html("<i class=\"icon-close2\"></i>");
            $(".chat-box-toggle").css({"flex-direction": "row", "align-items": "center", "justify-content": "end"});

        } else {
            // let the robot to the non-active
            $(".chat-box-nonactive").css("animation", "myBounceOut 1s ease");
            setTimeout(function () {
                //render the chatbox after animation
                $(".chat-box-nonactive").css({
                    "width": "5%",
                    "margin-left": "0%",
                    "left": "0%",
                    "height": "50%",
                    "margin-bottom": "-12.5%"
                });
                setTimeout(function () {
                    $(".piano").hide();
                },200);
            }, 1000);
            chatBoxFlag = true
            $(".editor-box").hide();
            $(".display-box").hide();
            $("#send").hide();
            $(".chat-box-toggle").parent().addClass("justify-content-center").addClass("align-items-center").removeClass("justify-content-end").css({"height": "100%"});
            $(".chat-box-toggle").html("<i class=\"icon-wechat\"></i><p class=\"text-center\" style=\"font-size: x-small\">chat with us</p>");
            $(".chat-box-toggle").css({
                "flex-direction": "column",
                "align-items": "center",
                "justify-content": "center"
            });
        }
    });
});




