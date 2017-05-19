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
import java.util.Calendar;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import Bean.Account;
import Utility.DBUtility;
import Utility.MyUtility;
 
@WebServlet(urlPatterns = { "/registerError" })
public class register extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public register() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   String errorString = null;
       Connection conn = MyUtility.getStoredConnection(request);
       Calendar cal = Calendar.getInstance();
       SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
       SimpleDateFormat std = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String userName = (String) request.getParameter("userName");
       String password = (String) request.getParameter("password");
       String repassword = request.getParameter("repassword");
       String email = (String) request.getParameter("email");
       String code = request.getParameter("code");
       if (code==null||code=="") code="0";
       String img = request.getParameter("img");
       int point = 0;
       String time = "07:00:00 01/01/1970";
       if (!password.equals(repassword)) errorString="Your password do not match!";
       int check = 0;
       try {
		check=DBUtility.checkCaptcha(conn, img, code);
       } catch (SQLException e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
       }
       if (check!=1) errorString="Wrong captcha!";
       try {
		cal.setTime(timeFormat.parse(time));
       } catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
       }
       try {
		check=DBUtility.checkAccountExist(conn, userName);
       } catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
       }
       if (check!=0) errorString="Your user name already exist!";
       String time1 =std.format(cal.getTime());
       String per = "user";
       request.setAttribute("errorString", errorString);
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/register/registerPage.jsp");
           dispatcher.forward(request, response);
       }
       Account account = new Account(userName, password, email, point, time1, per);
       try {
               DBUtility.addAccount(conn, account);
           } catch (SQLException e) {
               e.printStackTrace();
               errorString = e.getMessage();
           }
        
       request.setAttribute("errorString", errorString);
       request.setAttribute("account", account);
 
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/register/registerPage.jsp");
           dispatcher.forward(request, response);
       }
       
       else {
           response.sendRedirect(request.getContextPath() + "/register?forward=success");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}