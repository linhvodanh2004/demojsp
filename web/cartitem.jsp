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
        <title>Giỏ hàng</title>
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
            /* Cart Container Styling */
            .cart-container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 8px;
                background-color: #f9f9f9;
            }

            /* Cart Header */
            .cart-header {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }

            /* Cart Item Styling */
            .cart-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #ddd;
                padding: 15px 0;
            }

            /* Product Image */
            .cart-item img {
                width: 80px;
                height: auto;
                margin-right: 15px;
                border-radius: 5px;
            }

            /* Product Name */
            .cart-item h4 {
                flex: 1;
                font-size: 18px;
                margin-right: 15px;
            }

            /* Quantity Controls */
            .item-quantity {
                display: flex;
                align-items: center;
            }

            .item-quantity input[type="number"] {
                width: 60px;
                text-align: center;
                margin: 0 10px;
                padding: 5px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            /* Submit Buttons for + and - */
            .item-quantity button {
                width: 60px;
                height: 30px;
                background-color: #ffcc33;
                border: 1px solid #ccc;
                cursor: pointer;
                font-size: 18px;
                line-height: 18px;
                border-radius: 4px;
            }

            /* Styling for the total price */
            .item-price {
                width: 200px;
                font-size: 16px;
                color: #333;
                font-weight: bold;
                text-align: right;
                padding: 10px;
            }

            /* Form Alignment */
            form {
                display: flex;
                align-items: center;
                flex: 1;
                justify-content: space-between;
            }

            /* Hide the hidden inputs */
            input[type="hidden"] {
                display: none;
            }

            /*             For Chrome, Safari, Edge, and Opera 
                        input[type="number"]::-webkit-inner-spin-button,
                        input[type="number"]::-webkit-outer-spin-button {
                            -webkit-appearance: none;
                            margin: 0;
                        }
            
                         For Firefox 
                        input[type="number"] {
                            -moz-appearance: textfield;
                        }*/

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
        <div class="cart-container">


            <div class="cart-item">
                <h4>Ảnh</h4>
                <h4 style="text-align: center">Tên sản phẩm</h4>
                <h4 style="text-align: right">Số lượng</h4>
                <h4 style="text-align: center">Thành tiền</h4>
            </div>
            <% ProductsDAO dao = new ProductsDAO(); %>
            <% CartItemsDAO ct = new CartItemsDAO(); %>

            <% List<Products> pr = dao.getInStock(); %>
            <% List<CartItems> items = (List<CartItems>)request.getAttribute("cartlist"); %>
            <% int cardID = -1; %>
            <% for(CartItems i : items) { %>
            <% for(Products product : pr) { %>
            <% if(i.getProductID() == product.getProductID()) { %>
            <% cardID = i.getCartID(); %>
            <div class="cart-item">
                <form action="updatecart" method="get">
                    <img src="<%= product.getImageURL() %>" alt="Ảnh sản phẩm">
                    <h4 style="text-align: center"><%= product.getProductName() %></h4>
                    <div class="item-quantity">

                        <input class="item-quantity quantity" type="number" id="numberInput" name="quantity" value="<%= i.getQuantity() %>" min="1" max="<%= product.getStockQuantity() %>"
                               oninput="validateInput()" onchange="updateTotalPrice(this, <%= product.getPrice() %>, <%= i.getProductID() %>)">
                        <button type="submit" name="submit" value="Save">LƯU</button>
                    </div>

                    <div class="item-price"><span class="item-price" id="totalPrice-<%= i.getProductID() %>"><fmt:formatNumber value="<%= i.getQuantity() * product.getPrice() %>" type="number" groupingUsed="true"></fmt:formatNumber> VND</span></div>
                        <div class="item-quantity"><button type="submit" name="submit" value="-"><i class='far fa-trash-alt'></i></button></div>
                        <input type="hidden" style="display:  none" name="cartid" value="<%= i.getCartID() %>">
                    <input type="hidden" style="display:  none" name="productid" value="<%= i.getProductID() %>">



                </form>
            </div>
            <% }}}%>

            <c:choose>
                <c:when test="${not empty requestScope.cartlist}">
                <div class="cart-total" style="text-align: right; padding: 20px 50px 0px 0px">
                    <p style="font-weight: bold">Tạm tính: <span id="cartTotalPrice">0 VND</span></p>
                </div>
                <!-- HTML for the buttons -->
                <div style="display: flex; justify-content: space-around; padding: 20px 0px; margin: 20px 0px; background-color: #f0f0f0; border-radius: 8px;">
                    <!-- Back to Homepage Button -->
                    <button onclick="window.location.href = 'showproduct?category='" 
                            style="padding: 10px 20px; background-color: #3498db; color: white; border: none; border-radius: 5px; cursor: pointer; width: 400px">
                        Tiếp tục mua hàng
                    </button>
                    <!-- Go to Checkout Button -->
                    <button onclick="window.location.href = 'checkout.jsp?cartid= <%= cardID %>'" 
                            style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; width: 400px">
                        Đặt hàng ngay
                    </button>

                </div>
                </c:when>
                <c:otherwise>
                    <div style="display: flex; justify-content: center; align-items: center; text-align: center; height: 45vh;">
                        <p>Oops ! Giỏ hàng hiện đang trống</p>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
        <!-- HTML for the buttons -->


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
            function validateInput() {
                var input = document.getElementById("numberInput");
                if (input.validity.rangeOverflow) {
                    input.setCustomValidity("Vui lòng không đặt hàng quá số lượng tồn kho.");
                } else {
                    input.setCustomValidity("");
                }
            }

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

// Call calculateCartTotal on page load to ensure the initial total is set correctly
            window.onload = function () {
                calculateCartTotal();
            };


        </script>
    </body>
</html>
