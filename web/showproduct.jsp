<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hiển thị sản phẩm</title>
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
            .product-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 20px;
                padding: 20px;
            }
            .product-item {
                border: 1px solid #ccc;
                border-radius: 10px;
                text-align: center;
                padding: 15px;
            }
            .product-item img {
                max-width: 100%;
                height: 250px;
                border-radius: 10px;
            }
            .product-item h6 {
                font-size: 18px;
                margin: 10px 0;
            }
            .product-item a {
                font-size: 16px;
                text-decoration: none;
                color: #888;
            }
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
                                        <li style="width: 200px; padding: 0px; background-color: #3498db"><a href="LoadOrderForUser" style="padding: 0px; color: white"><h4>Đơn hàng<i class='fas fa-sign-out-alt'></i></h4></a>
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
                <li class="col-md-2"> <a href="home.jsp">Trang chủ</a> </li>
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
        <form action="showproduct">
            <div style="text-align: center; align-items: center;
                 display: flex; flex-direction: row; margin: 20px 20px 20px 40px">
                <select name="require">
                    <option value="new" selected>Mới nhất</option>
                    <option value="AtoZ">Từ A đến Z</option>
                    <option value="ZtoA">Từ Z đến A</option>
                    <option value="pricedown">Giá giảm dần</option>
                    <option value="priceup">Giá tăng dần</option>
                </select>
                <button type="submit" style="background-color: #2196F3; color: white; margin-left: 30px">Lọc</button>
                <input type="hidden" name="category" value="${category}">
            </div>
        </form>
        <div class="product-grid ">
            <c:forEach var="product" items="${requestScope.productlist}">
                <div class="product-item ">
                    <img src="${product.getImageURL()}" alt="Ảnh sản phẩm"><br>
                    <a href="productdetail?productid=${product.getProductID()}">${product.getProductName()}</a>
                    <h6><fmt:formatNumber value="${product.getPrice()}" type="number" groupingUsed="true"></fmt:formatNumber> VND</h6>
                    </div>

            </c:forEach>
        </div>
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
    </body>
</html>