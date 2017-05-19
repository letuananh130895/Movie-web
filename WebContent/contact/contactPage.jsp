<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String query = "select * from Captcha order by rand() limit 1";
                ResultSet rs = stmt.executeQuery(query);
                rs.last();
                String img = rs.getString(1);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact us</title>
</head>
<body>
		<jsp:include page="/interface/#header.jsp"></jsp:include>
		
		<%if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){ 
		%>
		<jsp:include page="/interface/#menu.jsp"></jsp:include>
		<%} else {
		%>
		<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
		<% } %>
      	<center><b><p style="color: red;">${errorString}</p></b></center>
        <form method="post" action="contactError">
            <center>
            
            <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
                <thead>
                    <tr>
                        <th colspan="2">Contact Form</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <input type="hidden" name="img" value="<%=img %>" />
                    <tr>
                        <td>Your name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>                       
                        <td>Message</td>
                        <td>
                        <textarea rows="5" cols="22" name="message" id="message" textareaObject.value="text" ></textarea>
                        
                        </td>
                    </tr>
                    <tr>
                    <tr>                       
                        <td>Enter captcha</td>
                        <td><img src="http://localhost/img/captcha/<%=img %>.jpg"></br></br><input type="text" name="code" value="" /></td>
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