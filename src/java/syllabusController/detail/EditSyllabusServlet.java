/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package syllabusController.detail;

import DAL.DecisionNoDAO;
import DAL.SubjectDAO;
import DAL.SyllabusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.DecisionNo;
import model.Subject;
import model.Syllabus;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditSyllabus", urlPatterns = {"/editsyllabus"})
public class EditSyllabusServlet extends HttpServlet {

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
            out.println("<title>Servlet EditSyllabus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSyllabus at " + request.getContextPath() + "</h1>");
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
        
        SyllabusDAO syd = new SyllabusDAO();
        DecisionNoDAO dedao = new DecisionNoDAO();
        String syllabusID_raw = request.getParameter("syllabusID");
        try {
            int syllabusID = Integer.parseInt(syllabusID_raw);
            Syllabus sy = syd.getASyllabus(syllabusID);
            List<DecisionNo> listDecisionNo = dedao.getAllDecesionNo();
            request.setAttribute("listDeci", listDecisionNo);
            request.setAttribute("sy", sy);
            
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("designer/syllabus/Editsyllabus.jsp").forward(request, response);
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
         request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        SyllabusDAO syd = new SyllabusDAO();
        String syllabusID_raw = request.getParameter("syllabusID");
        String subCode = request.getParameter("subjectCode");
        String syName = request.getParameter("syllabusName");
        String noCredit_raw = request.getParameter("noCredit");
        String deLevel = request.getParameter("degreeLevel");
        String tAllocation = request.getParameter("timeAllocation");
        String preRequisite = request.getParameter("preRequisite");
        String description = request.getParameter("description");
        String stuTask = request.getParameter("studentTasks");
        String tool = request.getParameter("tool");
        String scoScale_raw = request.getParameter("scoringScale");
        String decisionNo_raw = request.getParameter("decisionNo");
        String isApproved_raw = request.getParameter("isApproved");
        String note = request.getParameter("note");
        String minAvgToPass_raw = request.getParameter("minAMToPass");
        String approveDate = request.getParameter("approvedDate");
        String isActive_raw = request.getParameter("isActive");
        
        System.out.println(approveDate);
        try {
            int syllabusID = Integer.parseInt(syllabusID_raw);
            int noCredit = Integer.parseInt(noCredit_raw);
            int scoScale = Integer.parseInt(scoScale_raw);
            int isApproved = Integer.parseInt(isApproved_raw);
            int isActive = Integer.parseInt(isActive_raw);
            int minAvgToPass = Integer.parseInt(minAvgToPass_raw);
            int decisionNo = Integer.parseInt(decisionNo_raw);
           
         syd.updateSyllabus(syName, noCredit, 
                 deLevel, tAllocation,
                 preRequisite,
                 description, stuTask, tool, scoScale,
                 decisionNo, isApproved, note,
                 minAvgToPass, isActive, approveDate, 
                 syllabusID);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        response.sendRedirect("listsyllabus");
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
