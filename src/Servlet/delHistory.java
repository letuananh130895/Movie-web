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
 
@WebServlet(urlPatterns = { "/delHistory" })
public class delHistory extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public delHistory() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtility.getStoredConnection(request);
       String errorString = null;
 
       try {
           DBUtility.delHistory(conn);
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
        
       if (errorString != null) {
           request.setAttribute("errorString", errorString);
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/admin/historyPage.jsp");
           dispatcher.forward(request, response);
       }
       else {
           response.sendRedirect(request.getContextPath() + "/manage?forward=history");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}