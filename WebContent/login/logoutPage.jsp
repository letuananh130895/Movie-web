<%= session.getAttribute("username")%>
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
Statement stmt = conn.createStatement();
String userName= (String)session.getAttribute("username");
String query = "insert into History(USER_NAME, ACTION, LOG_TIME) values ('"+userName+"','logout',unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))";
stmt.executeUpdate(query);

session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("home");
%>