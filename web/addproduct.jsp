<%-- 
    Document   : addproduct
    Created on : Oct 21, 2024, 10:33:50 AM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
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
                height: 90vh;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .login-container h2 {
                margin-bottom: 20px;
            }
            .login-container input, select, textArea{
                width: 90%;
                padding: 10px;
            }
            option{text-align : center}
            .login-container input[type="submit"]{
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
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
            <h2>Thêm sản phẩm</h2>
            <form action="addproduct" method="get">
                <div>
                    <label for="productname">Tên sản phẩm: </label>
                    <input type="text" id="productname" name="productname" required>
                </div>
                <div>
                    <label for="description">Mô tả: </label>
                    <textarea type="text" id="description" name="description" required style="height: 22vh"></textarea>
                </div>
                <div>
                    <label for="price">Giá: </label>
                    <input type="number" id="price" name="price" required >
                </div>
                <div>
                    <label for="stockquantity">Số lượng: </label>
                    <input type="number" id="stockquantity" name="stockquantity" required>
                </div>
                <div>
                    <label for="imageurl">URL ảnh: </label>
                    <input type="text" id="imageurl" name="imageurl" required>
                </div>
                <div>
                    <label for="categoryid">Danh mục: </label>
                    <select name="categoryid" id="categoryid">
                        <option value="1111" selected>Bàn phím</option>
                        <option value="2222">Chuột</option>
                        <option value="3333">Tai nghe</option>
                        <option value="4444">Phụ kiện</option>
                    </select>
                </div>
                <div>
                    <input type="submit" value="Thêm sản phẩm">
                    <a href="productmanage">Trở về</a>
                </div>
            </form>
        </div>
    </body>
</html>
