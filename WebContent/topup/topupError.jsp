<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:include page="/interface/#header.jsp"></jsp:include>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not logged in! You will be redirected to "Login" page in 3 seconds.</center>
<%}%>

<%
	String forward = (String) request.getParameter("forward");
	String topupError=null;
	if (forward.equals("missing")) topupError="Your code is missing!";
	else if (forward.equals("wrong")) topupError="Your code is expired/wrong!";
	else topupError="Unknown error!";
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Top up Page</title>
</head>
<body>
		<jsp:include page="/interface/#header.jsp"></jsp:include>
      <jsp:include page="/interface/#menu_user.jsp"></jsp:include>
      <center><font color="red"><b><%=topupError%></b></font></center></br>
        <form method="post" action="?forward=perform">
            <center>
            <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
                <thead>
                    <tr>
                        <th colspan="2">Top up Page</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>Enter code</td>
                        <td><input type="password" name="code" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
        <jsp:include page="/interface/#footer.jsp"></jsp:include>
    </body>
</html>