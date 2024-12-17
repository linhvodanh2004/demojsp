/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.ShoppingCart;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PIXEL
 */
public class ShoppingCartDAO extends DBContext{
    public List<ShoppingCart> getAll() {
        List<ShoppingCart> list = new ArrayList<>();
        String sql = "SELECT * FROM ShoppingCart;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                String username = rs.getString("Username");           
                ShoppingCart sp = new ShoppingCart(cartID, username);
                list.add(sp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean isCartExisted(String username){
        for(ShoppingCart cart : getAll()){
            if(cart.getUserName().equalsIgnoreCase(username)){
                return true;
            }
        }
        return false;
    }
    
    public void add(String username){
        String sql = "INSERT INTO ShoppingCart(Username) VALUES (?);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteCart(int cartID){
        String sql = "DELETE FROM ShoppingCart WHERE CartID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cartID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int getCartByUser(String username){
        int cart = -1;
        String sql = "SELECT CartID FROM ShoppingCart WHERE Username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                cart = rs.getInt("CartID");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cart;
    }
    
    public String getUsernameByID(int id){
        String username = null;
        String sql = "SELECT username FROM ShoppingCart WHERE CartID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                username = rs.getString("Username");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return username;
    }

}
