<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAL.OrderItemsDAO" %>
<%@page import="Model.Orders" %>
<%@page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link href="css/style.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            /* Global Styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                color: #333;
            }
            h1, h2, h3, h4 {
                font-weight: bold;
            }

            /* Header Styling */
            .header {
                background-color: #ffcc33;
                color: black;
                padding: 20px;
            }
            .header h1 {
                font-size: 2em;
            }
            .header a {
                color: black;
                font-weight: bold;
                text-decoration: none;
            }

            /* Sidebar Styling */
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
            .content h2 {
                color: #333;
            }

            /* Table Styling */

            .btn-primary {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 20px;
                margin-top: 15px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .btn-primary:hover {
                background-color: #45a049;
            }

            /* Statistic Form Styling */
            .statistic-form {
                display: flex;
                justify-content: center;
                gap: 20px;
                padding: 20px;
                background: #e9ecef;
                border-radius: 5px;
                margin-bottom: 20px;
            }
            .statistic-form input[type="date"] {
                border-radius: 4px;
                padding: 8px;
                border: 1px solid #ddd;
            }
            /* Container for the statistics */
            .statistics-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                margin-top: 20px;
                justify-content: center;
            }

            /* Individual statistic card */
            .stat-card {
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                display: flex;
                align-items: center;
                width: 220px; /* Set width for regular cards */
                text-align: center;
            }

            /* Icon styling for each statistic */
            .stat-icon {
                font-size: 24px;
                color: #4CAF50;
                margin-right: 10px;
            }

            /* Statistic details styling */
            .stat-details {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .stat-label {
                font-size: 1.1em;
                font-weight: bold;
                color: #333;
            }

            .stat-value {
                font-size: 1.5em;
                color: #4CAF50;
                font-weight: bold;
            }

            /* Best-selling product card */
            .product-card {
                background-color: #fff3cd;
                border: 1px solid #ffeeba;
            }

            /* Full-width class to make best-selling product card span full width */
            .full-width {
                flex: 1 1 100%; /* Take full width of the container */
                max-width: 700px; /* Optional: Set a max width for large screens */
            }

            /* Product image styling */
            .product-image {
                width: 80px;
                height: auto;
                border-radius: 5px;
                margin-top: 10px;
            }

            /* Product name styling */
            .product-name {
                font-size: 1.2em;
                font-weight: bold;
                color: #333;
                text-align: center;
                max-width: 180px;
                margin: 10px auto;
                white-space: normal;
            }

        </style>

    </head>
    <body>
        <!-- Header Section -->
        <div class="container-fluid header">
            <div class="row align-items-center">
                <div class="col-md-4">
                    <a href="#"><h1>F-GEAR</h1></a>
                </div>
                <div class="col-md-4 text-center">
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
                <div class="col-md-4 text-right">
                    <a href="logout"><h4>Đăng xuất/Trở về trang chủ</h4></a>
                </div>
            </div>
        </div>

        <!-- Sidebar Section -->
        <div class="vertical-nav">
            <form action="accountmanage" method="get">
                <button type="submit">Tài khoản</button>
            </form>
            <form action="productmanage" method="get">
                <button type="submit">Sản phẩm</button>
            </form>
            <form action="ordermanage" method="get">
                <button type="submit">Đơn hàng</button>
            </form>
            <button onclick="window.location.href = 'statistic.jsp'">Thống kê</button>
        </div>

        <!-- Main Content Section -->
        <div class="content">
            <h2>Thống kê</h2>
            <div class="statistic-form">
                <form action="Statistic">
                    From: <input type="date" name="datefrom">
                    To: <input type="date" name="dateto">
                    <button type="submit" class="btn-primary">Thống kê</button>
                </form>
            </div>
            <c:if test="${not empty completedorders}">
                <div class="statistics-container">
                    <!-- Total Revenue Card -->
                    <div class="stat-card">
                        <div class="stat-details">
                            <span class="stat-label">Doanh thu:</span>
                            <span class="stat-value">
                                <fmt:formatNumber value="${totalmoney}" type="number" groupingUsed="true"/> VND
                            </span>
                        </div>
                    </div>

                    <!-- Completed Orders Card -->
                    <div class="stat-card">
                        <i class="fas fa-check-circle stat-icon"></i>
                        <div class="stat-details">
                            <span class="stat-label">Đơn hàng hoàn thành:</span>
                            <span class="stat-value">${completedorders}</span>
                        </div>
                    </div>

                    <!-- Order Cancellation Rate Card -->
                    <div class="stat-card">
                        <i class="fas fa-times-circle stat-icon"></i>
                        <div class="stat-details">
                            <span class="stat-label">Tỉ lệ huỷ đơn</span>
                            <span class="stat-value">${cancelpercent}%</span>
                        </div>
                    </div>

                    <!-- Best-selling Product Card on a New Line -->
                    <div class="stat-card product-card full-width">
                        <span class="stat-label">Best-seller</span>
                        <img src="${product.getImageURL()}" alt="${product.getProductName()}" class="product-image">
                        <span class="product-name">${product.getProductName()}</span>
                    </div>
                </div>

            </c:if>
        </div>
    </body>
</html>
