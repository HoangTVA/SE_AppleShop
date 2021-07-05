<%-- 
    Document   : productDetai1l
    Created on : Jul 5, 2021, 1:07:56 PM
    Author     : anime
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SE15 Shop | Product Detail</title>
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
    <link href="themes/css/comment.css" rel="stylesheet" media="screen" />
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
    <link rel="stylesheet" href="css/mainP.css">
    <style type="text/css" id="enject"></style>
    <link rel="stylesheet" href="themes/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/base.css">
</head>

<body>
    <div id="header">
        <div class="container">
            <div id="welcomeLine" class="row">
                <div class="span6">Welcome!<strong> User</strong></div>
                <div class="span6">
                    <div class="pull-right">
                          <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                          </c:forEach>
                        <a href="product_summary.html"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> ${subtotal} Itemes in your cart </span> </a>
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
                        <li class=""><a href="allProduct.html">All Products</a></li>
                        <li class=""><a href="contact.html">Contact</a></li>
                        <li class=""><a href="contact.html">Profile</a></li>
                        <li class="">
                            <a href="register.html" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Signup</span></a>
                        </li>
                        <li class="">
                            <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
                            <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3>Login In</h3>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal loginFrm">
                                        <div class="control-group">
                                            <input type="text" id="inputEmail" placeholder="Email">
                                        </div>
                                        <div class="control-group">
                                            <input type="password" id="inputPassword" placeholder="Password">
                                        </div>
                                        <div class="control-group">
                                            <label class="checkbox">
											<input type="checkbox"> Remember me
											</label>
                                            <a href="#"><img width="30" height="30" src="themes/images/google.png" title="Login with Google" alt="Google Login" /></a>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-success">Sign in</button>
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End====================================================================== -->
    <div id="carouselBlk">
        <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <a href="register.html"><img style="width:100%" src="themes/images/carousel/1.png" alt="" /></a>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.html"><img style="width:100%" src="themes/images/carousel/2.png" alt="" /></a>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.html"><img src="themes/images/carousel/3.png" alt="" /></a>
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
                        <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                                </c:forEach>
                         <c:set var="total" value="${total + (cartItem.quantity * cartItem.product.price)}"/>
                        <a id="myCart" href="product_summary.html"><img src="themes/images/ico-cart.png" alt="cart">${subtotal} Items in your cart <span class="badge badge-warning pull-right">${total}</span></a>
                    </div>
                    <ul id="sideManu" class="nav nav-tabs nav-stacked">
                        <li><a href="products.html">All</a></li>
                        <li><a href="products.html">iPhone</a></li>
                        <li><a href="products.html">iPad</a></li>
                        <li><a href="products.html">Mac</a></li>
                        <li><a href="products.html">Accessory</a></li>
                    </ul>
                    <br/>
                </div>
                <!-- Sidebar end=============================================== -->
                <div class="span9">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                        <li><a href="products.html">Products</a> <span class="divider">/</span></li>
                        <li class="active">iPhone 12 Pro Max</li>
                    </ul>
                    <div class="row">
                        <div id="gallery" class="span3">
                            <a href="${requestScope.product.image}" title="iPhone 12 Pro Max">
                                <img src="${requestScope.product.image}" style="width:100%" alt="iPhone 12 Pro Max" />
                            </a>
                            <div id="differentview" class="moreOptopm carousel slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <a href="${requestScope.product.image}"> <img style="width:29%" src="${requestScope.product.image}" alt="" /></a>
                                        <a href="${requestScope.product.image}"> <img style="width:29%" src="${requestScope.product.image}" alt="" /></a>
                                        <a href="${requestScope.product.image}"> <img style="width:29%" src="${requestScope.product.image}" alt="" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="span6">
                            <input type="text" name="productID" value="${requestScope.product.productID}" hidden>
                            <h3>${requestScope.product.name}</h3>
<!--                            <small>-Ceramic Shield front | Glass back and aluminum design</small>-->
                            <hr class="soft" />
                            <form class="form-horizontal qtyFrm">
                                <div class="control-group">
                                    <label class="control-label"><span><fmt:formatNumber type="number" maxFractionDigits = "0" value="${spec.price}" /> VND</span></label>
                                    <div class="controls">
                                        <input type="number" class="span1" placeholder="Qty." />
                                        <button type="submit" class="btn btn-large btn-primary pull-right"> Add to cart <i class=" icon-shopping-cart"></i></button>
                                    </div>
                                </div>
                            </form>

                            <hr class="soft" />
                            <h4>100 items in stock</h4>
                            <form class="form-horizontal qtyFrm pull-right">
                                <div class="control-group">
                                    <label class="control-label"><span>Color</span></label>
                                    <div class="controls">
                                        
                                        <select class="span2" name="color" onChange="window.location = 'MainController?action=ProductDetail&productID=${product.productID.trim()}&color=${color.color}';">
                                        <c:forEach var="color" items="${requestScope.color}">           
                                            <option value="${color.color}">${color.color}</option>
                                         </c:forEach>
                                        </select>
                                        <select class="span2" name="option">
                                         <c:forEach var="spec" items="${requestScope.spec}">          
                                             <option value="${color.color}">${color.color}</option>  
                                         </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </form>
                            <hr class="soft clr" />
                            <a class="btn btn-small pull-right" href="#detail">More Details</a>
                            <br class="clr" />
                            <a href="#" name="detail"></a>
                            <hr class="soft" />
                        </div>

                        <div class="span9">
                            <ul id="productDetail" class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
                                <li><a href="#profile" data-toggle="tab">Comment</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade active in" id="home" style="position: relative;overflow: hidden;padding-bottom: 20px;" >
                                    <h4>Product Information</h4>                                  
                                    <p>
                                        iPhone 12 Pro Max mobile was launched on 13th October 2020. 
                                        
                                        The phone comes with a 6.70-inch touchscreen display with a resolution of 1284x2778 pixels at a pixel density of 458 pixels per inch (ppi). The iPhone 12 Pro Max supports wireless charging, as
                                            well as proprietary fast charging. 
                                        
                                        As far as the cameras are concerned, the iPhone 12 Pro Max on the rear packs a 12-megapixel primary camera with an f/1.6 aperture; a 12-megapixel camera with an f/2.4 aperture,
                                            and a 12-megapixel camera with an f/2.2 aperture. The rear camera setup has autofocus. It sports a 12-megapixel camera on the front for selfies with an f/2.2 aperture. iPhone 12 Pro Max is based on iOS 14 and packs
                                            128GB of inbuilt storage. The iPhone 12 Pro Max is a dual-SIM (GSM and GSM) mobile that accepts Nano-SIM and eSIM cards. The iPhone 12 Pro Max measures 160.80 x 78.10 x 7.40mm (height x width x thickness) and weighs
                                            228.00 grams. It was launched in Gold, Graphite, Pacific Blue, and Silver colours. It features an IP68 rating for dust and water protection. Connectivity options on the iPhone 12 Pro Max include Wi-Fi 802.11 a/b/g/n/ac/Yes,
                                            GPS, Bluetooth v5.00, Lightning, 3G, and 4G (with support for Band 40 used by some LTE networks in India). Sensors on the phone include accelerometer, ambient light sensor, barometer, gyroscope, proximity sensor,
                                            and compass/ magnetometer. The iPhone 12
                                            
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="profile">

                                    <div class="container__review">
                                        <h3 class="review__tittle">Comment</h3>

                                        <div class="form-comment__container">
                                            <form action="MainController" class="form-review">
                                                <lable for="reviewer-name" class="name-lable">Full Name</lable>
                                                <input placeholder="Input your Name" type="text" id="reviewer-name" class="cName" name="reviewer-name">
                                                <lable for="pComment" class="comment-lable">Comment</lable>
                                                <textarea type="text" class="pComment" id="pComment" name="pComment" placeholder="Input detail your comment"></textarea>
                                                <input type="hidden" name="productID" value="${requestScope.product.productID}" />
                                                <input type="submit" name="action" class="btn btn-small" value="Submit comment">
                                            </form>
                                        </div>
                                        <div class="review-list">
                                            <div review-item__container>
                                                <div class="reivew-row">
                                                    <span class="review__reviewer-name">
                                                    Khach hang
                                                    </span>
                                                    <p class="review__reviewer-comment">
                                                        Cho mình hòi Galaxy A51 đã sử dụng hơn 1 năm, shop có xem xét áp dụng chương trình trợ giá đổi qua IP 12 bản 256GB không ạ? và có áp dụng thêm chương trình trả góp qua thẻ tín dụng của HSBC không ạ? và kì hạn hỗ trợ tối đa là bao nhiêu? mình cảm ơn shope.
                                                    </p>
                                                </div>
                                                <ul class="review-option">
                                                    <form method="POST" class="reply-form d-none" id="comment-1-reply-form">
                                                        <textarea class="input-reply" placeholder="Reply to comment" rows="4"></textarea>
                                                        <button class="reply-submit" type="submit">Submit</button>
                                                        <button type="button" onclick="closeForm(this)">Cancel</button>
                                                    </form>
                                                </ul>


                                                <div id="reply-1" class="reply-item__container">

                                                    <div class="reivew-row">
                                                        <span class="fas fa-share review__reviewer-name">
                                                        Customer
                                                        </span>

                                                        <p class="review__reviewer-comment">
                                                            Shop xin chào anh Galaxy A51 hiện chưa được áp dụng cái kiểu chương trình này ạ.
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>
                                            <hr class="soft" />
                                            <div review-item__container>
                                                <li class="reivew-row">
                                                    <span class="review__reviewer-name">
                                                    Thang anh 69
                                                    </span>
                                                    <p class="review__reviewer-comment">
                                                        Ngành IT Việt Nam hiện nay ở đầu của sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng. Thằng em mình học bách khoa cơ khí, sinh năm 96. Tự mày mò học code rồi đi làm remote cho công
                                                        ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k tiền tươi thóc thật không
                                                        phải đóng thuế. Làm gần được 3 năm mà nhà xe nó đã mua đủ cả. Nghĩ mà thèm.
                                                    </p>
                                                </li>
                                                <ul class="review-option">
                                                    <form method="POST" class="reply-form d-none" id="comment-1-reply-form">
                                                        <textarea class="input-reply" placeholder="Reply to comment" rows="4"></textarea>
                                                        <button class="reply-submit" type="submit">Submit</button>
                                                        <button type="button" onclick="closeForm(this)">Cancel</button>
                                                    </form>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

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
                    <a href="login.html">LOGIN</a>
                    <a href="login.html">PROFILE</a>
                    <a href="login.html">CART</a>
                    <a href="login.html">ORDER HISTORY</a>
                </div>
                <div class="span3">
                    <h5>INFORMATION</h5>
                    <a href="contact.html">CONTACT</a>
                    <a href="register.html">REGISTRATION</a>
                    <a href="legal_notice.html">LEGAL NOTICE</a>
                    <a href="tac.html">TERMS AND CONDITIONS</a>
                </div>
                <div id="socialMedia" class="span3 pull-right">
                    <h5>SOCIAL MEDIA </h5>
                    <a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
                    <a href="#"><img width="60" height="60" src="themes/images/gmail.png" title="gmail" alt="gmail" /></a>
                    <a href="#"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
                </div>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Placed at the end of the document so the pages load faster ============================================= -->
    <script src="themes/js/jquery.js" type="text/javascript"></script>
    <script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="themes/js/google-code-prettify/prettify.js"></script>

    <script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>

    <!-- Themes switcher section ============================================================================================= -->
    <div id="secectionBox">
        <link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
        <script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
        <div id="themeContainer">
            <div id="hideme" class="themeTitle">Style Selector</div>
            <div class="themeName">Oregional Skin</div>
            <div class="images style">
                <a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
                <a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
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
