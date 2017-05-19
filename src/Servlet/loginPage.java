package Servlet;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/login"})
public class loginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public loginPage() {
	       super();
	   }
 
 @Override
 protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
      String forward = request.getParameter("forward");
      if ("success".equals(forward)) {
         RequestDispatcher dispatcher = request.getServletContext()
                 .getRequestDispatcher("/login/loginSuccess.jsp");
         dispatcher.forward(request, response);
 
         return;
      }
      if ("vip".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/loginVip.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("perform".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/login.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("admin".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/loginAdmin.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("error".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/loginError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("missing".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/loginError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("conflict".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/loginError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("wrong".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/login/loginError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login/loginPage.jsp");
      dispatcher.forward(request, response);
      
    }
 
 @Override
 protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request, response);
 }
 
}