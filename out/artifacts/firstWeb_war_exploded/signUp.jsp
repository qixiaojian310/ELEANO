<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>SignUp</title>
    <meta charset="utf-8">
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

</head>
<body>

<div class="site-wrap">
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
                        <div class='col-2 col-md-2 order-4 order-md-4 text-center'>
                        <a href='login.jsp'>Login</a>
                        </div>
                </div>
            </div>
        </div>

        <nav class="site-navigation text-right text-md-center" role="navigation">
            <div class="container">
                <ul class="site-menu js-clone-nav d-none d-md-block">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li><a href="about.jsp">About</a>
                    </li>
                    <li><a href="./productlist">Shop</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Sign Up</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-3 text-black">Sign Up</h2>
                </div>
                <div class="col-md-7">

                    <form onsubmit="return checkForm()" action="./signUp" method="post">

                        <div class="p-3 p-lg-5 border">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="UserID" class="text-black">User ID <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" oninput = "value=value.replace(/[^\d]/g,'')"
                                          onblur="checkForm()"  id="UserID" name="UserID" placeholder="Enter your pure numeric ID">
                                    <div class="invalid-feedback" id="username-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="UserName" class="text-black">User NickName <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control"
                                           onblur="checkForm()" id="UserName" name="UserName" placeholder="Enter your NickName">
                                    <div class="invalid-feedback" id="nickname-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="UserPassword" class="text-black">Password <span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" id="UserPassword" name="UserPassword"
                                           onblur="checkForm()" placeholder="Type your password">
                                    <div class="invalid-feedback" id="userpswd1-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="UserPasswordCon" class="text-black">Password Confirm<span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" id="UserPasswordCon" name="UserPasswordCon"
                                           onblur="checkForm()" placeholder="Type your password again">
                                    <div class="invalid-feedback" id="userpswd2-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="UserPhone" class="text-black">Phone Number<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="UserPhone" oninput = "value=value.replace(/[^\d]/g,'')" name="UserPhone"
                                           onblur="checkForm()" placeholder="Type your phone number">
                                    <div class="invalid-feedback" id="userphone-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="UserEmail" class="text-black">E-mail<span class="text-danger">*</span></label>
                                    <input type="email" class="form-control" id="UserEmail" name="UserEmail"
                                           onblur="checkForm()" placeholder="Type your Email address">
                                    <div class="invalid-feedback" id="useremail-feedback"></div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Sign Up">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

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

<script src="js/SignUpValidate.js"></script> // js about validate message.


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


</body>
</html>
