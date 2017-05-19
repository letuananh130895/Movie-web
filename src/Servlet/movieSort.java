package Servlet;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/sort"})
public class movieSort extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public movieSort() {
       super();
   }

 @Override
 protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
	 String selection = (String) request.getParameter("selection");
      if ("Most-viewed".equals(selection)) {
         RequestDispatcher dispatcher = request.getServletContext()
                 .getRequestDispatcher("/movie_sort/mostViewPage.jsp");
         dispatcher.forward(request, response);
 
         return;
      }
      if ("Newest-Oldest".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/latestMoviePage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("War".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/warPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("Hero".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/heroPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("Cartoon".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/cartoonPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("Horror".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/horrorPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("Comedy".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/comedyPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("Science-Fiction".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/scificPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("Crime".equals(selection)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/movie_sort/crimePage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/homePage.jsp");
      dispatcher.forward(request, response);
      
    }
 
 @Override
 protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request, response);
 }
 
}