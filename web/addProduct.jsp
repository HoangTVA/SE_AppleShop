<%-- 
    Document   : addProduct
    Created on : Jun 22, 2021, 6:43:34 AM
    Author     : phath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>       
        <title>SE15 Apple Shop</title>
        <link rel="stylesheet" href="../css/base.css">
        <link rel="stylesheet" href="../css/footer.css">
        <link rel="stylesheet" href="../css/mainHoang.css">
        <link rel="stylesheet" href="../css/addProduct.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
  
</head>
<body>
    <div class="page__user-profile">
        <header>
            <div class="shop-logo" >
                <section class="header_item" id="shopLogo">
                    <img style="max-width: 15rem" src="images/shop_logo.png">
                </section>
                <section class="header_item" id="shopName">
                    <h1>SE15 Apple Store</h1>
                </section>
            </div>

            <div class="login">
                <ul class="header_item_list">
                    <!-- If user logged in suscessfully , the item below wil showup and hide item other li item  -->
                    <c:if test="${requestScope.success != null }">
                    <li class="header_item header__navbar-user">
                            <span class="header_item_user-name">Hello,${requestScope.username}</span>
                            <ul class="header__navbar-user--menu">
                                <li class="header__navbar-user--item">
                                     <a href="UserDetailController?userid=${sessionScope.user.userID}">User detail</a>
                                </li>

                                <li class="header__navbar-user--item">
                                    <a href="cartForm.jsp">Order detail</a>
                                </li>
                                 <li class="header__navbar-user--item">
                                    <a href="OrderHistoryController?userid=${sessionScope.user.userID.trim()}">Order History</a>
                                </li>
                                 <li class="header__navbar-user--item">
                                    <a href="changePass.jsp">Update Password</a>
                                </li>
                                <li class="header__navbar-user--item">
                                    <a href="">Sign out</a>
                                </li>
                            </ul>
                    </li>
                    </c:if>
                    <c:if test="${requestScope.success == null }">
                    <li class="header_item">
                        <a href="loginForm.jsp" class="header_item-link">Login</a>
                    </li>
                    <li class="header_item">
                        <a href="signup.jsp" class="header_item-link">Signup</a>
                    </li>
                    </c:if>
                    
                    
                </ul>

            </div> 
        </header>
        <div class="nav">
            <div class="topnav">
                <a href="" class="nav-item-active">All</a>
                <a href="">Mac</a>
                <a href="">iPad</a>
                <a href="">iPhone</a>
                <a href="">Apple Watch</a>
                <a href="">Accessories</a>
    
                <div class="cart">
                    <a href=""><i class="carft-icon fas fa-shopping-cart"></i></a>
                </div>
    
                <div class="search-container">
                    <form action="">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class="container__product-detail">
            <div class="frame__product-detail">
                <h2 class="tittle__product-detail">Product Update</h2>
                <form class="form__product-detail">
                    <div class="user-info-left">
                        <img class="user-info-left__img" src="../images/iphone12.png" alt="{sessionScope.product.name}">
                        <input class="file-input" type="file">
                    </div>
                    <div class="user-info__right">
                        <div class="product-infor product-id">
                            <span class="product-detail__tittle product-name__tittle">Product ID</span>
                            <input type="text" class="input__product-detail full-name__input" value="Iphone12" >
                        </div>
                        <div class="product-infor product-name">
                            <span class="product-detail__tittle product-name__tittle">Product Name</span>
                            <input type="text" class="input__product-detail full-name__input" value="Iphone12" >
                        </div>
                        <div class="product-infor product-price">
                            <span class="product-detail__tittle price__tittle">Price</span>
                            <input type="text" class="input__product-detail email__input" value="20.000.000"  >
                        </div>
                        <div class="product-infor product-quantity">
                            <span class="product-detail__tittle total-quantity__tittle">Total Quantity</span>
                            <input type="text" class="input__product-detail address__input" value="20" >
                        </div>
                        <textarea name="des" id="des-input" cols="30" rows="10" placeholder="Add product description here"></textarea>
                        <input class="button-update" type="submit" value="Add a product">
                    </div>                   
                </form>                
            </div>        
        </div>
        <footer>
            <div class="grid footer-border">                   
                <h2 class="foot-tittle">Contact us</h2>
                <div class="foot-info">    
                    <div class="foot-left-info">
                        <div class="foot-left-info__mail">
                            <i class="fas fa-envelope"></i>
                            <span class="foot-left-info__mail-addres">SE15AppleStore@gmail.com</span>
                        </div>
                        <div class="foot-left-info__phonenumber">
                            <i class="fas fa-phone-square-alt"></i>
                            <span class="foot-left-info__phonenumber-number">0839440343</span>
                        </div>
                        <div class="foot-left-info__shop-address">
                            <i class="fas fa-map-marker-alt"></i>
                            <span class="foot-left-info__shop-address-text">Cupertino, California,America</span>
                        </div>
                    </div>
                    <div class="foot-right-info">
                        <div class="foot-right-info__apple-icon"><i class="fab fa-apple"></i></div>
                        <div class="foot-right-info__link">
                            <div class="foot-right-info__product">
                                <a href="" class="foot-right-info__product-link">Iphone</a>
                                <a href="" class="foot-right-info__product-link">Ipad</a>
                                <a href="" class="foot-right-info__product-link">Mac</a>
                                <a href="" class="foot-right-info__product-link">Others</a>
                        </div>
                        <div class="foot-right-info__policy">
                                <a href="" class="foot-right-info__policy-link">Privacy Policies</a>
                                <a href="" class="foot-right-info__policy-link">Sale and refund</a>
                        </div>
                        </div>
                    </div>      
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
