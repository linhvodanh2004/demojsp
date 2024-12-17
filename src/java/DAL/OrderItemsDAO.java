/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.OrderItems;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PIXEL
 */
public class OrderItemsDAO extends DBContext {

    public List<OrderItems> getOrderByID(int orderID) {
        List<OrderItems> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderItems WHERE OrderID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderItemID = rs.getInt("OrderItemID");
                int OrderID = rs.getInt("OrderID");
                int ProductID = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                int UnitPrice = rs.getInt("UnitPrice");
                int TotalPrice = rs.getInt("TotalPrice");
                OrderItems item = new OrderItems(OrderItemID, OrderID, ProductID, quantity, UnitPrice, TotalPrice);
                list.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertOrderItem(int orderID, int cartID) {
        // insert item from cart into order just generated
        String insertOrderItemQuery = "INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice, TotalPrice) "
                + "SELECT ?, ci.ProductID, ci.Quantity, p.Price, ci.Quantity * p.Price "
                + "FROM CartItems ci "
                + "JOIN Products p ON ci.ProductID = p.ProductID "
                + "WHERE ci.CartID = ?";
        try {
            PreparedStatement insertOrderItemStmt = connection.prepareStatement(insertOrderItemQuery);
            insertOrderItemStmt.setInt(1, orderID);
            insertOrderItemStmt.setInt(2, cartID);
            insertOrderItemStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int getInterestByOrder(int orderID){
        String sql = "SELECT SUM(TotalPrice) AS Interest FROM OrderItems WHERE OrderID = ?";
        int interest = 0;
        try {
            PreparedStatement insertOrderItemStmt = connection.prepareStatement(sql);
            insertOrderItemStmt.setInt(1, orderID);
            ResultSet rs = insertOrderItemStmt.executeQuery();
            while(rs.next()){
                interest = rs.getInt("Interest");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return interest;
    }
}
