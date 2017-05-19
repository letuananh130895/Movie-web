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
 
@WebServlet(urlPatterns = { "/doEditMyAccount" })
public class doEditMyAccount extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public doEditMyAccount() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtility.getStoredConnection(request);
 
       String userName = (String) request.getParameter("userName");
       String password = (String) request.getParameter("password");
       String email = (String) request.getParameter("email");
       Account account = new Account(userName, password, email);
 
       String errorString = null;
 
       try {
           DBUtility.updateAccount(conn, account);
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
       request.setAttribute("errorString", errorString);
       request.setAttribute("account", account);
 
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/user/editMyAccountPage.jsp");
           dispatcher.forward(request, response);
       }
       else {
           response.sendRedirect(request.getContextPath() + "/user");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}