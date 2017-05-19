<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
	if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "") || (!session.getAttribute("per").equals(1))){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/home">
<center>You are not admin! You will be redirected to "Home" page in 3 seconds.</center>
<%} else {%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Add movie</title>
  </head>
  <body>
  
     <jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
     
     <center><b><p style="color: red;">${errorString}</p></b></center>
      
     <form method="POST" action="doAddMovie">
     <center>
     <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
           <tr>
              <td>Movie name</td>
              <td><input type="text" name="name" value="${movie.name}" /></td>
           </tr>
           <tr>
              <td>Image url</td>
              <td><input type="text" name="img" value="${movie.img}" /></td>
           </tr>
           <tr>
              <td>Year</td>
              <td><input type="text" name="year" value="${movie.year}" /></td>
           </tr>
           <tr>
              <td>Type</td>
              <td><input type="text" name="type" value="${movie.type}" /></td>
           </tr>
           <tr>
              <td>Description</td>
              
              <td><textarea rows="5" cols="22" name="des" id="des" textareaObject.value="text" ></textarea></td>
           </tr>
           <tr>
              <td>Movie url</td>
              <td><input type="text" name="url" value="${movie.url}" /></td>
           </tr>
           <tr>
              <td colspan="2">                  
                  <input type="submit" value="Submit" />
                  <button onclick="goBack()">Cancel</button>
              </td>
           </tr>
        </table>
        </center>
     </form>
  </body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>