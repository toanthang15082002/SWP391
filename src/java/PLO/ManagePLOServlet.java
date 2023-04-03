/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package PLO;

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
@WebServlet(name = "ManagePLOServlet", urlPatterns = {"/manageplo"})
public class ManagePLOServlet extends HttpServlet {

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
            out.println("<title>Servlet ManagePLOServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagePLOServlet at " + request.getContextPath() + "</h1>");
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
        CurriculumDAO dao = new CurriculumDAO();
        String indexPage = request.getParameter("page");
        if (indexPage == null) {
            indexPage = "1";
        }
        int page = Integer.parseInt(indexPage);
        int count = dao.getTotalPlo();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }
        
        List<Curriculum> listCur = dao.getAllCurriculum();
        List<Plo> listPlo = dao.getAllPLOPaging(page);
        
        request.setAttribute("count", count);
        request.setAttribute("tag", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listPlo", listPlo);
        request.setAttribute("listCur", listCur);
        request.getRequestDispatcher("designer/listplo.jsp").forward(request, response);
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
        String raw_id = request.getParameter("curid");
        int id;
        CurriculumDAO dao = new CurriculumDAO();

        try {
            id = Integer.parseInt(raw_id);
            List<Plo> listPlo = dao.getPLOByCurriculumID(id);
            Curriculum cur = dao.getCurriculumByID(id);
            List<Curriculum> listCur = dao.getAllCurriculum();
            request.setAttribute("cur", cur);
            request.setAttribute("curid", id);
            request.setAttribute("listCur", listCur);
            request.setAttribute("listPlo", listPlo);
        } catch (Exception e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("designer/listplo.jsp").forward(request, response);
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
