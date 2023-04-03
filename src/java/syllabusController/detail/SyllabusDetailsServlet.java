/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package syllabusController.detail;


import DAL.AssessmentDAO;
import DAL.LoDAO;
import DAL.MaterialDAO;
import DAL.QuestionDAO;
import DAL.ReviewDAO;
import DAL.SessionDAO;
import DAL.SyllabusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Assessment;
import model.Comment;
import model.Lo;
import model.Material;
import model.Question;
import model.Session;
import model.Syllabus;

/**
 *
 * @author admin
 */
public class SyllabusDetailsServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SyllabusDetailsServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SyllabusDetailsServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SyllabusDAO syd = new SyllabusDAO();
        MaterialDAO md = new MaterialDAO();
        SessionDAO sed = new SessionDAO();
        QuestionDAO qd = new QuestionDAO();
        LoDAO lod = new LoDAO();
        ReviewDAO dao = new ReviewDAO();
         
        AssessmentDAO asd = new AssessmentDAO();
        String syllabusID_raw = request.getParameter("syllabusID");
        String curriculumID = request.getParameter("curID");
        try {
            int syllabusID = Integer.parseInt(syllabusID_raw);
                    Syllabus sy = syd.getASyllabus(syllabusID);
                    List<Session> seList = sed.getSessionBySyllabusID(syllabusID);
                    List<Question> qList = qd.getQuestionOfSyllabus(syllabusID);
                    List<Material> mList = md.getMaterialBySyllabusID(syllabusID);
                    List<Lo> loList = lod.getLoBySyllabusId(syllabusID);
                    List<Assessment> assList = asd.getAssessmentBySyllabusID(syllabusID);
                    List<Comment> comlist = dao.getComment(syllabusID_raw,curriculumID);
                    request.setAttribute("syllabusID", syllabusID_raw);
                    request.setAttribute("sy", sy);
                    request.setAttribute("mlist", mList);
                    request.setAttribute("selist", seList);
                    request.setAttribute("qlist", qList);
                    request.setAttribute("lolist", loList);
                    request.setAttribute("asslist", assList);
                    request.setAttribute("comlist", comlist);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("syllabus/syllabusdetails.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
