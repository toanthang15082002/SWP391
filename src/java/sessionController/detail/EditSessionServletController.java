/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sessionController.detail;

import DAL.SessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Session;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditSessionServletController", urlPatterns = {"/editsession"})
public class EditSessionServletController extends HttpServlet {

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
            out.println("<title>Servlet EditSessionServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSessionServletController at " + request.getContextPath() + "</h1>");
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
        String sid_raw = request.getParameter("sid");
        SessionDAO dao = new SessionDAO();
        try {
            int sid = Integer.parseInt(sid_raw);
            request.setAttribute("slist", dao.getSessionBySessionID(sid));
            request.setAttribute("sid", sid);

        } catch (Exception e) {
        }
        request.getRequestDispatcher("designer/session/editsession.jsp").forward(request, response);
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
        String sid_raw = request.getParameter("sid");
        String topic = request.getParameter("topic");
        String learningTeachingType_raw = request.getParameter("learningteachingtype");
        String lo = request.getParameter("lo");
        String itu = request.getParameter("itu");
        String studentMaterial = request.getParameter("studentmaterial");
        String studentTask = request.getParameter("studenttask");
        String sDownload = request.getParameter("sdownload");
        String url = request.getParameter("url");

        SessionDAO dao = new SessionDAO();

        System.out.println(learningTeachingType_raw);
        try {
            int sid = Integer.parseInt(sid_raw);
            boolean learningTeachingType;
            if (learningTeachingType_raw.equals("1")) {
                learningTeachingType = true;
            } else {
                learningTeachingType = false;
            }
            Session s = dao.getSessionBySessionID(sid);
            s.setTopic(topic);
            s.setLearningTeachingType(learningTeachingType);
            s.setLo(lo);
            s.setItu(itu);
            s.setStudentMaterial(studentMaterial);
            s.setStudentTask(studentTask);
            s.setDownload(sDownload);
            s.setUrls(url);
            dao.editSession(s);
        } catch (NumberFormatException e) {
            System.out.println("edit" + e);
        }
        response.sendRedirect("listsession?syllabusID=" + syllabusID);
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
