/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sessionController.detail;

import DAL.SessionDAO;
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
import model.Syllabus;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddSessionServletController", urlPatterns = {"/addsession"})
public class AddSessionServletController extends HttpServlet {

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
            out.println("<title>Servlet AddSessionServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSessionServletController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("designer/session/addsession.jsp").forward(request, response);
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
        String sNo_raw = request.getParameter("sno");
        String topic = request.getParameter("topic");
        String learningTeachingType_raw = request.getParameter("learningteachingtype");
        String lo = request.getParameter("lo");
        String itu = request.getParameter("itu");
        String studentMaterial = request.getParameter("studentmaterial");
        String studentTask = request.getParameter("studenttask");
        String sDownload = request.getParameter("sdownload");
        String url = request.getParameter("url");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        SessionDAO dao = new SessionDAO();
        SyllabusDAO syDao = new SyllabusDAO();
        System.out.println(sNo_raw);
        try {
            boolean learningTeachingType = Boolean.parseBoolean(learningTeachingType_raw);
            int sNo = Integer.parseInt(sNo_raw);
            int syllabusID = Integer.parseInt(syllabusID_raw);
            if (dao.checkExistSNo(syllabusID, sNo)) {
                System.out.println(sNo);
                String ms = "sNo is Existed";
                request.setAttribute("ms", ms);
                request.setAttribute("syllabusID", syllabusID_raw);
                request.setAttribute("listSyllabus", syDao.getAllSyllabusByAccID(a.getAccountID()));
                request.getRequestDispatcher("designer/session/addsession.jsp").forward(request, response);
            } else {
                dao.insertSession(topic, learningTeachingType, lo, itu, studentMaterial, studentTask, syllabusID, sNo, sDownload, url);
                response.sendRedirect("listsession?syllabusID=" + syllabusID_raw);

            }

        } catch (Exception e) {
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
