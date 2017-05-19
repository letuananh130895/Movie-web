package Servlet;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/contact"})
public class contactPage extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public contactPage() {
       super();
   }

 @Override
 protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
      String forward = request.getParameter("forward");
      
      if ("perform".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/contact.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      if ("success".equals(forward)) {
         RequestDispatcher dispatcher = request.getServletContext()
                 .getRequestDispatcher("/contact/success.jsp");
         dispatcher.forward(request, response);
 
         return;
      }
      if ("error".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/error.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      if ("missing".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/error.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("captcha".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/error.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("nameOverChar".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/error.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("emailOverChar".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/error.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("contentOverChar".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/contact/error.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/contact/contactPage.jsp");
      dispatcher.forward(request, response);
      
    }
 
 @Override
 protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request, response);
 }
 
}