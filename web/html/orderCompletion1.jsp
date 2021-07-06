<%-- 
    Document   : OrderCompletion
    Created on : Jun 22, 2021, 6:36:47 AM
    Author     : phath
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Completion</title>
        <link rel="stylesheet" href="./css/ordercompletion1.css">
        <link rel="stylesheet" href="./css/mainHoang.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./css/footer.css">
        <link rel="stylesheet" href="./css/cartListIcon.css">
        <link rel="stylesheet" href="./css/carticon.css">
        <link href="./fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/main.js"></script>
         <% 
          String uri = request.getRequestURI();
          int lastIndex = uri.lastIndexOf("/");
            String resource = uri.substring(lastIndex + 1);
        %>
    </head>
    <body>
        <div class="page__order-complete">
           <header class="header">

           <div class="shop-logo">
				<a href="Homepage.jsp" class="home-link" style="display: inline-block;">
					<section class="header_item" id="shopLogo">
						<h1><i class="fab fa-apple fa-2x"></i> SE15 Apple Store</h1>
					</section>
				</a>
             </div>


            <div class="login">
                <ul class="header_item_list">
                    <!-- If user logged in suscessfully , the item below wil showup and hide item other li item  -->
                    <c:if test="${sessionScope.user != null }">
                        <li class="header_item header__navbar-user">
                            <span class="header_item_user-name">Hello,${sessionScope.user.name}</span>
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
                    <c:if test="${sessionScope.user == null }">
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
                    <div class="product-page">
                        <a class="product-link" href="ViewProductController?categoryID=&status=True" class="header-nav__item-active">All</a>
                        <a class="product-link" href="ViewProductController?categoryID=MB&status=True">Mac</a>
                        <a class="product-link" href="ViewProductController?categoryID=ID&status=True">iPad</a>
                        <a class="product-link" href="ViewProductController?categoryID=IP&status=True">iPhone</a>
                        <a class="product-link" href="ViewProductController?categoryID=AW&status=True">Apple Watch</a>
                        <a class="product-link" href="ViewProductController?categoryID=AS&status=True">Accessories</a>
                    </div>
                    <div class="responsive-div" style="display: flex; ">
                        <div class=" search-container">
                            <form action="" class="search-form">
                                <input type="text" placeholder="Search.." name="search">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>

                        <div class=" cart">
                            
                            <a class="cart-view" href="MainController?action=ViewCart">
                                <i class="carft-icon fas fa-shopping-cart"></i>
                                <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                                </c:forEach>
                                <span class="cart-items">${subtotal}</span>
                            
                            </a>
                            <c:choose>
                                <c:when test="${sessionScope.cart == null}">
                                     <div class="header__cart-list header__cart-list--no-cart">

                                         <img src="images/no-cart.png" alt="" class="header___cart--no-cart---img">
                                         <span class="header__cart-list--no-cart-msg">Empty Cart</span>

                                     </div>     
                                </c:when>
                                <c:otherwise>
                                    <div class="header__cart-list">                                                              
                                        <header class="header__cart-heading">
                                            <h4 >View cart</h4>
                                        </header>
                                        <ul class="header__cart-list--item">
                                            <c:forEach var="cartItem" items="${sessionScope.cart}">
                                                <li class="header__cart-item">
                                                    <img src="${cartItem.product.image}" alt="" class="header__cart-img">
                                                    <div class="header__cart-item--info">
                                                        <div class="header__cart-item--head">
                                                            <h5 class="header__cart-item--name">
                                                                ${cartItem.product.name}
                                                            </h5>
                                                            <div class="header__cart-item-price--wrap">
                                                            <span class="header__cart-item--price"><fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.product.price}"/>VND</span>
                                                            <span class="header__cart-item--multiplication">x</span>
                                                            <span class="header__cart-item--quantity">${cartItem.quantity}</span>
                                                            </div>
                                                        </div>
                                                        <div class="header__cart-item--body">
                                                            <span class="header__cart-item--description">
                                                                color:${cartItem.product.color} | ram-storage:${cartItem.product.ram}-${cartItem.product.storage}
                                                            </span>
                                                            <span class="header__cart-item--remove"><a 
                                                                    href="MainController?action=RemoveCart&page=<%=resource%>&productID=${cartItem.product.productID.trim()}&color=${cartItem.product.color.trim()}&ram=${cartItem.product.ram.trim()}&storage=${cartItem.product.storage.trim()}"
                                                            style="color:black;text-align: right;
                                                            padding:0;height: 20px;">Remove</a></span>
                                                        </div>
                                                    </div>
                                                                    
                                                </li>
                                            </c:forEach> 
                                        </ul>
                                        <a class="header__cart-view-cart btn btn__primary" href="MainController?action=ViewCart" style="background-color: #DDDDDD;color:black">View detail</a>
                                    </div> 
                                </c:otherwise>  
                        </c:choose>
                        </div>
                    </div>
                </div>
            </div>
                <div class="order-complete__container">
                <h2 class="order-complete__tittle">
                    Order Recieved
                </h2>
                <span class="order-complete__msg" 
                <c:if test="${requestScope.error!=null}">style="background-color: #F84F31;"</c:if>>         
                    <c:if test="${requestScope.error=null}"><i class="far fa-times-circle"></i>${requestScope.error}</c:if>
                    <c:if test="${requestScope.msg !=null}"><i class="far fa-check-circle"></i>${requestScope.msg}</c:if> 
                </span>
                <c:set var="order" value="${requestScope.newOrder}" scope="page"></c:set>
                <div class="order-detail">
                    <div class="order-detail__item orderid">
                        <span class="tittle orderid__title">
                            Order ID:
                        </span>
                        <span class="detail orderid-detail">
                            ${order.orderID}
                        </span>
                    </div>
                    <div class="order-detail__item address">
                        <span class="tittle address__address">
                            Name:
                        </span>
                        <span class="detail orderid-detail">
                            ${order.cusName}
                        </span>
                    </div>
                        <div class="order-detail__item address wrap">
                        <span class="tittle address__address">
                            Address:
                        </span>
                        <span class="detail orderid-detail">
                            ${order.address}
                        </span>
                    </div>
                    <div class="order-detail__item address wrap">
                        <span class="tittle address__address">
                            Email
                        </span>
                        <span class="detail orderid-detail">
                            ${order.email}
                        </span>
                    </div>
                    <div class="order-detail__item order-date wrap">
                        <span class="tittle order-date__title">Date:</span>
                        <span class="detail order-date__detail">${order.orderDate}</span>
                    </div>
                    <div class="order-detail__item order-price wrap">
                        <span class="tittle order-price__title">Total:</span>
                        <span class="detail order-price__detail"><span><fmt:formatNumber type="number" maxFractionDigits = "0" value="${order.price}" />VND</span>
                    </div>
                    <div class="order-detail__item order-pmethod wrap">
                        <span class="tittle order-pmethod__title">Method</span>
                        <span class="detail order-pmethod__detail">${order.payMethod}</span>
                    </div>
                </div>
             
            </div>
                        <p class="send-email" style="font-size: 1.6rem;">${requestScope.mailMsg}</p>
            
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
