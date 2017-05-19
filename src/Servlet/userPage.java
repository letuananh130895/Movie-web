package Servlet;
 
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/user"})
public class userPage extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public userPage() {
       super();
   }
   
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       RequestDispatcher dispatcher = request.getServletContext()
               .getRequestDispatcher("/user/userPage.jsp");
       dispatcher.forward(request, response);
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
 
}