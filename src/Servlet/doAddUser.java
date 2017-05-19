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
 
@WebServlet(urlPatterns = { "/doAddUser" })
public class doAddUser extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public doAddUser() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
	   String errorString=null;
       Connection conn = MyUtility.getStoredConnection(request);
       Calendar cal = Calendar.getInstance();
       SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
       SimpleDateFormat std = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String userName = (String) request.getParameter("userName");
       int check=0;
       try {
   		check=DBUtility.checkAccountExist(conn, userName);
          } catch (SQLException e1) {
   		// TODO Auto-generated catch block
   		e1.printStackTrace();
          }
          if (check!=0) errorString="Your user name already exist!";
       String password = (String) request.getParameter("password");
       String email = (String) request.getParameter("email");
       int point;
       String p = (String) request.getParameter("point");
       if (p=="") point=0;
       else point = Integer.parseInt(p);
       String time = (String) request.getParameter("time");
       if (time=="") time="07:00:00 01/01/1970";
       try {
		cal.setTime(timeFormat.parse(time));
       } catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
       }
       String time1 =std.format(cal.getTime());
       String per = (String) request.getParameter("per");
       if ((!per.equals("admin"))&&(!per.equals("user")))
    	   errorString="Permission is not correct!";
       request.setAttribute("errorString", errorString);
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/admin/addUserPage.jsp");
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
                   .getRequestDispatcher("/admin/addUserPage.jsp");
           dispatcher.forward(request, response);
       }
       
       else {
           response.sendRedirect(request.getContextPath() + "/manage?forward=account");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}