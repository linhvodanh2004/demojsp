<%-- 
    Document   : login
    Created on : Oct 18, 2024, 1:17:52 AM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <title>Đăng nhập | F-Gear</title>
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

            .login-container input[type="checkbox"] {
                margin-right: 5px;
            }
            .login-container .remember-me {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Đăng nhập</h2>
            <form action="login" method="post">
                <div>
                    <label for="username">Tên đăng nhập: </label>
                    <input type="text" id="username" name="username" 
                           value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>">
                </div>
                <div>
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password">
                </div>
                <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember me</label>
                </div>
                <div>
                    <input type="submit" value="Login">
                </div>

                <c:if test="${not empty error}">
                    <p style="color:red;">${error}</p>
                </c:if>
            </form>
            <a href="home.jsp">Trở về</a>
            <p>Bạn đã có tài khoản chưa?</p>
            <a href="signup.jsp">Đăng ký ngay</a>
        </div>
    </body>
</html>
