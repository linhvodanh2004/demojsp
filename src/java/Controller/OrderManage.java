/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.OrdersDAO;
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
@WebServlet(name="OrderManage", urlPatterns={"/ordermanage"})
public class OrderManage extends HttpServlet {
   
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
            out.println("<title>Servlet OrderManage</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderManage at " + request.getContextPath () + "</h1>");
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
        OrdersDAO dao = new OrdersDAO();
        int count = dao.getTotalOrder();
        int endPage;
        int index;
        if(request.getParameter("index") != null){
            index = Integer.parseInt(request.getParameter("index"));
        }
        else{
            index = 1;
        }
        String require = request.getParameter("require");
        if("Pending".equalsIgnoreCase(require)
                || "Shipping".equalsIgnoreCase(require)
                || "Completed".equalsIgnoreCase(require)
                || "Canceled".equalsIgnoreCase(require)
                ){
            count = dao.getTotalOrderByStatus(require);
            request.setAttribute("orderList", dao.getOrderByStatus(require, index));
        }
        else if("interest".equalsIgnoreCase(require)){
            request.setAttribute("orderList", dao.getOrderByInterest(index));
        }
        else if("new".equalsIgnoreCase(require)){
            request.setAttribute("orderList", dao.getNewestOrder(index));
        }
        else{
            request.setAttribute("orderList", dao.getAll(index));
        }
        endPage = count / 10;
        if(count % 10 != 0){
            endPage++;
        }
        request.setAttribute("endOrder", endPage);
        request.setAttribute("require", require);
        request.getRequestDispatcher("adminpage.jsp").forward(request, response);
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
