<%-- 
    Document   : signup
    Created on : Oct 18, 2024, 1:37:31 AM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <title>Đăng ký tài khoản</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #ffcc33;
            }
            .login-container {
                background-color: #f5f5f5;
                height: 80vh;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .login-container h2 {
                margin-bottom: 20px;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 90%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .login-container input[type="submit"]{
                width: 95%;
                padding: 10px;
                background-color: #4CAF50;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
            }
            .login-container input[type="submit"]:hover {
                background-color: #fdaa00;
            }
            .login-container a {
                display: block;
                margin-top: 15px;
                text-decoration: none;
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <div class="login-container">       
            <h2>THÊM TÀI KHOẢN</h2>
            <form action="addaccount" method="post">
                <div>
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div>
                    <label for="password">Mật khẩu: </label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <label for="confirmPassword">Xác nhận mật khẩu: </label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <div>
                    <input type="submit" value="Signup">
                    <a href="accountmanage">Trở về</a>
                </div>
                <% if (request.getAttribute("error") != null) { %>
                <p style="color:red;"><%= request.getAttribute("error") %></p>
                <% } %>
            </form>
        </div>


    </body>
</html>
