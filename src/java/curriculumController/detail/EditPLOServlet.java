/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package curriculumController.detail;

import DAL.CurriculumDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Curriculum;
import model.Plo;

/**
 *
 * @author Thang
 */
@WebServlet(name = "EditPLOServlet", urlPatterns = {"/editplo"})
public class EditPLOServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPLOServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPLOServlet at " + request.getContextPath() + "</h1>");
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
        String ploid = request.getParameter("ploid");
        String curid_raw = request.getParameter("curid");
        int curid;
        CurriculumDAO dao = new CurriculumDAO();
        try {
            curid = Integer.parseInt(curid_raw);
            Curriculum cur = dao.getCurriculumByID(curid);
            request.setAttribute("cur", cur);
        } catch (NumberFormatException e) {
        }
        
        Plo plo = dao.getPLOByID(ploid);
        
        request.setAttribute("plo", plo);
        request.getRequestDispatcher("designer/editplo.jsp").forward(request, response);
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
        String ploid_raw = request.getParameter("ploid");
        String ploName = request.getParameter("ploName");
        String ploDescription = request.getParameter("ploDescription");
        String curid_raw = request.getParameter("curid");
        
        CurriculumDAO dao = new CurriculumDAO();
        try {
            int curid, ploid;
            ploid = Integer.parseInt(ploid_raw);
            curid = Integer.parseInt(curid_raw);
            Plo p = new Plo(ploid, ploName, ploDescription, curid);
            dao.editPlo(p);
            
        } catch (NumberFormatException e) {
        }
        
        response.sendRedirect("manageplo");
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
