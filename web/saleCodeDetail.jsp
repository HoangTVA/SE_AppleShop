<%-- 
    Document   : saldeCodeDetail
    Created on : Jun 22, 2021, 6:49:24 AM
    Author     : phath
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="css/mainP.css">
    <link rel="stylesheet" href="css/mainHoang.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/carticon.css">
    <link rel="stylesheet" href="css/cartListIcon.css">
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% 
          String uri = request.getRequestURI();
          int lastIndex = uri.lastIndexOf("/");
            String resource = uri.substring(lastIndex + 1);
        %>
    
        <title> <%= resource%> </title>
    </head>

    <body>
        <div class="page__user-profile">
            <header>
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
                        <c:if test="${sessionScope.user != null}">
                        <li class="header_item header__navbar-user">
                                <span class="header_item_user-name">Hello,${sessionScope.user.name}</span>
                                <ul class="header__navbar-user--menu">
                                    <li class="header__navbar-user--item">
                                        <a href="">User detail</a>
                                    </li>
                                    <li class="header__navbar-user--item">
                                        <a href="">Order detail</a>
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
                        <a class="product-link" href="" class="header-nav__item-active">Dashboard</a>
                        <a class="product-link" href="">Add a product</a>
                        <a class="product-link" href="">Order list</a>
                        <a class="product-link" href="">User list</a>
                        <a class="product-link" href="MainController?action=SaleCodeList">Sale Code list</a>
                    </div>
                </div>
            </div>
            <div class="container__user-profile">
                <div class="frame__user-profile">
                    <h2 class="tittle__user-profile">Sale code detail</h2>
                    <form class="form__user-profile" action="MainController" method="post">
                        <div class="user-infor full-name">
                            <span class="user-infor__tittle full-name__tittle">Code Id</span>
                            <input type="text" class="input__user-profile full-name__input" name="codeid" value="${requestScope.CODE_DETAIL.codeID}" >
                        </div>
                        <div class="user-infor email">
                            <span class="user-infor__tittle email__tittle">Name</span>
                            <input type="text" class="input__user-profile email__input" name="name" value="${requestScope.CODE_DETAIL.codeName}" >
                        </div>
                        <div class="user-infor phonenumber">
                            <span class="user-infor__tittle phonenumber__tittle">Percentage</span>
                            <input type="text" class="input__user-profile phonenumber__input" name="percent" value="${requestScope.CODE_DETAIL.percentage}" >
                        </div>
                        <div class="user-infor address">
                            <span class="user-infor__tittle adress__tittle">Created day</span>
                            <input type="text" class="input__user-profile address__input" name="cday" value="${requestScope.CODE_DETAIL.createDate}" readonly>
                        </div>
                        <div class="user-infor address">
                            <span class="user-infor__tittle adress__tittle">Exp day</span>
                            <input type="text" class="input__user-profile address__input" name="eday" value="${requestScope.CODE_DETAIL.expDate}">
                        </div>
                        <div class="user-infor address">
                            <c:choose>
                                <c:when test="${requestScope.CODE_DETAIL.codeStatus}">
                                    <span class="user-infor__tittle adress__tittle">Status : Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="user-infor__tittle adress__tittle">Status : InActive</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                            <input type="hidden"  name="codeID" value="${sessionScope.user.userID}" >
                            <input type="hidden"  name="action" value="SaleCode" >
                            <input class="button-update" type="submit" name="perform"  value="Update">
                    </form>  
                        ${requestScope.UpSuccess}
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
