<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="DAL.ProductsDAO" %>
<%@page import="DAL.OrdersDAO" %>
<%@page import="DAL.OrderItemsDAO" %>
<%@page import="Model.Products" %>
<%@page import="Model.OrderItems" %>
<%@page import="Model.Orders" %><%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh sửa đơn hàng</title>
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
            /* Style navigation in admin page */
            .vertical-nav {
                width: 200px;

                float: left;
                background-color: #f1f1f1;
                position: absolute;
                padding-top: 20px;
            }
            .vertical-nav form {
                margin: 0;
            }
            .vertical-nav button {
                display: block;
                width: 100%;
                padding: 10px;
                border: none;
                background: none;
                text-align: left;
                cursor: pointer;
                border-bottom: 1px solid #ddd;
                color: black;
                font-size: 16px;
            }
            .vertical-nav button:hover {
                background-color: #4CAF50;
                color: white;
            }

            /* Content area styling */
            .content {
                margin-left: 210px;
                padding: 20px;
            }

            table, th, td{
                border: black solid 1px;
                text-align: center
            }
            table{
                width: 100%;
            }
            th{
                background-color: #ffcc33;
            }
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
                color: white;
            }

        </style>

    </head>
    <body>
        <div class="container-fluid header row" style="height: 120px">
            <div class="col-md-4" >
                <a href="#" style="color: black; text-decoration: none; border: black solid 3px; padding: 10px"><h1>F-GEAR</h1></a>
            </div>
            <div class="col-md-4">
                <h4>Xin chào 
                    <c:choose>
                        <c:when test="${not empty cookie.username}">
                            ${cookie.username.getValue()}
                        </c:when>
                        <c:otherwise>
                            ${sessionScope.username}
                        </c:otherwise>
                    </c:choose>
                </h4>
            </div>
            <div class="col-md-4">
                <a href="logout" style="margin: 10px; color: black"><h4>Đăng xuất/Trở về trang chủ</h4></a>
            </div>
        </div>
        <% ProductsDAO dao = new ProductsDAO(); %>
        <% OrdersDAO o = new OrdersDAO(); %>
        <% OrderItemsDAO oi = new OrderItemsDAO(); %>



        <div class="container">
            <!-- Left Section: Form -->

            <%
// Lấy thông tin đơn hàng một lần và sử dụng lại
int orderId = Integer.parseInt(request.getParameter("orderid"));
Orders order = o.getOrderByID(orderId);
String require = order.getOrderStatus();
            %>

            <div class="form-section">
                <form action="ModifyOrder"> 
                    <input type="hidden" name="oldStatus" value="<%= require%>">
                    <input name="orderid" value="<%= orderId %>" type="hidden">
                    <h2>Thông tin liên hệ</h2>
                    <div class="form-group">
                        <label for="fullname">Họ và tên</label>
                        <input type="text" id="fullname" name="fullname"
                               value="<%= order.getFullName() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone"
                               value="<%= order.getPhone() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" id="address" name="address"
                               value="<%= order.getAddress() %>" readonly>
                    </div>
                    <div class="form-group">

                        <% if("Pending".equalsIgnoreCase(order.getOrderStatus())){%>
                        <label for="status">Trạng thái</label>
                        <select name="status" id="status" >
                            <option value="Pending" selected>Đang chờ</option>
                            <option value="Shipping">Đang giao</option>
                            <option value="Completed">Hoàn thành</option>
                            <option value="Canceled">Đã huỷ</option>
                        </select>
                        <%}%>
                        <% if("Shipping".equalsIgnoreCase(order.getOrderStatus())){%>
                        <label for="status">Trạng thái</label>
                        <select name="status" id="status" >
                            <option value="Pending">Đang chờ</option>
                            <option value="Shipping" selected>Đang giao</option>
                            <option value="Completed">Hoàn thành</option>
                            <option value="Canceled">Đã huỷ</option>
                        </select>
                        <%}%>
                        <% if("Completed".equalsIgnoreCase(order.getOrderStatus())){%>
                        <label for="status">Trạng thái</label>
                        <select name="status" id="status" >
                            <option value="Pending">Đang chờ</option>
                            <option value="Shipping">Đang giao</option>
                            <option value="Completed" selected>Hoàn thành</option>
                            <option value="Canceled">Đã huỷ</option>
                        </select>
                        <%}%>
                        <% if("Canceled".equalsIgnoreCase(order.getOrderStatus())){%>
                        <label for="status">Trạng thái</label>
                        <select name="status" id="status" >
                            <option value="Pending">Đang chờ</option>
                            <option value="Shipping">Đang giao</option>
                            <option value="Completed">Hoàn thành</option>
                            <option value="Canceled" selected>Đã huỷ</option>
                        </select>
                        <%}%>
                    </div>
            </div>

            <!-- Right Section: Order Summary -->
            <div class="summary-section">
                <h2>Thông tin đơn hàng</h2>  



                <% for(OrderItems i : oi.getOrderByID(orderId)) { %>

                <% Products product = dao.getProductByID(i.getProductID()); %>

                <div class="product-item">
                    <img src="<%= product.getImageURL() %>" alt="Product Image">
                    <div class="product-details">
                        <p class="product-name"><%= product.getProductName() %></p>
                        <p onchange="updateTotalPrice(this, <%= product.getPrice() %>, <%= i.getProductID() %>)" > SL: <%= i.getQuantity() %> </p>
                        <p>Thành tiền: <span id="totalPrice-<%= i.getProductID() %>"><fmt:formatNumber value="<%= i.getQuantity() * product.getPrice() %>" type="number" groupingUsed="true"></fmt:formatNumber> VND</span></p>
                        </div>
                    </div>
                <% }%>
                <div class="total-cost">
                    <p>Tổng doanh thu: <fmt:formatNumber value="<%= oi.getInterestByOrder(orderId) %>" type="number" groupingUsed="true"></fmt:formatNumber> VND</p>
                    </div>
                    <div class="buttons">
                        <button style="background-color: #2196F3" class="cancel-btn" onclick="window.location.href = 'ordermanage?require=<%= require%>'" type="button">Trở về</button>
                    <button style="background-color: #4CAF50" class="cancel-btn" type="submit">Cập nhật đơn hàng</button>
                </div>
                </form>

            </div>
        </div>
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
        </script>
    </body>
</html>