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
import java.util.ArrayList;
import model.Comment;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author admin
 */
@WebServlet(name = "CommentServlet", urlPatterns = {"/comment"})
public class CommentServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath() + "</h1>");
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
        String syllabusID = request.getParameter("syllabusID");
        String curriculumID = request.getParameter("curID");
        ReviewDAO dao = new ReviewDAO();
        String textComment = request.getParameter("txtComment");
        String accoutnID_raw = request.getParameter("accountID");
        String date = new Comment().getDateNow();
        try {
            int accountID = Integer.parseInt(accoutnID_raw);
            if(curriculumID == ""){
                curriculumID = null;
            } else if(syllabusID ==""){
                syllabusID= null;
            }
            dao.insertComment(accountID, textComment, date, syllabusID, curriculumID);
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
