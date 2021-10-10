<%@ page import="vo.CartProduct" %>
<%@ page import="java.util.List" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>CheckOut</title>
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
            <div class="col-md-12 mb-0"><a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a href="cart.jsp">Cart</a>
              <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
          </div>
        </div>
      </div>

      <div class="site-section">
        <div class="container">
          <form action="./order" method="post">
          <div class="row">
            <div class="col-md-6 mb-5 mb-md-0">
              <h2 class="h3 mb-3 text-black">Billing Details</h2>
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="c_fname" class="text-black">First Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="c_fname" name="c_fname">
                  </div>
                  <div class="col-md-6">
                    <label for="c_lname" class="text-black">Last Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="c_lname" name="c_lname">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="c_address" name="c_address" placeholder="Street address">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="c_phone" class="text-black">Phone Number <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="c_phone" name="c_phone">
                  </div>
                </div>

              </div>
            </div>
            <div class="col-md-6">
              <div class="row mb-5">
                <div class="col-md-12">
                  <h2 class="h3 mb-3 text-black">Your Order</h2>
                  <div class="p-3 p-lg-5 border">
                    <table class="table site-block-order-table mb-5">
                      <thead>
                        <th>Product</th>
                        <th>Total</th>
                      </thead>
                      <tbody>
                      <%int price = 0;
                        if ((Integer) session.getAttribute("IsSingleOrder") == 1){
                          CartProduct product = (CartProduct) session.getAttribute("singleCP");
                          out.write("<tr>");
                          out.write("<td>"+product.getIname()+"<strong class='mx-2'>x</strong>"+product.getNum()+"</td>");
                          out.write("<td>"+product.getNum()*product.getIprice()+"</td>");
                          out.write("</tr>");
                          price+=product.getNum()*product.getIprice();
                        }else{
                          List<CartProduct> productList = (List<CartProduct>) session.getAttribute("cartList");

                          for (CartProduct product : productList){
                            out.write("<tr>");
                            out.write("<td>"+product.getIname()+"<strong class='mx-2'>x</strong>"+product.getNum()+"</td>");
                            out.write("<td>"+product.getNum()*product.getIprice()+"</td>");
                            out.write("</tr>");
                            price+=product.getNum()*product.getIprice();
                          }
                        }
                        out.write("<tr>");
                        out.write("<td class='text-black font-weight-bold'><strong>Order Total</strong></td>");
                        out.write("<td class='text-black font-weight-bold'><strong>"+price+"</strong></td>");
                        out.write("</tr>");
                        session.setAttribute("c_price",price);
                      %>
                      </tbody>
                    </table>

                    <div class="border p-3 mb-3">
                      <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button"
                          aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>

                      <div class="collapse" id="collapsebank">
                        <div class="py-2">
                          <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as
                            the payment reference. Your order won’t be shipped until the funds have cleared in our
                            account.</p>
                        </div>
                      </div>
                    </div>

                    <div class="border p-3 mb-3">
                      <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsecheque" role="button"
                          aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>

                      <div class="collapse" id="collapsecheque">
                        <div class="py-2">
                          <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as
                            the payment reference. Your order won’t be shipped until the funds have cleared in our
                            account.</p>
                        </div>
                      </div>
                    </div>

                    <div class="border p-3 mb-5">
                      <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button"
                          aria-expanded="false" aria-controls="collapsepaypal">Alipay&nbsp;</a></h3>

                      <div class="collapse" id="collapsepaypal">
                        <div class="py-2">
                          <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as
                            the payment reference. Your order won't be shipped until the funds have cleared in our
                            account.</p>
                        </div>
                      </div>
                    </div>

                    <div class="form-group">
                      <input type="submit" class="btn btn-primary btn-lg py-3 btn-block" value="Place
                        Order">
                    </div>

                  </div>
                </div>
              </div>

            </div>
          </div>
          </form>
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
