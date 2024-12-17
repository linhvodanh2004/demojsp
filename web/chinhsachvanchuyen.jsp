<%-- 
    Document   : home
    Created on : Oct 15, 2024, 12:12:59 AM
    Author     : PIXEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chính sách vận chuyển</title>
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
                                        <li style="width: 200px; padding: 0px; background-color: #3498db"><a href="LoadOrderForUser" style="padding: 0px; color: white"><h4>Đơn hàng <i class='fas fa-sign-out-alt'></i></h4></a>
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


        <div style="margin-top: 50px">
            <div style="text-align:  center"><h6>CHÍNH SÁCH VẬN CHUYỂN</h6></div>
            <div style="padding: 0px 125px;">
                <p style="line-height: 50px">
                    <span style="font-weight: bolder;">1. Chính Sách Vận Chuyển</span><br>
                    - Cửa hàng chúng tôi hợp tác với Viettelpost để đảm bảo quá trình giao hàng nhanh chóng và an toàn đến tay khách hàng.<br>
                    - Chúng tôi cam kết cung cấp dịch vụ vận chuyển chất lượng, giúp khách hàng yên tâm khi mua sắm tại cửa hàng.<br><br>

                    <span style="font-weight: bolder;">2. Phạm Vi Giao Hàng</span><br>
                    - Chúng tôi hỗ trợ giao hàng trên toàn quốc, bao gồm cả khu vực nội thành và ngoại thành.<br>
                    - Đơn hàng sẽ được xử lý và giao đến tận nơi theo địa chỉ mà khách hàng cung cấp.<br><br>

                    <span style="font-weight: bolder;">3. Thời Gian Giao Hàng</span><br>
                    - Thời gian giao hàng dự kiến từ 2 - 5 ngày làm việc đối với khu vực nội thành và 3 - 7 ngày làm việc đối với khu vực ngoại thành, tùy vào vị trí địa lý và điều kiện thời tiết.<br>
                    - Trong trường hợp có sự cố hoặc chậm trễ, chúng tôi sẽ thông báo đến khách hàng sớm nhất để điều chỉnh thời gian giao hàng.<br><br>

                    <span style="font-weight: bolder;">4. Phí Vận Chuyển</span><br>
                    - Phí vận chuyển sẽ được tính dựa trên trọng lượng sản phẩm và địa chỉ nhận hàng, theo bảng giá của Viettelpost.<br>
                    - Trong một số trường hợp đặc biệt, cửa hàng sẽ có chương trình miễn phí vận chuyển hoặc hỗ trợ một phần chi phí giao hàng cho khách hàng.<br><br>

                    <span style="font-weight: bolder;">5. Kiểm Tra và Nhận Hàng</span><br>
                    - Khi nhận hàng, quý khách vui lòng kiểm tra kỹ tình trạng sản phẩm và số lượng trước khi ký nhận từ nhân viên giao hàng.<br>
                    - Nếu phát hiện sản phẩm bị hư hỏng hoặc không đúng với đơn đặt hàng, quý khách có thể từ chối nhận hàng và thông báo ngay cho cửa hàng để được hỗ trợ kịp thời.<br><br>

                    <span style="font-weight: bolder;">6. Chính Sách Hủy Đơn Hàng</span><br>
                    - Khách hàng có thể hủy đơn hàng trước khi hàng được gửi đi mà không mất phí. Sau khi đơn hàng đã được giao cho Viettelpost, việc hủy đơn hàng có thể phát sinh chi phí vận chuyển và hoàn trả sản phẩm.<br>
                    - Vui lòng liên hệ với cửa hàng để biết thêm thông tin chi tiết và được hướng dẫn cụ thể.<br><br>

                    Chúng tôi luôn cố gắng mang đến trải nghiệm mua sắm tốt nhất và dịch vụ vận chuyển chuyên nghiệp. Nếu có bất kỳ thắc mắc nào về chính sách vận chuyển, quý khách vui lòng liên hệ với cửa hàng để được giải đáp.
                </p>


            </div>
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
