/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Accounts;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PIXEL
 */
public class AccountsDAO extends DBContext {

    public List<Accounts> getAll() {
        List<Accounts> list = new ArrayList<>();
        String sql = "SELECT * FROM Accounts ORDER BY RoleID ASC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                int roleID = rs.getInt("RoleID");
                Accounts account = new Accounts(username, password, roleID);
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Accounts> getAccountByRole(int role) {
        List<Accounts> list = new ArrayList<>();
        String sql = "SELECT * FROM Accounts WHERE RoleID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, role);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                int roleID = rs.getInt("RoleID");
                Accounts account = new Accounts(username, password, roleID);
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public void insert(Accounts account){
        String sql = "INSERT INTO Accounts (Username, Password, RoleID) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, account.getUsername());
            pre.setString(2, account.getPassword());
            pre.setInt(3, account.getRollID());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void delete(String username){
        String sql = "DELETE FROM Accounts WHERE Username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void update(String username, String password){
        String sql = "UPDATE Accounts SET Password = ? WHERE Username = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, password);
            pre.setString(2, username);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Accounts getAccountByName(String name){
        Accounts account = null;
        String sql = "SELECT * FROM Accounts WHERE Username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                int roleID = rs.getInt("RoleID");
                account = new Accounts(username, password, roleID);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return account;
    }
}
