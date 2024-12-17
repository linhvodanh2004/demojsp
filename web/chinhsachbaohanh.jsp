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
        <title>Chính sách bảo hành</title>
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
            <div style="text-align:  center"><h6>ĐIỀU KHOẢN DỊCH VỤ</h6></div>
            <div style="padding: 0px 125px;">
                <p style="line-height: 50px">
                    <span style="font-weight: bolder;">1. Chính Sách Đổi Trả 1 Đổi 1 Trong Vòng 1 Tháng</span><br>
                    - Trong vòng 1 tháng kể từ ngày mua hàng, nếu sản phẩm xuất hiện lỗi kỹ thuật từ nhà sản xuất, quý khách có thể đổi sản phẩm mới tương đương.<br>
                    - Điều kiện đổi sản phẩm bao gồm: sản phẩm còn đầy đủ hộp, phụ kiện, tem bảo hành, không có dấu hiệu can thiệp từ bên thứ ba hoặc tác động vật lý gây hỏng hóc.<br>
                    - Sản phẩm phải được kiểm tra và xác nhận lỗi từ phía nhân viên kỹ thuật của cửa hàng.<br><br>

                    <span style="font-weight: bolder;">2. Bảo Hành Chính Hãng 1 Năm</span><br>
                    - Tất cả sản phẩm mua tại cửa hàng đều được bảo hành chính hãng trong vòng 1 năm kể từ ngày mua.<br>
                    - Chính sách bảo hành áp dụng đối với các sản phẩm bao gồm bàn phím, chuột, và tai nghe mà cửa hàng phân phối.<br>
                    - Quý khách có thể liên hệ trực tiếp với cửa hàng hoặc trung tâm bảo hành chính hãng để được hỗ trợ nhanh chóng.<br><br>

                    <span style="font-weight: bolder;">3. Điều Kiện Áp Dụng Bảo Hành</span><br>
                    - Bảo hành sẽ được áp dụng nếu sản phẩm gặp lỗi thuộc về nhà sản xuất như lỗi phần cứng, lỗi kết nối, hoặc lỗi về chất lượng sản phẩm.<br>
                    - Các trường hợp không được bảo hành bao gồm: sản phẩm bị hư hỏng do sử dụng sai cách, rơi vỡ, tác động từ môi trường (ẩm, mốc, nhiệt độ cao), hoặc đã qua sửa chữa tại các địa chỉ không được ủy quyền.<br>
                    - Để đảm bảo quyền lợi bảo hành, quý khách vui lòng giữ lại hóa đơn mua hàng, tem bảo hành và các giấy tờ liên quan khi yêu cầu bảo hành.<br><br>

                    <span style="font-weight: bolder;">4. Quy Trình Bảo Hành</span><br>
                    - Quý khách vui lòng mang sản phẩm và các giấy tờ liên quan đến cửa hàng để được kiểm tra và xác định tình trạng lỗi.<br>
                    - Nếu sản phẩm đủ điều kiện bảo hành, cửa hàng sẽ tiến hành gửi sản phẩm đến trung tâm bảo hành chính hãng.<br>
                    - Thời gian xử lý bảo hành có thể dao động từ 7 - 14 ngày làm việc, tùy thuộc vào tình trạng của sản phẩm và yêu cầu sửa chữa từ hãng.<br><br>

                    <span style="font-weight: bolder;">5. Lưu Ý Khi Bảo Hành</span><br>
                    - Trong một số trường hợp, nếu sản phẩm không thể sửa chữa và không còn sản phẩm tương đương để đổi, cửa hàng sẽ hỗ trợ khách hàng chọn sản phẩm khác hoặc hoàn tiền theo giá trị sản phẩm tại thời điểm mua hàng.<br>
                    - Chính sách bảo hành không áp dụng đối với các phụ kiện kèm theo như dây cáp, đệm tai nghe hoặc hộp sản phẩm. Những phụ kiện này chỉ được bảo hành nếu có quy định cụ thể từ hãng.<br><br>

                    Chúng tôi cam kết luôn đặt sự hài lòng của khách hàng lên hàng đầu, và mong muốn mang đến trải nghiệm mua sắm tuyệt vời nhất. Nếu có bất kỳ thắc mắc nào về chính sách bảo hành và đổi trả, quý khách vui lòng liên hệ với cửa hàng để được hỗ trợ.
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
