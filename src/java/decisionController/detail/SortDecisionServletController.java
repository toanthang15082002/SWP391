/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package decisionController.detail;

import DAL.DecisionNoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.DecisionNo;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SortDecisionServletController", urlPatterns = {"/sortdecision"})
public class SortDecisionServletController extends HttpServlet {

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
            out.println("<title>Servlet SortDecisionServletController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortDecisionServletController at " + request.getContextPath() + "</h1>");
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
        DecisionNoDAO dDao = new DecisionNoDAO();
        String sort = request.getParameter("sort");
        String indexPage_raw = request.getParameter("indexPage");
        System.out.println(sort);
        if (sort.equals("decisionID desc")) {
            List<DecisionNo> sortlist = dDao.sort(sort);
            int numPerPage = 2;
            int size = sortlist.size();
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
            request.setAttribute("listde", dDao.listByPage(sortlist, start, end));
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            request.setAttribute("page", page);
            request.setAttribute("numpage", numberOfPage);
        } else if (sort.equals("decisionID")) {
            List<DecisionNo> sortlist = dDao.sort(sort);
            int numPerPage = 2;
            int size = sortlist.size();
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
            request.setAttribute("listde", dDao.listByPage(sortlist, start, end));
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            request.setAttribute("page", page);
            request.setAttribute("numpage", numberOfPage);
        }

        request.setAttribute("sort", sort);
        request.getRequestDispatcher("designer/decision/listdecision.jsp").forward(request, response);
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
