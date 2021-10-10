<%@ page import="vo.Product" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Eleano</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/googleapis.css">
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/animate.compat.css">
    <link rel="stylesheet" href="video-js-7.9.7/video-js.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">

    </style>
</head>
<body>

<div class="site-wrap">
<%--    the container of customer services Robot--%>
    <div class="container">
        <div class="chat-box-nonactive animate__animated animate__bounce ">
            <div class="col-12 py-1 px-0 d-flex justify-content-center align-items-center" style="height: 100%;">
                <a class="chat-box-toggle">
                    <i class="icon-wechat"></i>
                    <p class="text-center" style="font-size: x-small">chat with us</p>
                </a>
            </div>
            <div class="col-12">
                <div class="display-box mt-3">
                    <div class="piano"></div>
                    <iframe width="100%" style="height: calc(100% - 120px)" frameborder="0" src="http://127.0.0.1:5000/">
                        <p>error</p>
                    </iframe>
                </div>
            </div>
        </div>
    </div>
<%--    the head of index--%>
    <header class="site-navbar" role="banner" style="position: -webkit-sticky; position: sticky;top: 0;">
        <div class="site-navbar-top" style="max-height: 140px;">
            <div class="eleano-logo">
                <img src="images/34726261d0341082630a16ab89681d0.jpg" alt="LOGO" height="140"/>
            </div>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-4 col-md-4 order-2 order-md-1 site-search-icon text-left">
                        <form action="./search" method="get" class="site-block-top-search">
                            <span class="icon icon-search2"></span>
                            <input type="text" id="ProductName" name="ProductName" class="form-control border-0"
                                   placeholder="Search">
                        </form>
                    </div>
                    <div class="col-4 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                        <div class="site-logo wow swing" data-wow-duration="1s" data-wow-iteration="infinite"
                             data-wow-delay="0s"
                             data-wow-offset="10">
                            <a href="index.jsp" class="js-logo-clone">Eleano</a>
                        </div>
                    </div>
                    <div class="col-2 col-md-2 order-3 order-md-3 text-right">
                        <div class="site-top-icons">
                            <ul>
                                <li><a href="./checkcart" class="site-cart"> <span
                                        class="icon icon-shopping_cart"></span>
                                </a></li>
                                <li><a href="#" class="site-menu-toggle js-menu-toggle"><span
                                        class="icon icon-menu"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <%
                        String username = (String) session.getAttribute("UserID");
                        String nickname = (String) session.getAttribute("NickName");
                        String S = request.getRequestURI();
                        out.write("<div class='col-2 col-md-2 order-4 order-md-4 text-center'>");
                        if (username == null) {
                            out.write("<a href='login.jsp'>Login</a>");
                        } else {
                            out.write("<nav class='site-navigation' role='navigation'>\n");
                            out.write("<ul class='site-menu js-clone-nav d-none d-md-block'>\n");
                            out.write("<li class='has-children active'>\n");
                            out.write("<a href='#' style='height: 100px'>\n");
                            out.write("<div class='circle ml-0 ' style='-webkit-box-shadow:0px 6px 6px #fca2ca ;-moz-box-shadow:0px 6px 6px #fca2ca ;box-shadow:0px 6px 6px #fca2ca;'>\n");
                            out.write("<div class='mt-2 pt-1'>\n");
                            out.write("<p class='text-center ' style='color: white; font-weight: 800;font-size:xx-large;'>" + nickname.charAt(0) + "</p>");
                            out.write("</div></div></a>\n");
                            out.write("<ul class='dropdown'");
                            out.write("style='background-color: rgb(255,255,255); width: 320px;overflow: hidden; -webkit-box-shadow:0px 6px 6px #c8c8c8 ;-moz-box-shadow:0px 6px 6px #c8c8c8 ;box-shadow:0px 6px 6px #c8c8c8;'>\n");
                            out.write("<li>\n");
                            out.write("<div style='margin-top: 16px;border-bottom: 1px solid rgb(191,187,187);'>\n");
                            out.write("<div style='text-align: center'>\n");
                            out.write("<a href='#'>\n");
                            out.write("<i class='icon icon-user-circle'></i>\n");
                            out.write("<p style='color: #bfbbbb; text-align: center;line-height: 36px;font-size: 15px;'>" + nickname + "</p>\n");
                            out.write("</a></div></div></li>\n");
                            out.write("<li>\n");
                            out.write("<div class='row ml-1 mr-1 mt-1' style='border-bottom: 1px dashed rgb(191,187,187);'>\n");
                            out.write("<div class='col-md-6 text-center grid' style='border-right: 1px dashed rgb(191,187,187);'>\n");
                            out.write("<a href='./userDetail.jsp'>\n");
                            out.write("<i class='icon icon-person' style='font-size: 25px;line-height: 45px;'></i>\n");
                            out.write("<p class='mt-1 mb-2' style='font-size: 12px;'>Account management</p>\n");
                            out.write("</a></div>\n");
                            out.write("<div class='col-md-6 text-center grid'>\n");
                            out.write("<a href='showorderlist'>\n");
                            out.write("<i class='icon icon-th-list' style='font-size: 25px;line-height: 45px;'></i>\n");
                            out.write("<p class='mt-1 mb-2' style='font-size: 12px;'>Order management</p>\n");
                            out.write("</a></div></div></li>\n");
                            out.write("<li>\n");
                            out.write("<div class='row ml-1 mr-1 mt-1'>\n");
                            out.write("<div class='col-md-6 text-center' style='border-right: 1px dashed rgb(191,187,187);'>\n");
                            out.write("<a href='#'>\n");
                            out.write("<i class='icon icon-key' style='font-size: 25px;line-height: 45px;'></i>\n");
                            out.write("<p class='mt-1' style='font-size: 12px;'>Password management</p>\n");
                            out.write("</a></div>\n");
                            out.write("<div class='col-md-6 text-center grid'>\n");
                            out.write("<a href='#'>\n");
                            out.write("<i class='icon icon-cog' style='font-size: 25px;line-height: 45px;'></i>\n");
                            out.write("<p class='mt-1' style='font-size: 12px;'>Support center</p>\n");
                            out.write("</a></div></div></li>\n");
                            out.write("<li>\n");
                            out.write("<a href='./logout?Logout=" + S + "'>\n");
                            out.write("<div class='row justify-content-center grid' style='background-color: #2c7ecd;'>\n");
                            out.write("<div class='text-center p-2 m-0' style='color: white'>\n");
                            out.write("<i class='icon icon-sign-out'></i> Exit the Account\n");
                            out.write("</div></div></a></li></ul></li></ul></nav>\n");


                        }
                        out.write("</div>");
                    %>
                </div>
            </div>
        </div>
<%--    navigation bar in the head--%>
        <nav class="site-navigation text-right text-md-center" role="navigation">
            <div class="container">
                <ul class="site-menu js-clone-nav d-none d-md-block">
                    <li class="active"><a href="index.jsp">Home</a>
                    </li>
                    <li><a href="about.jsp">About</a>
                    </li>
                    <li><a href="./productlist">Shop</a></li>
                </ul>
            </div>
        </nav>
    </header>
<%--    welcome page title--%>
    <div class="site-blocks-cover"
         style="background-image: url('images/elec_organ2.jpg'); opacity: 1.0; filter: alpha(opacity = 100);"
         data-aos="fade">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-6"></div>
                <div class="col-lg-12 col-md-12 welcome-title text-lg-center text-md-center pt-4">
                    <div class="title-text wow pulse animated" data-wow-duration="4s" data-wow-iteration="infinite"
                         data-wow-delay="0.3s" data-wow-offset="10">
                        <div>
                            <h1 style="color: black">Find the electronic organ that
                                suits you best</h1>
                        </div>
                        <div class="intro-text">
                            <h3 style="color: whitesmoke">&nbsp;The pation of
                                electrionic music just in Havana</h3>
                        </div>
                    </div>
                </div>
                <div class="text-center col-lg-4 pt-mb-4">
                    <a href="./productlist" class="btn btn-lg btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section site-section-sm site-blocks-1" style="margin-bottom: 10px;" id="promise">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7 site-section-heading text-center pt-4">
                    <h2>Our promise&nbsp;</h2>
                    <br/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4 wow slideInLeft">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-truck"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Free Shipping</h2>
                        <p>The price of ship will be reduce even free as long as you
                            can reach sales</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4 wow slideInLeft">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-refresh2"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Free Returns</h2>
                        <p>If there is any quality problem you can return it and the
                            postage will be provided as long as we ensure it is true</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4 wow slideInLeft">
                    <div class="icon mr-4 align-self-start">
                        <span class="icon-help"></span>
                    </div>
                    <div class="text">
                        <h2 class="text-uppercase">Customer Support</h2>
                        <p>If there is any broken of your device, we also provide
                            considerate maintenance service, but the cost of maintenance is
                            your responsibility</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section site-blocks-2" id="Collection">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>Collections&nbsp;</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-6 mb-5 mb-lg-0 wow fadeIn">
                    <a class="block-2-item" href="#">
                        <div class="image scrol">
                            <img src="images/portable_organ.jpg" alt="" class="img-fluid center-block">
                        </div>
                        <div class="text">
                            <span class="text-uppercase">Collections</span>
                            <h5>
                                <font color="#F3F8F2">Poratable Organ</font>
                            </h5>
                        </div>
                    </a>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-6 mb-5 mb-lg-0 wow fadeIn">
                    <a class="block-2-item" href="#">
                        <div class="image">
                            <img src="images/piano.jpg" alt="" class="img-fluid center-block">
                        </div>
                        <div class="text">
                            <span class="text-uppercase">Collections</span>
                            <h5>
                                <font color="#F3F8F2">Electric Piano</font>
                            </h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section block-3 site-blocks-2 bg-light" id="Feature_product">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>Featured Products</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="nonloop-block-3 owl-carousel">

                        <%
                            List<Product> productList = (List<Product>) application.getAttribute("IndexProduct");
                            for (int i = 0; i < productList.size(); i++) {
                                Product product = productList.get(i);
                                out.write("<div class='item'>");
                                out.write("<div class='block-4 text-center'>");
                                out.write("<div class='d-flex justify-content-center align-items-center' style='height: 300px; border-bottom:3px dashed rgb(150,150,150)'><img style='max-height:100%; max-width:100% ;height:auto; width:auto; display:inline-block' src='images/"+product.getIid()+".jpg' alt='Image placeholder'>");
                                out.write("</div>");
                                out.write("<div class='block-4-text p-4'>");
                                out.write("<h3><a href='./product?productID="+product.getIid()+"'>"+product.getName()+"</a></h3>");
                                out.write("<p class='mb-0'>Finding perfect electronic organ</p>");
                                out.write("<p class='text-primary font-weight-bold'>"+"$ "+product.getPrice()+"</p>");
                                out.write("</div>");
                                out.write("</div>");
                                out.write("</div>");
                            }

                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section block-8">
        <div class="container">
            <div class="row justify-content-center  mb-5">
                <div class="col-md-7 site-section-heading text-center pt-4">
                    <h2>On Sale!</h2>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col-md-12 col-lg-7 mb-5 wow bounceInLeft" data-wow-duration="1s" data-wow-delay="0.2s"
                     data-wow-offset="10">
                    <a href="#"><img src="images/Live.jpg" alt="Image placeholder" class="img-fluid rounded"></a>
                </div>
                <div class="col-md-12 col-lg-5 text-center pl-md-5">
                    <h2>
                        <a href="#">20% less in all items</a>
                    </h2>
                    <p>Price and economic conditions should not be the reason to
                        stop us from enjoying music and releasing our passion</p>
                    <p>
                        <a href="./productlist" class="btn btn-primary btn-sm wow bounceInRight" data-wow-duration="1s"
                           data-wow-delay="0.2s"
                           data-wow-offset="10">Shop Now</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-10 offset-1 d-flex justify-content-center">
            <video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" width="1000" height="600" poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
                <source src="video/123.mp4" type="video/mp4" />
                <p class="vjs-no-js">
                    To view this video please enable JavaScript, and consider upgrading to a
                    web browser that
                    <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                </p>
            </video>
        </div>
    </div>
<%--    copyright--%>
    <footer class="site-footer border-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-5 mb-lg-0 wow bounceInLeft" data-wow-duration="1s" data-wow-dalay="0.2s"
                     data-wow-offset="10">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="footer-heading mb-4">Navigations</h3>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="./signUp.jsp">Sign up</a></li>
                                <li><a href="tencent://message/?uin=1043843535&Site=&Menu=yes">
                                    Contact us by QQ</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="./productlist">Shop</a></li>
                                <li><a href="./checkcart">Shopping cart</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2 mb-4 mb-lg-0 wow bounceInUp" data-wow-duration="1s" data-wow-dalay="0.2s"
                     data-wow-offset="10">
                    <h3 class="footer-heading mb-4">Promo</h3>
                    <a href="#" class="block-6"> <img src="images/elec_organ.jpg" alt="Image placeholder"
                                                      class="img-fluid rounded mb-4">
                        <h3 class="font-weight-light  mb-0">Finding Your Perfect
                            Electironic organ</h3>
                    </a>
                </div>
                <div class="col-md-6 col-lg-4 wow bounceInRight" data-wow-duration="1s" data-wow-dalay="0.2s"
                     data-wow-offset="10">
                    <div class="block-5 mb-5">
                        <h3 class="footer-heading mb-4">Contact Info</h3>
                        <ul class="list-unstyled">
                            <li class="address">Shahe Beijing</li>
                            <li class="phone"><a href="tel://23923929210">+86
                                13269111120</a></li>
                            <li class="email">qixiaojian00310@163.com</li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="row pt-5 mt-5 text-center">
                <div class="col-md-12">
                    <p>
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        2020 All rights reserved | This site is made with <i class="icon-heart-o"
                                                                             aria-hidden="true"></i>
                    </p>
                </div>
            </div>
        </div>
    </footer>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/wow.min.js"></script>
<script type="text/javascript" src="wangeditor/dist/wangEditor.min.js"></script>
<script type="text/javascript" src="video-js-7.9.7/video.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript" src="js/advertisement.js"></script>
</body>
</html>
