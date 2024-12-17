/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.CartItems;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PIXEL
 */
public class CartItemsDAO extends DBContext {

    public List<CartItems> getAll() {
        List<CartItems> list = new ArrayList<>();
        String sql = "SELECT * FROM CartItems;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                int cartItemID = rs.getInt("CartItemID");
                int productID = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                CartItems item = new CartItems(cartItemID, cartID, productID, quantity);
                list.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void add(int cartID, int productID, int quantity){
        String sql = "INSERT INTO CartItems(CartID, ProductID, Quantity) VALUES(?, ?, ?); ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cartID);
            pre.setInt(2, productID);
            pre.setInt(3, quantity);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void delete(int cartID, int productID){
        String sql = "DELETE FROM CartItems WHERE CartID = ? AND ProductID = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cartID);
            pre.setInt(2, productID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void update (int cartID, int productID, int quantity){
        String sql = "UPDATE CartItems SET Quantity = ? WHERE CartID = ? AND ProductID = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, quantity);
            pre.setInt(2, cartID);
            pre.setInt(3, productID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
   
    public List<CartItems> getCartItemByUser(String username) {
        List<CartItems> list = new ArrayList<>();
        String sql = "select CartItemID, c.CartID, ProductID, Quantity from CartItems c, ShoppingCart s where (c.CartID = s.CartID) AND (s.Username = ?);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                int cartItemID = rs.getInt("CartItemID");
                int productID = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                CartItems item = new CartItems(cartItemID, cartID, productID, quantity);
                list.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<CartItems> getCartItemByID(int id) {
        List<CartItems> list = new ArrayList<>();
        String sql = "select * from CartItems where CartID = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                int cartItemID = rs.getInt("CartItemID");
                int productID = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                CartItems item = new CartItems(cartItemID, cartID, productID, quantity);
                list.add(item);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteCartItem(int cartID){
        String sql = "DELETE FROM CartItems WHERE CartID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cartID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
