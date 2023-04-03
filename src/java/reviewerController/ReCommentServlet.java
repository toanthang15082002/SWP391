/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package reviewerController;

import DAL.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name="ReCommentServlet", urlPatterns={"/recomment"})
public class ReCommentServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ReCommentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReCommentServlet at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        String syllabusID = request.getParameter("syllabusID");
        String curriculumID = request.getParameter("curID");
        String commentID_raw = request.getParameter("commentID");
        String txtReComment_raw = request.getParameter("txtReComment");
        String accountID_raw = request.getParameter("accountID");
        ReviewDAO dao = new  ReviewDAO();
        try {
            int commentID = Integer.parseInt(commentID_raw);
            int accountID = Integer.parseInt(accountID_raw);
            if(curriculumID == ""){
                curriculumID = null;
            } else if(syllabusID ==""){
                syllabusID= null;
            }
            dao.insertReComment(accountID, commentID, txtReComment_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
         if (syllabusID != null) {
            response.sendRedirect("syllabusdetails?syllabusID=" + syllabusID);
        } else if(curriculumID != null){
            response.sendRedirect("curriculumdetail?curid="+curriculumID);
        }
        
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
