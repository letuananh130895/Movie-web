package Servlet;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/getvip"})
public class getvipPage extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public getvipPage() {
       super();
   }


 @Override
 protected void doGet(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
      String forward = request.getParameter("forward");
      if ("success".equals(forward)) {
         RequestDispatcher dispatcher = request.getServletContext()
                 .getRequestDispatcher("/getvip/getvipSuccess.jsp");
         dispatcher.forward(request, response);
 
         return;
      }
      if ("perform".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/getvip/getvip.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      if ("error".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/getvip/getvipError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("missing".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/getvip/getvipError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      if ("notEnough".equals(forward)) {
          RequestDispatcher dispatcher = request.getServletContext()
                  .getRequestDispatcher("/getvip/getvipError.jsp");
          dispatcher.forward(request, response);
  
          return;
       }
      
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/getvip/getvipPage.jsp");
      dispatcher.forward(request, response);
      
    }
 
 @Override
 protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     this.doGet(request, response);
 }
 
}