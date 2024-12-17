<%-- 
    Document   : editproduct
    Created on : Oct 21, 2024, 1:15:20 PM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAL.ProductsDAO" %>
<%@page import="Model.Products" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật sản phẩm</title>
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
        <h2>Chỉnh sửa sản phẩm</h2>
        <form action="editproduct" method="get" >
            <% ProductsDAO dao = new ProductsDAO(); %>
            <% List<Products> list = dao.getAll(); %>
            <% String productID = request.getParameter("productid"); %>
            <% for(Products product : list) { %>
            <% if(product.getProductID() == Integer.parseInt(productID)){ %>
            <div>
                <label for="productname">Tên sản phẩm: </label>
                <input type="text" id="productname" name="productname" value="<%= product.getProductName() %>" required>
                <input type="hidden" name="productid" value="<%= product.getProductID() %>"> 

            </div>
            <div>
                <label for="description">Mô tả: </label>
                <textarea type="text" id="description" name="description" value="<%= product.getDescription() %> "style="height: 22vh" required><%= product.getDescription() %></textarea>
            </div>
            <div>
                <label for="price">Giá: </label>
                <input type="number" id="price" name="price" value="<%= product.getPrice() %>" min="0" required>
            </div>
            <div>
                <label for="stockquantity">Số lượng: </label>
                <input type="number" id="stockquantity" name="stockquantity" value="<%= product.getStockQuantity() %>" min="0" required>
            </div>
            <div>
                <label for="imageurl">URL ảnh: </label>
                <input type="text" id="imageurl" name="imageurl" value="<%= product.getImageURL() %>" required>
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
                <input type="submit" value="Lưu">
                <a href="productmanage">Trở về</a>
            </div>
            <%}}%>
        </form></div>
    </body>
</html>
