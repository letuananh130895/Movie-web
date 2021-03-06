package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import Bean.Account;
import Utility.DBUtility;
import Utility.MyUtility;
 
@WebServlet(urlPatterns = { "/editAccount" })
public class editAccount extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public editAccount() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtility.getStoredConnection(request);
 
       String code = (String) request.getParameter("code");
 
       Account account = null;
 
       String errorString = null;
 
       try {
           account = DBUtility.ADfindAccount(conn, code);
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
 
       if (errorString != null && account == null) {
           response.sendRedirect(request.getServletPath() + "/user");
           return;
       }
 
       request.setAttribute("errorString", errorString);
       request.setAttribute("account", account);
 
       RequestDispatcher dispatcher = request.getServletContext()
               .getRequestDispatcher("/admin/editAccountPage.jsp");
       dispatcher.forward(request, response);
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}