/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assessmentController.detail;

import DAL.AssessmentDAO;
import DAL.SyllabusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Assessment;
import model.Syllabus;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ListAssessmentServletController", urlPatterns = {"/listassessment"})
public class ListAssessmentServletController extends HttpServlet {

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
            out.println("<title>Servlet ListAssessmentServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListAssessmentServletController at " + request.getContextPath() + "</h1>");
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
        AssessmentDAO aDao = new AssessmentDAO();
        SyllabusDAO syDao = new SyllabusDAO();
        String syllabusID_raw = request.getParameter("syllabusID");
        String indexPage_raw = request.getParameter("indexPage");
        List<Assessment> aslist = aDao.getAssessmentBySyllabusID(Integer.parseInt(syllabusID_raw));
        int numPerPage = 2;
        int size = aslist.size();
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
        List<Assessment> listByPage = aDao.listByPage(aslist, start, end);
        request.setAttribute("listass", listByPage);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("page", page);
        request.setAttribute("numpage", numberOfPage);
        request.setAttribute("syllabusID", syllabusID_raw);
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        request.setAttribute("sylist", syDao.getAllSyllabusByAccID(a.getAccountID()));
        request.getRequestDispatcher("designer/assessment/listassessment.jsp").forward(request, response);

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
        String sbysyllabusid_raw = request.getParameter("sbysyllabusid");
        AssessmentDAO sDao = new AssessmentDAO();
        String indexPage_raw = request.getParameter("indexPage");
        List<Assessment> selist = sDao.getAssessmentBySyllabusID(Integer.parseInt(sbysyllabusid_raw));
        int numPerPage = 2;
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
        List<Assessment> listByPage = sDao.listByPage(selist, start, end);
        SyllabusDAO syDao = new SyllabusDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        request.setAttribute("listass", listByPage);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("page", page);
        request.setAttribute("numpage", numberOfPage);
        request.setAttribute("syllabusID", sbysyllabusid_raw);

        request.setAttribute("sylist", syDao.getAllSyllabusByAccID(a.getAccountID()));
        request.getRequestDispatcher("designer/assessment/listassessment.jsp").forward(request, response);

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
