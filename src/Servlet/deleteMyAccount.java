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
 
import Utility.DBUtility;
import Utility.MyUtility;
 
@WebServlet(urlPatterns = { "/deleteMyAccount" })
public class deleteMyAccount extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public deleteMyAccount() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtility.getStoredConnection(request);
 
       String code = (String) request.getParameter("code");
 
       String errorString = null;
 
       try {
           DBUtility.deleteAccount(conn, code);
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
        
       if (errorString != null) {
           request.setAttribute("errorString", errorString);
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/user/userPage.jsp");
           dispatcher.forward(request, response);
       }
       else {
           response.sendRedirect(request.getContextPath() + "/logout");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}