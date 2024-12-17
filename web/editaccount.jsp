<%-- 
    Document   : editaccount
    Created on : Oct 21, 2024, 12:13:43 AM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật tài khoản</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
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
            <form action="editaccount?username=<%= request.getParameter("username") %>" method="post">
                <h2>Đặt lại mật khẩu</h2>
                <p>Tên tài khoản: ${param.username}</p>

                <div>
                    <label for="#oldpw">Nhập mật khẩu cũ: </label>
                    <input type="password" id="oldpw" name="oldpassword">
                </div>
                <div> 
                    <label for="#newpw">Nhập mật khẩu mới: </label>
                    <input type="password" id="newpw" name="newpassword">
                </div>
                <div>
                    <label for="#confirmpw">Nhập lại mật khẩu mới: </label>
                    <input type="password" id="confirmpw" name="confirmpassword">
                </div>
                <div>
                    <input type="hidden" name="username" >
                    <input type="submit" value="Gửi">
                    <a href="accountmanage">Trở về</a>
                </div>
            </form>
            <c:if test="${not empty requestScope.message}">
                <p style="color: red">${requestScope.message}</p>
            </c:if>
        </div>
    </body>
</html>
