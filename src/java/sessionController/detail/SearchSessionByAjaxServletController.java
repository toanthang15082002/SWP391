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
import java.util.List;
import model.Session;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SearchSessionByAjaxServletController", urlPatterns = {"/searchajax"})
public class SearchSessionByAjaxServletController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
        String syllabusID_raw = request.getParameter("syllabusID");
        String txtsearch = request.getParameter("txtsearch");
        SessionDAO dao = new SessionDAO();
        SyllabusDAO syDao = new SyllabusDAO();
        
        PrintWriter out = response.getWriter();
        List<Session> list = dao.searchSession(txtsearch, Integer.parseInt(syllabusID_raw));
        for (Session sy : list) {
            out.println("<tr>\n"
                    + "                                            <td>${sy.sid}</td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.getTopic() + "</a></td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.isLearningTeachingType() + "</a></td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.getLo() + "</a></td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.getItu() + "</a></td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.getStudentMaterial() + "</a></td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.getDownload() + "</a></td>\n"
                    + "                                            <td><a href=\"showquestion?sid=${sy.sid}\">" + sy.getStudentTask() + "</a></td>\n"
                    + "\n"
                    + "                                            <td>   \n"
                    + "                                                <a href=\"editsession?sid=" + sy.getSid() + "\" class=\"btn\"><i class=\"fa-solid fa-pen-to-square\"></i></a>\n"
                    + "                                                <button type=\"button\" class=\"btn\" data-toggle=\"modal\"  onclick=\"doDelete('" + sy.getSid() + "')\" ><i class=\"fa-solid fa-trash\"></i></button>\n"
                    + "                                            </td>\n"
                    + "                                        </tr>");
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
        processRequest(request, response);
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
