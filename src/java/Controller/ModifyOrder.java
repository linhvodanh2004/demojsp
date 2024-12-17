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
@WebServlet(name="ModifyOrder", urlPatterns={"/ModifyOrder"})
public class ModifyOrder extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ModifyOrder</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifyOrder at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("orderid"));
        String status = request.getParameter("status");
        String oldStatus = request.getParameter("oldStatus");
        OrdersDAO dao = new OrdersDAO();
        if("Canceled".equalsIgnoreCase(status)){
            OrderItemsDAO oi = new OrderItemsDAO();
            ProductsDAO p = new ProductsDAO();
            
            for(OrderItems i : oi.getOrderByID(orderID)){
                int productID = i.getProductID();
                int subQuantity = i.getQuantity();
                Products product = p.getProductByID(productID);
                p.update(productID, product.getProductName(), product.getDescription(),
                        product.getPrice(), product.getStockQuantity() + subQuantity,
                        product.getImageURL(), product.getCategoryID());
            }
        }
        dao.updateOrderStatus(status, orderID);
        response.sendRedirect("ordermanage?require=" + oldStatus);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
