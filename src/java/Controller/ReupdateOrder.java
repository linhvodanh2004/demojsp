/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.OrderItemsDAO;
import DAL.OrdersDAO;
import DAL.ProductsDAO;
import Model.OrderItems;
import Model.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PIXEL
 */
@WebServlet(name = "ReupdateOrder", urlPatterns = {"/ReupdateOrder"})
public class ReupdateOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReupdateOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReupdateOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String shipping = request.getParameter("shipping");
        int orderID = Integer.parseInt(request.getParameter("orderid").trim());
        String submit = request.getParameter("submit");
        int shippingFee;
        String shippingMethod;

        if (shipping.equalsIgnoreCase("economical")) {
            shippingFee = 40000;
            shippingMethod = "Tiết kiệm";
        } else {
            shippingFee = 100000;
            shippingMethod = "Nhanh";
        }

        OrdersDAO dao = new OrdersDAO();
        if (submit.equalsIgnoreCase("cancel")) {
            dao.updateOrderStatus("Canceled", orderID);

            OrderItemsDAO oi = new OrderItemsDAO();
            ProductsDAO p = new ProductsDAO();

            for (OrderItems i : oi.getOrderByID(orderID)) {
                int productID = i.getProductID();
                int subQuantity = i.getQuantity();
                Products product = p.getProductByID(productID);
                p.update(productID, product.getProductName(), product.getDescription(),
                        product.getPrice(), product.getStockQuantity() + subQuantity,
                        product.getImageURL(), product.getCategoryID());
            }

        } else {
            dao.updateOrderInfo(fullName, phone, address, orderID);
            dao.updatePaidAndShip(orderID, shippingFee, shippingMethod);
        }
        response.sendRedirect("LoadOrderForUser");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
