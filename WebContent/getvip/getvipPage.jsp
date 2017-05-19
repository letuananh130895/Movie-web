<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not logged in! You will be redirected to "Login" page in 3 seconds.</center>
<%} else {%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get VIP Page</title>
</head>
<body>
      <jsp:include page="/interface/#menu_user.jsp"></jsp:include>
      
        <form method="post" action="?forward=perform">
            <center>
            <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
                <thead>
                    <tr>
                        <th colspan="2">Become a VIP</th>
                    </tr>
                </thead>
                <tbody>
                  	<tr>
              			<td>7 days</td>
              			<td><input type="checkbox" name="7days" value= "Y" /> </td>
          			</tr>
          			<tr>
              			<td>30 days</td>
              			<td><input type="checkbox" name="30days" value= "Y" /> </td>
          			</tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>