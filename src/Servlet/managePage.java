package Servlet;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/manage"})
public class managePage extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public managePage() {
       super();
   }

 @Override
 protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
      String forward = request.getParameter("forward");
      if ("account".equals(forward)) {
         RequestDispatcher dispatcher = request.getServletContext()
                 .getRequestDispatcher("/admin/userListPage.jsp");
         dispatcher.forward(request, response);
 
         return;
      }
      
      if ("movie".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/admin/movieListPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      if ("history".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/admin/historyPage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("message".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/admin/messagePage.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login/loginAdmin.jsp");
      dispatcher.forward(request, response);
      
    }
 
 @Override
 protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request, response);
 }
 
}