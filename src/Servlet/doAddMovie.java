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
 
import Bean.Movie;
import Utility.DBUtility;
import Utility.MyUtility;
 
@WebServlet(urlPatterns = { "/doAddMovie" })
public class doAddMovie extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public doAddMovie() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtility.getStoredConnection(request);
 
       String name = (String) request.getParameter("name");
       String img = (String) request.getParameter("img");
       int year = Integer.parseInt((String) request.getParameter("year"));
       String type = (String) request.getParameter("type");
       String des = (String) request.getParameter("des");
       String url = (String) request.getParameter("url");
       int view=0;
       
       Movie movie = new Movie(name, img, year, type, des, url, view);
 
       String errorString = null;
 
       try {
               DBUtility.addMovie(conn, movie);
           } catch (SQLException e) {
               e.printStackTrace();
               errorString = e.getMessage();
           }
        
       request.setAttribute("errorString", errorString);
       request.setAttribute("movie", movie);
 
       if (errorString != null) {
           RequestDispatcher dispatcher = request.getServletContext()
                   .getRequestDispatcher("/admin/addMoviePage.jsp");
           dispatcher.forward(request, response);
       }
       
       else {
           response.sendRedirect(request.getContextPath() + "/manage?forward=movie");
       }
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}