/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProductsDAO;
import Model.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PIXEL
 */
@WebServlet(name = "ProductManage", urlPatterns = {"/productmanage"})
public class ProductManage extends HttpServlet {

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
            out.println("<title>Servlet ProductManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManage at " + request.getContextPath() + "</h1>");
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
        ProductsDAO dao = new ProductsDAO();
        int count;
        int endPage;
        int index;
        if(request.getParameter("index") != null){
         index = Integer.parseInt(request.getParameter("index"));}
        else{index = 1;}
        
        count = dao.getTotalProduct();

        String category = request.getParameter("category");
        if ("quantityasc".equalsIgnoreCase(category)) {
            request.setAttribute("productlist", dao.searchByQuantityASC(index));
        } else if ("quantitydesc".equalsIgnoreCase(category)) {
            request.setAttribute("productlist", dao.searchByQuantityDESC(index));
        } else if ("keyboard".equalsIgnoreCase(category)) {
            count = dao.getTotalByCategory(1111);
            request.setAttribute("productlist", dao.getListByCategory(1111, index));
        } else if ("mouse".equalsIgnoreCase(category)) {
            count = dao.getTotalByCategory(2222);
            request.setAttribute("productlist", dao.getListByCategory(2222, index));
        } else if ("headphone".equalsIgnoreCase(category)) {
            count = dao.getTotalByCategory(3333);
            request.setAttribute("productlist", dao.getListByCategory(3333, index));
        } else if ("accessory".equalsIgnoreCase(category)) {
            count = dao.getTotalByCategory(4444);
            request.setAttribute("productlist", dao.getListByCategory(4444, index));
        } else {
            request.setAttribute("productlist", dao.getAll(index));
        }
        
        endPage = count / 10;
        if(count % 10 != 0){
            endPage++;
        }
        
        request.setAttribute("endProduct", endPage);
        request.setAttribute("category", category);
        request.getRequestDispatcher("adminpage.jsp").forward(request, response);
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
