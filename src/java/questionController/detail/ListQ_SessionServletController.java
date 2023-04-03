/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package questionController.detail;

import DAL.SessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Session;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ListQ_SessionServletController", urlPatterns = {"/listq_session"})
public class ListQ_SessionServletController extends HttpServlet {

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
            out.println("<title>Servlet ListQ_SessionServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListQ_SessionServletController at " + request.getContextPath() + "</h1>");
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
        SessionDAO sDao = new SessionDAO();
        String syllabusID_raw = request.getParameter("syllabusID");
        String indexPage_raw = request.getParameter("indexPage");
        List<Session> selist = sDao.getSessionBySyllabusID(Integer.parseInt(syllabusID_raw));
        int numPerPage = 10;
        int size = selist.size();
        int page = 1;

        if (indexPage_raw == null) {
            page = 1;
        } else {
            try {
                page = Integer.parseInt(indexPage_raw);
            } catch (Exception e) {
            }
        }
        int numberOfPage = (size % numPerPage == 0 ? size / numPerPage : size / numPerPage + 1);
        int start, end;
        start = (page - 1) * numPerPage;
        end = Math.min(page * numPerPage, size);
        List<Session> listByPage = sDao.listByPage(selist, start, end);

        request.setAttribute("listsy", listByPage);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("page", page);
        request.setAttribute("numpage", numberOfPage);
        request.setAttribute("syllabusID", syllabusID_raw);
        request.getRequestDispatcher("designer/question/listq_session.jsp").forward(request, response);

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
