/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package accountController.detail;


import DAL.AccountDAO;
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
@WebServlet(name = "ChangeInfoUserServletController", urlPatterns = {"/changeinfo"})
public class ChangeInfoUserServletController extends HttpServlet {

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
            out.println("<title>Servlet ChangeInfoUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInfoUser at " + request.getContextPath() + "</h1>");
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

        String id_raw = request.getParameter("accountID");
        int id;
        AccountDAO dao = new AccountDAO();
        try {
            id = Integer.parseInt(id_raw);
            Account userInfo = dao.getAccount(id);
            request.setAttribute("userInfo", userInfo);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("common/changeprofile.jsp").forward(request, response);
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
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String username = request.getParameter("username");
        String gender_raw = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        AccountDAO dao = new AccountDAO();
        int id, gender;

        try {
            gender = Integer.parseInt(gender_raw);
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("account");
            a.setFirstName(fname);
            a.setLastName(lname);
            a.setUserName(username);
            a.setAddress(address);
            a.setPhone(phone);
            dao.changeInfomation(a);
            response.sendRedirect("user");

        } catch (Exception e) {
            System.out.println(e);
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
