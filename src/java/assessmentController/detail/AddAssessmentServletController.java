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
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddAssessmentServletController", urlPatterns = {"/addassessment"})
public class AddAssessmentServletController extends HttpServlet {

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
            out.println("<title>Servlet AddAssessmentServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAssessmentServletController at " + request.getContextPath() + "</h1>");
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
        String syllabusID_raw = request.getParameter("syllabusID");
        SyllabusDAO dao = new SyllabusDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        request.setAttribute("listSyllabus", dao.getAllSyllabusByAccID(a.getAccountID()));
        request.setAttribute("syllabusID", syllabusID_raw);
        request.getRequestDispatcher("designer/assessment/addassessment.jsp").forward(request, response);
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
        String syllabusID_raw = request.getParameter("syllabusID");
        String category = request.getParameter("category");
        String type = request.getParameter("type");
        String part_raw = request.getParameter("part");
        String weight_raw = request.getParameter("weight");
        String completioncriteria = request.getParameter("completioncriteria");
        String duration = request.getParameter("duration");
        String clo = request.getParameter("clo");
        String questionType = request.getParameter("questiontype");
        String noQuestion = request.getParameter("noquestion");
        String knowledgeAndSkill = request.getParameter("kas");
        String grandingGuide = request.getParameter("grandingguide");
        String note = request.getParameter("note");
        System.out.println(type);
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        SyllabusDAO dao = new SyllabusDAO();

        AssessmentDAO adao = new AssessmentDAO();

        try {
            int part = Integer.parseInt(part_raw);
            int weight = Integer.parseInt(weight_raw);
            adao.insertAssessment(Integer.parseInt(syllabusID_raw), category, Integer.parseInt(type),
                    part, weight, completioncriteria, duration, clo,
                    questionType, noQuestion, knowledgeAndSkill, grandingGuide, note);
            request.setAttribute("listSyllabus", dao.getAllSyllabusByAccID(a.getAccountID()));
            request.setAttribute("syllabusID", syllabusID_raw);
        } catch (Exception e) {
            System.out.println();
        }
        response.sendRedirect("listassessment?syllabusID=" + syllabusID_raw);

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
