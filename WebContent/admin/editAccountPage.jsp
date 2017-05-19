<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
	if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "") || (!session.getAttribute("per").equals(1))){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/home">
<center>You are not admin! You will be redirected to "Home" page in 3 seconds.</center>
<%} else {%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
		<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
		<center><b><p style="color: red;">${errorString}</p></b></center>
        <form method="post" action="doEditAccount">
            <center>
            <input type="hidden" name="userName" value="${account.userName}" />
            <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
                <tr>
                 <td>User Name</td>
                 <td style="color:red;">${account.userName}</td>
              </tr>
              <tr>
                 <td>Password</td>
                 <td><input type="text" name="password" value="${account.password}" /></td>
              </tr>
              <tr>
                 <td>Email</td>
                 <td><input type="text" name="email" value="${account.email}" /></td>
              </tr>
              <tr>
                 <td>VIP Point</td>
                 <td><input type="text" name="point" value="${account.point}" /></td>
              </tr>
              <tr>
                 <td>VIP Time</td>
                 <td><input type="text" name="time" value="${account.time}" /></td>
              </tr>
              <tr>
                 <td>Permission</td>
                 <td><input type="text" name="per" value="${account.per}" /></td>
              </tr>
              <tr>
                 <td colspan = "2">
                     <input type="submit" value="Submit" />
                     <a href='manage?forward=account'><input type="button" value="Cancel"/></a>
                     
                 </td>
              </tr>
            </table>
            </center>
        </form>
        
    </body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>