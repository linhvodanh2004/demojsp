/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Products;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author PIXEL
 */
public class ProductsDAO extends DBContext {

    public List<Products> getAll(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products Order By ProductID "
                + " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Products> getAll() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Products";
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

    public void insert(String productName, String description, int price, int stockQuantity, String imageURL, int categoryID) {
        String sql = "INSERT INTO Products(ProductName, Description, Price, StockQuantity, ImageURL, CategoryID) VALUES(?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, productName);
            pre.setString(2, description);
            pre.setInt(3, price);
            pre.setInt(4, stockQuantity);
            pre.setString(5, imageURL);
            pre.setInt(6, categoryID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int productID) {
        String sql = "delete from products where ProductID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, productID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(int productID, String productName, String description, int price, int stockQuantity, String imageURL, int categoryID) {
        String sql = "update products set ProductName = ?, Description = ?, Price = ?, StockQuantity = ?, ImageURL = ?, CategoryID = ? WHERE ProductID = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, productName);
            pre.setString(2, description);
            pre.setInt(3, price);
            pre.setInt(4, stockQuantity);
            pre.setString(5, imageURL);
            pre.setInt(6, categoryID);
            pre.setInt(7, productID);
            pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Products> getListByCategory(int category, int index) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE CategoryID = ? "
                + " Order By ProductID OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            pre.setInt(2, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalByCategory(int category) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Products WHERE CategoryID = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public Products getProductByID(int id) {
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Products> getPageInStock(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products where StockQuantity > 0"
                + " Order By ProductID DESC OFFSET ? ROWS FETCH NEXT 42 ROWS ONLY ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 42);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Products> getInStock() {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products where StockQuantity > 0";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalInstock() {
        int count = 0;
        String sql = "select count(*) from Products where StockQuantity > 0";
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

    public List<Products> getCategoryInStock(int category) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE (CategoryID = ?) AND (StockQuantity > 0)"
                + " Order by ProductID desc;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> searchReadyProduct(String name) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products where (LOWER(ProductName) LIKE ?) AND (StockQuantity > 0);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> searchByQuantityASC(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products Order By StockQuantity ASC "
                + " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> searchByQuantityDESC(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products Order By StockQuantity DESC "
                + " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 10);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//    public List<Products> getOutStock() {
//        List<Products> list = new ArrayList<>();
//        String sql = "select * from Products where StockQuantity = 0";
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            ResultSet rs = pre.executeQuery();
//            while (rs.next()) {
//                int productID = rs.getInt("ProductID");
//                String productName = rs.getString("ProductName");
//                String description = rs.getString("Description");
//                int price = rs.getInt("Price");
//                int stockQuantity = rs.getInt("StockQuantity");
//                String imageURL = rs.getString("ImageURL");
//                int categoryID = rs.getInt("CategoryID");
//
//                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
//                list.add(product);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    public List<Products> searchAllProduct(String name) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products where (LOWER(ProductName) LIKE ?);";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");
                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateAfterOrder(int orderID) {
        String updateProductQuantityQuery = "UPDATE p SET p.StockQuantity = "
                + "p.StockQuantity - oi.Quantity FROM Products p JOIN "
                + "OrderItems oi ON p.ProductID = oi.ProductID WHERE"
                + " oi.OrderID = ?;";
        try {
            PreparedStatement updateProductQuantityStmt = connection.prepareStatement(updateProductQuantityQuery);
            updateProductQuantityStmt.setInt(1, orderID);
            updateProductQuantityStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Products> getMostPopular() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * From Products p JOIN ( "
                + "SELECT TOP(8) o.ProductID FROM OrderItems o "
                + "GROUP BY o.ProductID Order BY SUM(o.Quantity) DESC) "
                + "topProducts ON p.ProductID = topProducts.ProductID WHERE p.StockQuantity > 0";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Products getMostProductByDate(Date dateFrom, Date dateTo) {
        String sql = "SELECT * From Products p JOIN (SELECT TOP(1) oi.ProductID FROM OrderItems oi, Orders o "
                + "WHERE (o.OrderDate BETWEEN ? AND ?) AND (o.OrderStatus = 'Completed') AND (o.OrderID = oi.OrderID)"
                + "GROUP BY oi.ProductID Order BY SUM(oi.Quantity) DESC) \n"
                + "topProducts ON p.ProductID = topProducts.ProductID";
        Products product = null;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(dateFrom.getTime()));
            pre.setDate(2, new java.sql.Date(dateTo.getTime()));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }

    public List<Products> getNewArrival() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT TOP(8) * FROM Products WHERE StockQuantity > 0 Order By ProductID DESC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getEventProduct() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT TOP(8) * FROM Products WHERE (ProductID "
                + " IN(87,88,111,112,113,114,115,116)) AND (StockQuantity > 0)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getListByPriceASC(int category) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (CategoryID = ?) AND (StockQuantity > 0) "
                + " Order by Price ASC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getListByPriceDESC(int category) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (CategoryID = ?) AND (StockQuantity > 0) "
                + " Order by Price DESC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getListByNameASC(int category) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (CategoryID = ?) AND (StockQuantity > 0) "
                + " Order by ProductName ASC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getListByNameDESC(int category) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (CategoryID = ?) AND (StockQuantity > 0) "
                + " Order by ProductName DESC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getPageListByPriceASC(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (StockQuantity > 0) "
                + " Order by Price ASC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 20);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getPageListByPriceDESC(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (StockQuantity > 0) "
                + " Order by Price DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 20);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getPageListByNameASC(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (StockQuantity > 0) "
                + " Order by ProductName ASC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 20);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getPageListByNameDESC(int index) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where (StockQuantity > 0) "
                + " Order by ProductName DESC OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, (index - 1) * 20);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                int price = rs.getInt("Price");
                int stockQuantity = rs.getInt("StockQuantity");
                String imageURL = rs.getString("ImageURL");
                int categoryID = rs.getInt("CategoryID");

                Products product = new Products(productName, description, categoryID, productID, price, stockQuantity, imageURL);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
