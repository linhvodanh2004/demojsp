/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CartItemsDAO;
import DAL.ProductsDAO;
import DAL.ShoppingCartDAO;
import Model.CartItems;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PIXEL
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/addtocart"})
public class AddToCart extends HttpServlet {

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
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        int productID = Integer.parseInt(request.getParameter("productid"));

        String username = "";
        if (request.getSession().getAttribute("username") != null) {
            username = request.getSession().getAttribute("username").toString();
        } else {
            for (Cookie cookie : request.getCookies()) {
                if(cookie.getName().equalsIgnoreCase("username")){
                    username = cookie.getValue();
                    break;
                }
            }
        }
        ShoppingCartDAO cart = new ShoppingCartDAO();
        if (!cart.isCartExisted(username)) {
            cart.add(username);
        }
        CartItemsDAO itemList = new CartItemsDAO();
        
        for(CartItems item : itemList.getCartItemByUser(username)){
            if(item.getProductID() == productID){
                int newQuantity = item.getQuantity() + 1;
                if(item.getQuantity() == new ProductsDAO().getProductByID(productID).getStockQuantity()){
                    newQuantity = item.getQuantity();
                }
                itemList.update(item.getCartID(), item.getProductID(), newQuantity);
                response.sendRedirect("cartlist");
                return;
            }
        }
        itemList.add(cart.getCartByUser(username), productID, 1);
        response.sendRedirect("cartlist");
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
        processRequest(request, response);
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
