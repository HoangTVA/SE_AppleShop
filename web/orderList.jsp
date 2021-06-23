<%-- 
    Document   : orderList
    Created on : Jun 9, 2021, 10:29:10 PM
    Author     : ADMIN
--%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>OrderList</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/mainPhuc.css">
        <link rel="stylesheet" href="css/mainHoang.css">
        <link rel="stylesheet" href="css/orderList.css"> 
        <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.css">
    </head>
    <body>
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
                <c:if test="${sessionScope.user != null }">
                <li class="header_item header__navbar-user">
                        <span class="header_item_user-name">Hello,${sessionScope.user.name}</span>
                        <ul class="header__navbar-user--menu">
                            <ul class="header__navbar-user--menu">
                                    <li class="header__navbar-user--item">
                                         <a href="UserDetailController?userid=${sessionScope.user.userID}">User detail</a>
                                    </li>
                                    
                                    <li class="header__navbar-user--item">
                                        <a href="cartForm.jsp">Order detail</a>
                                    </li>
                                     <li class="header__navbar-user--item">
                                        <a href="orderHisotry.html">Order History</a>
                                    </li>
                                     <li class="header__navbar-user--item">
                                        <a href="changePass.jsp">Update Password</a>
                                    </li>
                                    <li class="header__navbar-user--item">
                                        <a href="">Sign out</a>
                                    </li>
                                </ul>
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
                <a class="product-link" href="">OrderList</a>
            </div>
          </div>
    </div>    
         <div class="orderList-container">
             <h1 class="orderList-header">Order List</h1>
             <form class="orderList-filter">
                 <input type="text" onkeyup="myFunction();" name="orderID" id="myInput" class="orderList-filter__input" placeholder="input orderId">

                 <select onchange="statusFilter();" name="status-filter" id="status-select">
                    <option hidden disabled selected value>Status</option>
                    <option value="">All</option>
                    <option value="received">Received</option>
                    <option value="shipping">Shipping</option>
                 </select>
            </form>
            <div class="table-responsive">
            <table class="table orderList-table table-striped align-middle" id="orderList-table" style="width: 95.5%;">
                <thead>
                  <tr>
                    <th scope="col">OrderID</th>
                    <th scope="col">Order Day</th>
                    <th scope="col">Customer Name</th>
                    <th scope="col">Ship Address</th>
                    <th scope="col">Subtotal</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                    
                </tr>
                </thead>
                <tbody>
                    <c:choose>
                    <c:when test="${requestScope.ORDER_LIST != null}">
                        <c:forEach var="order" items="${requestScope.ORDER_LIST}">
                            <tr>
                                <td>${order.orderID}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.cusName}</td>
                                <td>${order.address}</td>
                                <td><fmt:formatNumber type="number" maxFractionDigits = "0" value="${order.price}"/></td>
                                <td>${order.status}</td>
                                <td><a href="OrderDetailController?orderID=${order.orderID}"><button  class="btn btn-secondary action-btn">View</button></a><a href=""><button class="btn btn-success action-btn">Done</button></a></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                        <c:otherwise>
                            <h1>${requestScope.EMPTY_LIST.msg}</h1>
                        </c:otherwise>
                    </c:choose>
                    
                </tbody>
              </table>
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
        <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            
            filter = input.value.toUpperCase();
            table = document.getElementById("orderList-table");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
        function statusFilter(){
            var select, filter, table, tr, td, i, txtValue;
            select = document.getElementById("status-select");
            filter = select.value.toUpperCase();
            table = document.getElementById("orderList-table");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[5];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    </body>
</html>
