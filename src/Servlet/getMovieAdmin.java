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
 
@WebServlet(urlPatterns = { "/getMovieAdmin" })
public class getMovieAdmin extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public getMovieAdmin() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtility.getStoredConnection(request);
 
       String code = (String) request.getParameter("id");
       int id=Integer.parseInt(code);
 
       Movie movie = null;
 
       String errorString = null;
 
       try {
           movie = DBUtility.findMovie(conn, id);
       } catch (SQLException e) {
           e.printStackTrace();
           errorString = e.getMessage();
       }
 
       if (errorString != null && movie == null) {
           response.sendRedirect(request.getServletPath() + "/home");
           return;
       }
 
       request.setAttribute("errorString", errorString);
       request.setAttribute("movie", movie);
 
       RequestDispatcher dispatcher = request.getServletContext()
               .getRequestDispatcher("/movie_info/movieInfo_admin.jsp");
       dispatcher.forward(request, response);
 
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}