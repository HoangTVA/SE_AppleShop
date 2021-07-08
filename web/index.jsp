<%-- 
    Document   : index
    Created on : Jul 5, 2021, 10:52:09 AM
    Author     : anime
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SE15 Shop | Homepage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!--Less styles -->
        <!-- Other Less css file //different less files has different color scheam
            <link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
            <link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
            <link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
        -->
        <!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
            <script src="themes/js/less.js" type="text/javascript"></script> -->

        <!-- Bootstrap style -->
        <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen" />
        <link href="themes/css/base.css" rel="stylesheet" media="screen" />
        <!-- Bootstrap style responsive -->
        <link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->
        <link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="themes/images/ico/apple.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple.png">
        <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple.png">
        <style type="text/css" id="enject"></style>
    </head>

    <body>
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <div class="span6">Welcome!
                        <c:choose>
                            <c:when test="${sessionScope.USER != null}">
                                <strong>${USER.name}</strong>
                            </c:when>
                            <c:otherwise>
                                <strong> User</strong>
                            </c:otherwise>
                        </c:choose></div>
                    <div class="span6">
                        <div class="pull-right">
                            <c:forEach var="cartItem" items="${sessionScope.cart}">
                                <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                            </c:forEach>
                            <a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> ${subtotal} Itemes in your cart </span> </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Navbar ================================================== -->
            <div id="logoArea" class="navbar">
                <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-inner">
                    <a class="brand" href="index.jsp">SE15 Shop</a>
                    <form class="form-inline navbar-search" method="post" action="products.html">
                        <input id="srchFld" class="srchTxt" type="text" />
                        <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                    </form>
                    <ul id="topMenu" class="nav pull-right">
                        <li class=""><a href="ViewProductController">All Products</a></li>
                        <li class=""><a href="contact.jsp">Contact</a></li>
                        <li class=""><a href="user_profile.jsp">Profile</a></li>
                        <li class="">
                            <a href="signupForm.jsp" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Signup</span></a>
                        </li>
                       <li class="">
                            <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
                            <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3>Login In</h3>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal loginFrm" action="MainController" method="post">
                                        <div class="control-group">
                                            <input type="text" id="inputEmail" placeholder="Enter Email" name="uname" required>
                                        </div>
                                        <div class="control-group">
                                            <input type="password" id="inputPassword" placeholder="Enter Password" name="psw" required>
                                        </div>
                                        <div class="control-group">
                                            <label class="checkbox">
											<input type="checkbox"> Remember me
											</label>
                                            <div class="g-signin2" data-onsuccess="onSignIn"></div>
                                            <button type="submit" class="btn btn-success" name="action" value="Login">Sign in</button>
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Header End====================================================================== -->
        <div id="carouselBlk">
            <div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="container">
                            <a href="signupForm.jsp"><img style="width:100%" src="themes/images/carousel/1.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="signupForm.jsp"><img style="width:100%" src="themes/images/carousel/2.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="signupForm.jsp"><img src="themes/images/carousel/3.png" alt="" /></a>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <div id="sidebar" class="span3">
                        <div class="well well-small">
                            <a id="myCart" href="product_summary.html"><img src="themes/images/ico-cart.png" alt="cart">3 Items in your cart <span class="badge badge-warning pull-right">445,000VND</span></a>
                        </div>
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li><a href="ViewProductController">All</a></li>
                        <li><a href="ViewProductController?categoryID=IP&status=True">iPhone</a></li>
                        <li><a href="ViewProductController?categoryID=ID&status=True">iPad</a></li>
                        <li><a href="ViewProductController?categoryID=MB&status=True">Mac</a></li>
                        <li><a href="ViewProductController?categoryID=AW&status=True">Apple Watch</a></li>
                        <li><a href="ViewProductController?categoryID=AS&status=True">Accessory</a></li>
                        </ul>
                        <br/>
                    </div>
                    <!-- Sidebar end=============================================== -->
                    <div class="span9">
                        <div class="well well-small">
                            <h4>Featured Products <small class="pull-right">200+ featured products</small></h4>
                            <div class="row-fluid">
                                <div id="featured" class="carousel slide">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <i class="tag"></i>
                                                        <a href="product_details.html"><img src="themes/images/products/5.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4 style="font-size: small;"><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">115,000,000 VND</span></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                           <!--random 4 san pham -->
                                        </ul>
                                    </div>

                                        <div class="item">
                                            <ul class="thumbnails">
                                                <li class="span3">
                                                    <div class="thumbnail">
                                                        <a href="product_details.html"><img src="themes/images/products/2.jpg" alt=""></a>
                                                        <div class="caption">
                                                            <h5>Product name</h5>
                                                            <h4 style="font-size: small;"><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">115,000,000 VND</span></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <!--random 4 san pham -->
                                        </ul>
                                    </div>
                                    <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                                    <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- MainBody End ============================= -->
    <!-- Footer ================================================================== -->
    <div id="footerSection">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h5>ACCOUNT</h5>
                    <a href="signinForm.jsp">LOGIN</a>
                    <a href="user_profile.jsp">PROFILE</a>
                    <a href="product_summary.jsp">CART</a>
                    <a href="order_history.jsp">ORDER HISTORY</a>
                </div>
                <div class="span3">
                    <h5>INFORMATION</h5>
                    <a href="contact.jsp">CONTACT</a>
                    <a href="signupForm.jsp">REGISTRATION</a>
                    <a href="legal_notice.html">LEGAL NOTICE</a>
                    <a href="tac.html">TERMS AND CONDITIONS</a>
                </div>
                <div class="themeName">Bootswatch Skins (11)</div>
                <div class="images style">
                    <a href="themes/css/#" name="amelia" title="Amelia"><img src="themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="spruce" title="Spruce"><img src="themes/switch/images/clr/spruce.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="superhero" title="Superhero"><img src="themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="cyborg"><img src="themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="cerulean"><img src="themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="journal"><img src="themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="readable"><img src="themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="simplex"><img src="themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="slate"><img src="themes/switch/images/clr/slate.png" alt="bootstrap business templates" class="active "></a>
                    <a href="themes/css/#" name="spacelab"><img src="themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="united"><img src="themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
                    <p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>Color scheme</small></p>
                </div>
                <div class="themeName">Background Patterns </div>
                <div class="images patterns">
                    <a href="themes/css/#" name="pattern1"><img src="themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
                    <a href="themes/css/#" name="pattern2"><img src="themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern3"><img src="themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern4"><img src="themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern5"><img src="themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern6"><img src="themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern7"><img src="themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern8"><img src="themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern9"><img src="themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern10"><img src="themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>

                    <a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>

                    <a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
                    <a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>

                </div>
            </div>
        </div>
        <span id="themesBtn"></span>
    </body>

</html>
