<%-- 
    Document   : orderplaced
    Created on : Oct 27, 2024, 12:32:04 PM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" href="css/style.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- jQuery -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <!-- Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <!-- Bootstrap 4 JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>Xác nhận đơn hàng</title><style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                text-align: center;
                padding: 50px;
            }
            .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                padding: 40px;
                max-width: 600px;
                margin: 0 auto;
            }
            .container h1 {
                color: #4CAF50;
            }
            .order-details {
                margin-top: 20px;
                font-size: 18px;
            }
            .order-link {
                color: #2196F3;
                text-decoration: none;
                font-weight: bold;
            }
            .order-link:hover {
                text-decoration: underline;
            }
            .button {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 30px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Đặt hàng thành công <i class='fas fa-check-circle'></i></h1>
            <p>Cảm ơn quý khách đã đặt hàng. Đơn hàng đã xác nhận đặt thành công.</p>
            <div class="order-details">
                <p>ID đơn hàng: <a href="orderdetail.jsp?orderid=${requestScope.orderid}" id="orderLink" class="order-link">${requestScope.orderid}</a></p>
            </div>
            <p>Lưu ý: đơn hàng chỉ có thể Sửa/Huỷ khi ở trạng thái PENDING</p>
            <a href="home.jsp" class="button">Về trang chủ</a>
        </div>


    </body>
</html>
