<jsp:include page="/interface/#header.jsp"></jsp:include>
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String query = "select * from Account where PER=1";
                ResultSet rs = stmt.executeQuery(query);
                if (!rs.next()){
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Registration Page</title>
</head>
<body>
      <jsp:include page="/interface/#menu.jsp"></jsp:include>
        <form method="post" action="?forward=performAdmin">
            <center>
            <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
                <thead>
                    <tr>
                        <th colspan="2">Registration Page</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>
<%} else {%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="2;URL=${pageContext.request.contextPath}/home">
<center>You are not Admin!</center>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>