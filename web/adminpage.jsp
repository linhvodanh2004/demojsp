<%-- 
    Document   : adminpage
    Created on : Oct 18, 2024, 5:01:19 PM
    Author     : PIXEL
--%>

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
        <title>Admin trang chủ</title>
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


        <div class="vertical-nav">
            <form action="accountmanage" method="get">
                <button type="submit" >Tài khoản</button>
            </form>
            <form action="productmanage" method="get">
                <button type="submit" >Sản phẩm</button>
            </form>
            <form action="ordermanage" method="get">
                <button type="submit" >Đơn hàng</button>
            </form>
            <button onclick="window.location.href = 'statistic.jsp'" > Doanh thu</button>
        </div>

        <!-- Content area -->
        <div class="content">
            <c:if test="${not empty requestScope.accountlist}">
                <div style="align-items: center; justify-content: center">
                    <button style="text-align: center; background-color: #006699;  width: 100%; margin-bottom: 20px"><a style="color: white;" href="addaccount.jsp">THÊM TÀI KHOẢN ADMIN</a></button>

                    <form action="accountmanage">
                        <div style="text-align: center; align-items: center;
                             display: flex; flex-direction: row; margin-bottom: 20px">
                            <select name="role">
                                <option value="all" selected>Chọn tất cả</option>
                                <option value="admin">Admin</option>
                                <option value="user">Người dùng</option>
                            </select>
                            <button type="submit" style="background-color: #2196F3; color: white; margin-left: 50px">Lọc</button>
                        </div>
                    </form>
                    <c:choose>
                        <c:when test="${not empty requestScope.accountlist}">
                            <table>
                                <tr>
                                    <th>Vai trò</th>
                                    <th>Tên đăng nhập</th>
                                    <th>Mật khẩu</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                                <c:forEach var="a" items="${requestScope.accountlist}">
                                    <tr> 
                                        <c:if test="${a.getRollID() == 0}"><td style="font-weight: bolder">Admin</td></c:if>
                                        <c:if test="${a.getRollID() == 1}"><td>Khách hàng</td></c:if>
                                        <td> ${a.getUsername()} </td>
                                        <td> ${a.getPassword()} </td>
                                        <c:if test="${a.getUsername() == 'admin'}">
                                            <td>
                                                <button style="background-color: #2196F3; color: white; border: none" 
                                                        onclick="window.location.href = 'editaccount.jsp?username=${a.getUsername()}'">Đổi mật khẩu</button>
                                            </td>
                                        </c:if>
                                        <c:if test="${a.getUsername() != 'admin'}">
                                            <td>
                                                <button style="background-color: #f44336; color: white; border: none" 
                                                        onclick="window.location.href = 'deleteaccount?username=${a.getUsername()}'">Xoá</button>
                                                <button style="background-color: #2196F3; color: white; border: none" 
                                                        onclick="window.location.href = 'editaccount.jsp?username=${a.getUsername()}'">Đổi mật khẩu</button>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>

                            </table>
                        </c:when>
                    </c:choose>
                </div>
            </c:if>
            <c:if test="${not empty requestScope.productlist}">
                <div style="align-items: center; justify-content: center">
                    <button style="text-align: center; background-color: #006699;  width: 100%; margin-bottom: 20px"><a style="color: white;" href="addproduct.jsp">THÊM SẢN PHẨM</a></button>
                    <form action="productmanage">
                        <div style="text-align: center; align-items: center;
                             display: flex; flex-direction: row; margin-bottom: 20px">
                            <select name="category">
                                <option value="all" selected>Chọn tất cả</option>
                                <option value="quantityasc">Tổn kho thấp</option>
                                <option value="quantitydesc">Tổn kho cao</option>
                                <option value="keyboard">Bàn phím</option>
                                <option value="mouse">Chuột</option>
                                <option value="headphone">Tai nghe</option>
                                <option value="accessory">Phụ kiện</option>
                            </select>
                            <button type="submit" style="background-color: #2196F3; color: white; margin-left: 50px">Lọc</button>
                        </div>
                    </form>
                    <c:choose>
                        <c:when test="${not empty requestScope.productlist}">
                            <table>
                                <tr>
                                    <th>ID sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Mô tả</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Ảnh</th>
                                    <th>Danh mục</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                                <c:forEach var="p" items="${requestScope.productlist}">
                                    <tr> 
                                        <td>${p.getProductID()}</td>
                                        <td>${p.getProductName()}</td>
                                        <td>${p.getDescription()}</td>
                                        <td>  <fmt:formatNumber value="${p.getPrice()}" type="number" groupingUsed="true"></fmt:formatNumber> </td>
                                        <td>${p.getStockQuantity()}</td>
                                        <td><img src="${p.getImageURL()}" alt="Ảnh sản phẩm" style="width: 200px; "></td>
                                        <c:if  test="${p.getCategoryID() == 1111}"><td>Bàn phím</td></c:if>
                                        <c:if test="${p.getCategoryID() == 2222}"><td>Chuột</td></c:if>
                                        <c:if test="${p.getCategoryID() == 3333}"><td>Tai nghe</td></c:if>
                                        <c:if test="${p.getCategoryID() == 4444}"><td>Phụ kiện</td></c:if>
                                            <td>
                                                <button style="background-color: #f44336; color: white; border: none" 
                                                        onclick="window.location.href = 'deleteproduct?productid=${p.getProductID()}'">Xoá</button><br>
                                            <button style="background-color: #2196F3; color: white; border: none" 
                                                    onclick="window.location.href = 'editproduct.jsp?productid=${p.getProductID()}'">Chỉnh sửa</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:when>
                    </c:choose>
                </div>
                <div style="text-align: center; font-size: larger; margin-top: 10px">
                    <c:forEach begin="1" end="${requestScope.endProduct}" var="i">
                        <a style="border: black solid 1px; padding: 5px; color: black" href= "productmanage?index=${i}&category=${requestScope.category}">${i}</a>
                    </c:forEach>
                </div>
            </c:if>


            <c:if test="${not empty requestScope.orderList}">
                <div style="align-items: center; justify-content: center">
                    <form action="ordermanage">
                        <div style="text-align: center; align-items: center;
                             display: flex; flex-direction: row; margin-bottom: 20px">
                            <select name="require">
                                <option value="all" selected>Chọn tất cả</option>
                                <option value="interest">Doanh thu cao</option>
                                <option value="new">Gần nhất</option>
                                <option value="Pending">Đang chờ</option>
                                <option value="Shipping">Đang giao</option>
                                <option value="Completed">Đã hoàn thành</option>
                                <option value="Canceled">Huỷ</option>
                            </select>
                            <button type="submit" style="background-color: #2196F3; color: white; margin-left: 50px">Lọc</button>
                        </div>
                    </form>

                    <c:choose>
                        <c:when test="${not empty requestScope.orderList}">
                            <table>
                                <tr>
                                    <th>ID đơn hàng</th>
                                    <th>Tên người dùng</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Doanh thu</th>
                                    <th>Phương thức</th>
                                    <th>Trạng thái</th>
                                    <th>Hoạt động</th>
                                </tr>
                                <% 
                                    OrderItemsDAO dao = new OrderItemsDAO();
                                    List<Orders> list = (List<Orders>) request.getAttribute("orderList");
                                    for(Orders order : list){%>
                                <tr>
                                    <td><%= order.getOrderID() %></td>
                                    <td><%= order.getUsername() %></td>
                                    <td><%= order.getOrderDate() %></td>
                                    <td> <fmt:formatNumber value="<%= dao.getInterestByOrder(order.getOrderID()) %>" type="number" groupingUsed="true"></fmt:formatNumber> </td>
                                    <td> <%= order.getShippingMethod() %> </td>
                                    <td> <%= order.getOrderStatus() %> </td>
                                    <td> <button style="background-color: #2196F3; color: white; border: none" 
                                                 onclick="window.location.href = 'modifyorder.jsp?orderid=<%= order.getOrderID() %>'">
                                            Xem</button></td>
                                </tr>

                                <%}%>

                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>Không có đơn hàng nào</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div style="text-align: center; font-size: larger; margin-top: 10px">
                    <c:forEach begin="1" end="${requestScope.endOrder}" var="i">
                        <a style="border: black solid 1px; padding: 5px; color: black" href= "ordermanage?index=${i}&require=${requestScope.require}">${i}</a>
                    </c:forEach>
                </div>
            </c:if>
    </body>
</html>

