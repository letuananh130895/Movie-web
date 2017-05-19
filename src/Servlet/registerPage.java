package Servlet;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/register"})
public class registerPage extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public registerPage() {
       super();
   }

 @Override
 protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
      String forward = request.getParameter("forward");
      if ("success".equals(forward)) {
         RequestDispatcher dispatcher = request.getServletContext()
                 .getRequestDispatcher("/register/registerSuccess.jsp");
         dispatcher.forward(request, response);
 
         return;
      }
      if ("perform".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/register.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("performAdmin".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerAdmin.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("error".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("duplicate".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("admin".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/adminRegPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("missing".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("captcha".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("nameOverChar".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("passOverChar".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("emailOverChar".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("passError".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/register/registerError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/register/registerPage.jsp");
      dispatcher.forward(request, response);
      
    }
 
 @Override
 protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request, response);
 }
 
}