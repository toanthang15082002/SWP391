/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package syllabusController.detail;

import DAL.SyllabusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Syllabus;

/**
 *
 * @author admin
 */
@WebServlet(name = "ListSyllabusServlet", urlPatterns = {"/listsyllabus"})
public class ListSyllabusServlet extends HttpServlet {

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
            out.println("<title>Servlet ListSyllabusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListSyllabusServlet at " + request.getContextPath() + "</h1>");
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
        List<Syllabus> list = new ArrayList<>();   
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
        String indexPage = request.getParameter("indexPage");
         int count = 0;
        try {
            int num = 6;
            if (indexPage == null) {
                indexPage = "1";
            }
            
            int index = Integer.parseInt(indexPage);
           
            if (a.getRoleID() == 7) {
                  count = syd.getTotalSyllabus();
            } else if (a.getRoleID() == 2) {
                count = syd.getTotalSyllabusByAcountID(a.getAccountID());
            }
            
            int endPage = count / 6;
            if (count % 3 != 0) {
                endPage++;
            }
            
            if (a.getRoleID() == 7) {
                list = syd.getAllSyllabus(index, num);
                request.setAttribute("listsy", list);
            } else if (a.getRoleID() == 2) {
                list = syd.getAllSyllabusByAccountID(index, num, a.getAccountID());
            }
            request.setAttribute("listsy", list);
            request.setAttribute("num", num);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", index);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("designer/syllabus/ListSyllabus.jsp").forward(request, response);
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
            SyllabusDAO syd = new SyllabusDAO();
            String searchSyllabus = request.getParameter("syllabusTxt");
            String indexPage = request.getParameter("indexPage");
         System.out.println("txtsearch"+searchSyllabus);
        try {
            int num = 6;
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            int count = syd.getTotalSyllabus();
            int endPage = count / 6;
            if (count % 3 != 0) {
                endPage++;
            }

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
           
           List<Syllabus> list = new ArrayList<>();
            
            if(searchSyllabus == "" ){
                if (a.getRoleID() == 7) {
                  list = syd.getAllSyllabus(index, num);
                 } else {
                        list = syd.getAllSyllabusByAccountID(index, num, a.getAccountID());
                 }
            }else{
                list = syd.searchPagingSyllabus(searchSyllabus,index, num, a.getAccountID());
            
            }
            request.setAttribute("listsy", list);
            request.setAttribute("txtSearch",searchSyllabus);
            request.setAttribute("num", num);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", index);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("designer/syllabus/ListSyllabus.jsp").forward(request, response);
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
