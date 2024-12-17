/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Orders;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author PIXEL
 */
public class OrdersDAO extends DBContext {

    public List<Orders> getAll(int index) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders Order By OrderID"
                + " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                String username = rs.getString("Username");
                Date date = rs.getDate("OrderDate");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int paidPrice = rs.getInt("PaidPrice");
                String status = rs.getString("OrderStatus");
                String shippingMethod = rs.getString("ShippingMethod");
                Orders order = new Orders(orderID, username, date, fullName, phone, address, status, paidPrice, shippingMethod);
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalOrder() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Orders";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public List<Orders> getOrderByInterest(int index) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.Username, o.FullName, o.Phone, o.Address, "
                + "       o.OrderDate, o.PaidPrice, o.OrderStatus, o.ShippingMethod,  "
                + "       SUM(oi.TotalPrice) AS Interest "
                + "FROM Orders o "
                + "JOIN OrderItems oi ON o.OrderID = oi.OrderID "
                + "GROUP BY o.OrderID, o.Username, o.FullName, o.Phone,  "
                + "o.Address, o.OrderDate, o.PaidPrice, o.OrderStatus, o.ShippingMethod"
                + " Order BY Interest DESC OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                String username = rs.getString("Username");
                Date date = rs.getDate("OrderDate");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int paidPrice = rs.getInt("PaidPrice");
                String status = rs.getString("OrderStatus");
                String shippingMethod = rs.getString("ShippingMethod");
                Orders order = new Orders(orderID, username, date, fullName, phone, address, status, paidPrice, shippingMethod);
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Orders> getNewestOrder(int index) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders Order By OrderDate DESC "
                + " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                String username = rs.getString("Username");
                Date date = rs.getDate("OrderDate");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int paidPrice = rs.getInt("PaidPrice");
                String status = rs.getString("OrderStatus");
                String shippingMethod = rs.getString("ShippingMethod");
                Orders order = new Orders(orderID, username, date, fullName, phone, address, status, paidPrice, shippingMethod);
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateOrderStatus(String status, int orderID) {
        String sql = "UPDATE Orders set OrderStatus = ? WHERE OrderID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, orderID);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateOrderInfo(String fullName, String phone, String address, int orderID) {
        String sql = "UPDATE Orders set FullName = ?, Phone = ?, Address = ? WHERE OrderID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, fullName);
            pre.setString(2, phone);
            pre.setString(3, address);
            pre.setInt(4, orderID);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Orders> getOrderByStatus(String status, int index) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE OrderStatus = ? Order By "
                + " OrderID OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                String username = rs.getString("Username");
                Date date = rs.getDate("OrderDate");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int paidPrice = rs.getInt("PaidPrice");
                String shippingMethod = rs.getString("ShippingMethod");
                Orders order = new Orders(orderID, username, date, fullName, phone, address, status, paidPrice, shippingMethod);
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalOrderByStatus(String status) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Orders WHERE OrderStatus = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, status);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public int getTotalMoneyByDate(Date dateFrom, Date dateTo) {
        int totalMoney = 0;
        String sql = "select sum(oi.TotalPrice) from OrderItems oi, "
                + " Orders o WHERE (oi.OrderID = o.OrderID) AND (o.OrderDate "
                + " between ? AND ? ) "
                + "AND (o.OrderStatus = 'Completed')";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(dateFrom.getTime()));
            pre.setDate(2, new java.sql.Date(dateTo.getTime()));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                totalMoney = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalMoney;
    }

    public int getTotalCompletedOrdersByDate(Date dateFrom, Date dateTo) {
        int count = 0;
        String sql = "SELECT Count(*) FROM Orders WHERE (OrderDate between ? and ?)"
                + " AND (OrderStatus = 'Completed') ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(dateFrom.getTime()));
            pre.setDate(2, new java.sql.Date(dateTo.getTime()));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public float getCancelPercentage(Date dateFrom, Date dateTo) {
        int cancelCount = 0, totalCount = 0;
        String sql = "select count(*) from Orders where OrderStatus = 'Canceled'"
                + " and (OrderDate between ? AND ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(dateFrom.getTime()));
            pre.setDate(2, new java.sql.Date(dateTo.getTime()));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                cancelCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        sql = "select count(*) from Orders where OrderDate between ? AND ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(dateFrom.getTime()));
            pre.setDate(2, new java.sql.Date(dateTo.getTime()));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                totalCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        float percent = (float) cancelCount / (float) totalCount * 100;
        return percent;

    }

    public void updatePaidAndShip(int orderID, int shippingFee, String shippingMethod) {
        String updatePaidPrice = "UPDATE o SET o.ShippingMethod = ?, "
                + " o.PaidPrice = (SELECT SUM(oi.TotalPrice)"
                + " FROM OrderItems oi WHERE oi.OrderID = o.OrderID) + ? FROM Orders o "
                + "WHERE o.OrderID = ?;";
        try {
            PreparedStatement updatePaid = connection.prepareStatement(updatePaidPrice);
            updatePaid.setString(1, shippingMethod);
            updatePaid.setInt(2, shippingFee);
            updatePaid.setInt(3, orderID);
            updatePaid.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int createOrder(int cartID, String fullName, String phone,
            String address, int shippingFee, String shippingMethod) {

        // get username by cartid
        String username = new ShoppingCartDAO().getUsernameByID(cartID);
        String insertOrder = "INSERT INTO Orders(Username, OrderDate, FullName,"
                + " Phone, Address, OrderStatus) VALUES(?, CAST(GETDATE() AS DATE)"
                + ", ?, ?, ?, 'Pending')";
//        String insertOrder = "INSERT INTO Orders(Username, OrderDate, FullName,"
//                + " Phone, Address, OrderStatus) VALUES(?, '2024-09-05'"
//                + ", ?, ?, ?, 'Pending')";
        int orderID = 0;
        try {
            // create new order
            PreparedStatement createOrder = connection.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
            createOrder.setString(1, username);
            createOrder.setString(2, fullName);
            createOrder.setString(3, phone);
            createOrder.setString(4, address);
            createOrder.executeUpdate();

            // get order ID of order just generated
            ResultSet generatedKeys = createOrder.getGeneratedKeys();
            if (generatedKeys.next()) {
                orderID = generatedKeys.getInt(1);
            }
            createOrder.close();
            System.out.println(orderID);
            // insert order items
            new OrderItemsDAO().insertOrderItem(orderID, cartID);

            // delete cartitem and cart
            new CartItemsDAO().deleteCartItem(cartID);
            new ShoppingCartDAO().deleteCart(cartID);

            // update quantity in stock
            new ProductsDAO().updateAfterOrder(orderID);

            // update the paid price of order equal to price of total products ship
            updatePaidAndShip(orderID, shippingFee, shippingMethod);

        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderID;
    }

    public List<Orders> getOrderByUsername(String username) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE Username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                Date date = rs.getDate("OrderDate");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int paidPrice = rs.getInt("PaidPrice");
                String status = rs.getString("OrderStatus");
                String shippingMethod = rs.getString("ShippingMethod");
                Orders order = new Orders(orderID, username, date, fullName, phone, address, status, paidPrice, shippingMethod);
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Orders getOrderByID(int orderID) {
        Orders order = null;
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String username = rs.getString("Username");
                Date date = rs.getDate("OrderDate");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                int paidPrice = rs.getInt("PaidPrice");
                String status = rs.getString("OrderStatus");
                String shippingMethod = rs.getString("ShippingMethod");
                order = new Orders(orderID, username, date, fullName, phone, address, status, paidPrice, shippingMethod);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return order;
    }

    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date1 = sdf.parse("2024-10-01");
            Date date2 = sdf.parse("2024-10-31");
            System.out.println(new OrdersDAO().getCancelPercentage(date1, date2));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
