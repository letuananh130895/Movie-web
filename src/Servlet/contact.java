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

import Bean.Contact;
import Utility.DBUtility;
import Utility.MyUtility;
 
@WebServlet(urlPatterns = { "/contactError" })
public class contact extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public contact() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   String errorString = null;
       Connection conn = MyUtility.getStoredConnection(request);
       String name = (String) request.getParameter("name");
       String email = (String) request.getParameter("email");
       String message = (String) request.getParameter("message");
       String code = request.getParameter("code");
       if (code==null||code=="") code="0";
       String img = request.getParameter("img");
       int checkCaptcha = 0;
       try {
		checkCaptcha=DBUtility.checkCaptcha(conn, img, code);
       } catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
       }
       if (checkCaptcha!=1) errorString="Wrong captcha!";
       request.setAttribute("errorString", errorString);
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/contact/contactPage.jsp");
           dispatcher.forward(request, response);
       }
       Contact contact = new Contact(name, email, message);
 
       try {
               DBUtility.sendMessage(conn, contact);
           } catch (SQLException e) {
               e.printStackTrace();
               errorString = e.getMessage();
           }
       request.setAttribute("contact", contact);
       request.setAttribute("errorString", errorString);
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/contact/contactPage.jsp");
           dispatcher.forward(request, response);
       }
       
       else {
           response.sendRedirect(request.getContextPath() + "/contact?forward=success");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}