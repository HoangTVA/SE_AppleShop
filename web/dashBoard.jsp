<%-- 
    Document   : dashBoard
    Created on : Jun 18, 2021, 11:12:52 AM
    Author     : anime
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="fontAwsome/css/all.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/mainHoang.css">
    <link rel="stylesheet" href="css/mainPhuc.css">
    <link rel="stylesheet" href="css/userList.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <script type="text/javascript" src="chart.js/Chart.js"></script>

    <link rel="stylesheet" href="css/dashBoard.css">
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
                        <span class="header_item_user-name">Hello, ${sessionScope.user.name}</span>
                        <ul class="header__navbar-user--menu">
                            <li class="header__navbar-user--item">
                                <a href="UserDetailController?userid=${sessionScope.user.userID}">User detail</a>
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
            </div>
        </div>
    </div>

    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Icon Cards-->
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-primary o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-comments"></i>
                            </div>
                            <div class="mr-5">26 New Visitors!</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                      <i class="fa fa-angle-right"></i>
                    </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-list"></i>
                            </div>
                            <div class="mr-5">11 New Registers!</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                      <i class="fa fa-angle-right"></i>
                    </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-success o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-shopping-cart"></i>
                            </div>
                            <div class="mr-5">123 New Orders!</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                      <i class="fa fa-angle-right"></i>
                    </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-danger o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-support"></i>
                            </div>
                            <div class="mr-5">2 000 000 000 Profits</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                      <i class="fa fa-angle-right"></i>
                    </span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- Area Chart-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-area-chart"></i> Area Chart</div>
                <div class="card-body">
                    <canvas id="myAreaChart" width="100%" height="30"></canvas>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <!--Bar Chart Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-bar-chart"></i> Bar Chart</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-8 my-auto">
                                    <canvas id="myBarChart" width="100" height="50">


                                    </canvas>
                                </div>
                                <div class="col-sm-4 text-center my-auto">
                                    <div class="h4 mb-0 text-primary">$34,693</div>
                                    <div class="small text-muted">YTD Revenue</div>
                                    <hr>
                                    <div class="h4 mb-0 text-warning">$18,474</div>
                                    <div class="small text-muted">YTD Expenses</div>
                                    <hr>
                                    <div class="h4 mb-0 text-success">$16,219</div>
                                    <div class="small text-muted">YTD Margin</div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!--Pie Chart Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-pie-chart"></i> Pie Chart</div>
                        <div class="card-body">
                            <canvas id="myPieChart" width="100%" height="100"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                    <!--Notifications Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-bell-o"></i>Manager Feeding Log</div>
                        <div class="list-group list-group-flush small">
                            <a class="list-group-item list-group-item-action" href="#">
                                <div class="media-body">
                                    <strong>Quang Phuc</strong> added a new product here
                                    <div class="text-muted smaller"> Today at 5:43 PM - 5m ago</div>
                                </div>
                            </a>
                            <a class="list-group-item list-group-item-action" href="#">
                                <div class="media-body">
                                    <strong>Ching Chong</strong>comment at a product
                                    <div class="text-muted smaller"> Today at 4:37 PM - 1hr ago</div>
                                </div>
                            </a>
                            <a class="list-group-item list-group-item-action" href="#">View all activity...</a>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>
            </div>
            <!--DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> Manager Data</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td>Quang</td>
                                    <td>20</td>
                                    <td>2021/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Phat</td>
                                    <td>20</td>
                                    <td>2021/07/25</td>
                                    <td>$170,750</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
        </div>
        <!-- /.container-fluid-->
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
                        <span class="foot-left-info__shop-address-text">Cupertino, California, America</span>
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
</body>


</html>

<script>
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';
    // -- Area Chart
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
            datasets: [{
                label: "Sessions",
                lineTension: 0.3,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 20,
                pointBorderWidth: 2,
                data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 40000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });
    // -- Bar Chart
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June"],
            datasets: [{
                label: "Revenue",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: [4215, 5312, 6251, 7841, 9821, 14984],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 15000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });
    // -- Pie Chart
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["${requestScope.hello}", "${requestScope.hello1}", "${requestScope.hello2}", "${requestScope.hello3}"],
            datasets: [{
                data: [12.21, 15.58, 11.25, 8.32],
                backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
            }],
        },
    });

    $(document).ready(function() {
        $('#dataTable').DataTable();
    });

    (function($) {
        "use strict"; // Start of use strict
        // Configure tooltips for collapsed side navigation
        $('.navbar-sidenav [data-toggle="tooltip"]').tooltip({
                template: '<div class="tooltip navbar-sidenav-tooltip" role="tooltip" style="pointer-events: none;"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
            })
            // Toggle the side navigation
        $("#sidenavToggler").click(function(e) {
            e.preventDefault();
            $("body").toggleClass("sidenav-toggled");
            $(".navbar-sidenav .nav-link-collapse").addClass("collapsed");
            $(".navbar-sidenav .sidenav-second-level, .navbar-sidenav .sidenav-third-level").removeClass("show");
        });
        // Force the toggled class to be removed when a collapsible nav link is clicked
        $(".navbar-sidenav .nav-link-collapse").click(function(e) {
            e.preventDefault();
            $("body").removeClass("sidenav-toggled");
        });
        // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
        $('body.fixed-nav .navbar-sidenav, body.fixed-nav .sidenav-toggler, body.fixed-nav .navbar-collapse').on('mousewheel DOMMouseScroll', function(e) {
            var e0 = e.originalEvent,
                delta = e0.wheelDelta || -e0.detail;
            this.scrollTop += (delta < 0 ? 1 : -1) * 30;
            e.preventDefault();
        });
        // Scroll to top button appear
        $(document).scroll(function() {
            var scrollDistance = $(this).scrollTop();
            if (scrollDistance > 100) {
                $('.scroll-to-top').fadeIn();
            } else {
                $('.scroll-to-top').fadeOut();
            }
        });
        // Configure tooltips globally
        $('[data-toggle="tooltip"]').tooltip()
            // Smooth scrolling using jQuery easing
        $(document).on('click', 'a.scroll-to-top', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: ($($anchor.attr('href')).offset().top)
            }, 1000, 'easeInOutExpo');
            event.preventDefault();
        });
    })(jQuery); // End of use strict
</script>

