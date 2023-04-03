/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package questionController.detail;

import DAL.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class EditQuestionServletController extends HttpServlet {

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
            out.println("<title>Servlet EditQuestionServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditQuestionServletController at " + request.getContextPath() + "</h1>");
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
        String qid_raw = request.getParameter("qid");
        QuestionDAO dao = new QuestionDAO();
        try {
            int qid = Integer.parseInt(qid_raw);
            request.setAttribute("qlist", dao.getOneQuestionbySessionID(qid));
            request.setAttribute("qid", qid);

        } catch (Exception e) {
        }
        request.getRequestDispatcher("designer/question/editquestion.jsp").forward(request, response);
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
        String qid_raw = request.getParameter("qid");
        String sid_raw = request.getParameter("sid");
        String questionName = request.getParameter("questionname");
        String detail = request.getParameter("detail");
        QuestionDAO dao = new QuestionDAO();
        int qid, sid;
        response.getWriter().write(detail);
        try {
            qid = Integer.parseInt(qid_raw);
            sid = Integer.parseInt(sid_raw);
            Question q = dao.getOneQuestionbySessionID(qid);
            q.setNameQuestion(questionName);
            q.setDetail(detail);
            dao.editQuestion(q);
        } catch (NumberFormatException e) {
            System.out.println("edit" + e);
        }
        response.sendRedirect("showquestion?sid=" + sid_raw);
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
