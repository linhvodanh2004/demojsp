<%-- 
    Document   : cartitem
    Created on : Oct 23, 2024, 3:06:42 AM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAL.ProductsDAO" %>
<%@page import="DAL.CartItemsDAO" %>
<%@page import="Model.Products" %>
<%@page import="Model.CartItems" %>
<%@page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiến hành đặt hàng</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link href="css/style.css" rel="stylesheet"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- jQuery -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <!-- Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Bootstrap 4 JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .container {
                display: flex;
                max-width: 1000px;
                margin: 0 auto;
                background-color: #f5f5f5;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            .form-section, .summary-section {
                padding: 20px;
                width: 50%;
            }
            .form-section {
                border-right: 1px solid #ccc;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            .form-group input, .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .form-group input[type="radio"] {
                width: auto;
                margin-left: 20px;
            }
/*            .summary-section {
                background-color: #f5f5f5;
            }*/
            .product-item {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
                background-color: #fff;
            }
            .product-item img {
                width: 80px;
                height: 80px;
                margin-right: 15px;
                border-radius: 5px;
            }
            .product-details {
                flex: 1;
                text-align: left;
            }
            .product-details p{
                color: black;
            }
            .product-name {
                font-weight: bold;
            }
            .total-cost {
                text-align: right;
                font-size: 18px;
                font-weight: bold;
                margin-top: 20px;
            }
            .buttons {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
            .buttons button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .cancel-btn {
                background-color: #f44336;
                color: #fff;
            }
            .submit-btn {
                background-color: #4CAF50;
                color: #fff;
            }

        </style>

    </head>
    <body>
        <div class="container-fluid header row" style="height: 120px">
            <div class="col-md-4" >
                <a href="home.jsp" style="color: black; text-decoration: none; border: black solid 3px; padding: 10px"><h1>F-GEAR</h1></a>
            </div>
            <div class="col-md-4">
                <div class="searchbar" style="background-color: white">
                    <form action="search" method="get">
                        <i class="fas fa-search"></i>
                        <input type="text" name="search-bar" placeholder="Bạn đang tìm kiếm gì ?" style="border: none; width: 300px;">
                        <input type="submit" value="Tìm kiếm " style="border: none; background-color: white;">
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <c:choose>
                    <c:when test="${not empty cookie.username or not empty sessionScope.username}">
                        <div class="main-menu" style="background-color: #ffcc33">
                            <ul style="position: relative">
                                <li><a href="cartlist" style="margin: 10px; color: black; text-decoration: none;"><h4><i style="border: black solid 2px; padding: 5px; margin: 20px 20px 0px 0px" class='fas fa-cart-plus'></i></h4></a></li>
                                <li> 
                                    <a href='#' style="margin: 10px; color: black"><h4><c:choose>
                                                <c:when test="${not empty cookie.username}">
                                                    ${cookie.username.getValue()}
                                                </c:when>
                                                <c:otherwise>
                                                    ${sessionScope.username}
                                                </c:otherwise>
                                            </c:choose>  <i class='far fa-arrow-alt-circle-down'></i></h4></a>
                                    <ul class='sub-menu' style="position: absolute; z-index: 1000; top: 50px; left: 0px;">
                                        <li  style="width: 200px; padding: 0px; background-color: #3498db"><a href='changepassword.jsp' style="padding: 0px; color: white"><h4>Đổi mật khẩu <i class='far fa-user-circle'></i></h4></a></li>
                                        <li style="width: 200px; padding: 0px; background-color: #3498db"><a href="LoadOrderForUser" style="padding: 0px; color: white"><h4>Đơn hàng <i class='fas fa-sign-out-alt'></i></h4></a>
                                        <li style="width: 200px; padding: 0px; background-color: #3498db"><a href="logout" style="padding: 0px; color: white"><h4>Đăng xuất <i class='fas fa-sign-out-alt'></i></h4></a>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                    </c:when>
                    <c:otherwise>
                        <a href="login.jsp" style="margin: 10px; color: black"><h4>Đăng nhập <i class='fas fa-sign-in-alt'></i></h4></a>
                            </c:otherwise>
                        </c:choose>

            </div>
        </div>

        <div class='main-menu'>
            <ul>
                <li class="col-md-2"></li>
                <li class="col-md-2"> <a href="home.jsp">Trang chủ</a></li>
                <li class="col-md-2"> <a href='showallproduct'>Sản phẩm</a>
                    <ul class='sub-menu'>
                        <li><a href='showproduct?category=1111'>Bàn phím</a></li>
                        <li><a href='showproduct?category=2222'>Chuột</a></li>
                        <li><a href='showproduct?category=3333'>Tai nghe</a></li>
                        <li><a href='showproduct?category=4444'>Phụ kiện setup</a></li>
                    </ul>
                </li>
                <li class="col-md-2"> <a href='#'>Hướng dẫn</a>
                    <ul class='sub-menu'>
                        <li><a href='huongdanmuahang.jsp'>Hướng dẫn mua hàng</a></li>
                        <li><a href='dieukhoandichvu.jsp'>Điều khoản dịch vụ</a></li>
                    </ul>
                </li>
                <li class="col-md-2"> <a href='showproduct?category='>Chính sách</a>
                    <ul class='sub-menu'>
                        <li><a href='chinhsachbaomat.jsp'>Chính sách bảo mật</a></li>
                        <li><a href='chinhsachbaohanh.jsp'>Chính sách bảo hành</a></li>
                        <li><a href='chinhsachvanchuyen.jsp'>Chính sách vận chuyển</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <form action="createorder" method="post">
            <div class="container">
                <!-- Left Section: Form -->

                <div class="form-section">
                    <h2>Thông tin liên hệ</h2>
                    <div class="form-group">
                        <label for="fullname">Họ và tên</label>
                        <input type="text" id="fullname" name="fullname">
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label>Phương thức thanh toán</label>
                        <input type="radio" id="cod" name="payment" value="cod" checked><span style="font-weight: 400"> Thanh toán khi nhận hàng</span>
                    </div>

                    <div class="form-group">
                        <label>Phương thức vận chuyển</label>
                        <input type="radio" id="economical" name="shipping" value="economical" onchange="getShippingFee(); getPaid()" checked><span style="font-weight: 400"> Giao hàng tiết kiệm </span><span style="font-style: italic; font-size: smaller">(Tối đa 5-7 ngày)</span>
                        <br>
                        <input type="radio" id="fast" name="shipping" value="fast" onchange="getShippingFee(); getPaid()"><span style="font-weight: 400"> Giao hàng nhanh </span><span style="font-style: italic; font-size: smaller">(Tối đa 3 ngày)</span>
                    </div>
                </div>

                <!-- Right Section: Order Summary -->
                <div class="summary-section">
                    <h2>Thông tin đơn hàng</h2>  
                    <input type="hidden" name="cartid" value=" <%= request.getParameter("cartid").trim() %> ">
                    <% ProductsDAO dao = new ProductsDAO(); %>
                    <% CartItemsDAO ct = new CartItemsDAO(); %>

                    <% List<Products> pr = dao.getInStock(); %>
                    <% int cartID = Integer.parseInt(request.getParameter("cartid").trim()); %>

                    <% for(CartItems i : ct.getCartItemByID(cartID)) { %>
                    <% for(Products product : pr) { %>
                    <% if(i.getProductID() == product.getProductID()) { %>
                    
                    <div class="product-item">
                        <img src="<%= product.getImageURL() %>" alt="Product Image">
                        <div class="product-details">
                            <p class="product-name"><%= product.getProductName() %></p>
                            <p onchange="updateTotalPrice(this, <%= product.getPrice() %>, <%= i.getProductID() %>)" > SL: <%= i.getQuantity() %> </p>
                            <p>Thành tiền: <span id="totalPrice-<%= i.getProductID() %>"><fmt:formatNumber value="<%= i.getQuantity() * product.getPrice() %>" type="number" groupingUsed="true"></fmt:formatNumber> VND</span></p>
                            </div>
                        </div>
                    <% }}}%>
                    <div class="total-cost">
                        <p>Tiền hàng: <span id="cartTotalPrice"></span></p>
                        <p style="border-bottom: #888 solid 1px; padding-bottom: 15px">Phí vận chuyển: <span id="shippingFeeDisplay"></span></p>
                        <p>Tổng tiền: <span id="paidDisplay" ></span></p>
                    </div>
                    <div class="buttons">
                        <button class="cancel-btn" onclick="window.location.href = 'home.jsp'" type="button">Quay về trang chủ</button>
                        <button class="submit-btn" type="submit">Đặt hàng ngay</button>
                    </div>
                </div>

            </div>
        </form>

        <footer class="footer row" style="background-color: #ffcc33;">
            <div class="footer-section col-md-3" style="">
                <h3>Hướng dẫn</h3>
                <p><a href="huongdanmuahang.jsp" style="color: black; text-decoration: none;">Hướng dẫn mua hàng</a></p>
                <p><a href="dieukhoandichvu.jsp" style="color: black; text-decoration: none;">Điều khoản dịch vụ</a></p>
                <a href="https://www.facebook.com/lpPIXEL/" style="color: black; text-decoration: none;"> FANPAGE</a>
            </div>
            <div class="footer-section col-md-3" style="">
                <h3>Chính sách</h3>
                <p><a href="chinhsachbaomat.jsp" style="color: black; text-decoration: none;">Chính sách bảo mật</a></p>
                <p><a href="chinhsachbaohanh.jsp" style="color: black; text-decoration: none;">Chính sách bảo hành</a></p>
                <p><a href="chinhsachvanchuyen.jsp" style="color: black; text-decoration: none;">Chính sách vận chuyển</a></p>
            </div>
            <div class="footer-section col-md-3" style="">
                <h3>Liên hệ</h3>
                <p>Cửa hàng F-GEAR</p>
                <p>Địa chỉ: Minh Khai, Vĩnh Tuy, Hai Bà Trưng, Hà Nội</p>
                <p>Email: cskh@fgear.net</p>
                <p>Hotline: 0984.350.255</p>
                <p>Thời gian hỗ trợ: 8h-22h (T2-T7)</p>
            </div>
        </footer>
        <script>
            // Function to update the total price for an individual product
            function updateTotalPrice(element, unitPrice, productId) {
                // Get the new quantity from the input field
                const quantity = element.value;
                // Calculate the total price for the current product
                const totalPrice = new Intl.NumberFormat().format(quantity * unitPrice) + ' VND';
                // Update the total price for the individual product on the page
                document.getElementById("totalPrice-" + productId).textContent = totalPrice;
                // Update the total price of all products
                calculateCartTotal();
            }

            // Function to calculate the total price of all products
            function calculateCartTotal() {
                // Get all elements with the class 'item-price' that represent total prices
                const priceElements = document.querySelectorAll('[id^="totalPrice-"]');
                let cartTotal = 0;
                // Loop through each element and sum the prices
                priceElements.forEach((element) => {
                    const priceText = element.textContent.replace(' VND', '').replace(/\./g, '');
                    const priceValue = parseFloat(priceText) || 0;
                    cartTotal += priceValue;
                });
                // Format the total price
                const formattedTotal = new Intl.NumberFormat().format(cartTotal) + ' VND';
                // Update the total price on the page
                document.getElementById('cartTotalPrice').textContent = formattedTotal;
            }
            function getShippingFee() {
                // Get the selected shipping method
                const shippingMethod = document.querySelector('input[name="shipping"]:checked').value;

                // Determine the shipping fee
                let shippingFee = 0;
                if (shippingMethod === "economical") {
                    shippingFee = 40000;
                } else if (shippingMethod === "fast") {
                    shippingFee = 100000;
                }
                shippingFee = new Intl.NumberFormat().format(shippingFee);


                // Display the shipping fee
                document.getElementById("shippingFeeDisplay").textContent = shippingFee + ' VND';
            }

            function getPaid() {
                const totalPrice = parseFloat(document.getElementById("cartTotalPrice").textContent.replace(' VND', '').replace(/\./g, '')) || 0;
                const shippingMethod = document.querySelector('input[name="shipping"]:checked').value;
                let shippingFee = 0;
                if (shippingMethod === "economical") {
                    shippingFee = 40000;
                } else if (shippingMethod === "fast") {
                    shippingFee = 100000;
                }
                document.getElementById("paidDisplay").textContent = new Intl.NumberFormat().format(totalPrice + shippingFee) + ' VND';
            }

            // Call calculateCartTotal on page load to ensure the initial total is set correctly
            window.onload = function () {
                calculateCartTotal();
                getShippingFee();
                getPaid();
            };


        </script>
    </body>
</html>
