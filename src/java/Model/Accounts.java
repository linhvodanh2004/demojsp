/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PIXEL
 */
public class Accounts {
    private String username, password;
    private int rollID;

    public Accounts(String username, String password, int rollID) {
        this.username = username;
        this.password = password;
        this.rollID = rollID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRollID() {
        return rollID;
    }

    public void setRollID(int rollID) {
        this.rollID = rollID;
    }
    
}
