<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String query = "select count(*) from Contact";
                ResultSet rs = stmt.executeQuery(query);
                rs.last();
                int count = rs.getInt(1);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>

<link rel=StyleSheet HREF="style.css" TYPE="text/css" MEDIA=screen>

<script type="text/javascript" src="jquery.min.js"></script>

<script>
	function goBack() {
    window.history.back();
	}
</script>

<div style="background: black; height: 90px; padding: 5px; width: 65%">
<a href='${pageContext.request.contextPath}/home'><img src="http://localhost/img/logo.png"></a>

<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
%>
<div style="float: right; padding: 10px; text-align: right;">
<font color="white">Welcome Guest!</font>
</br></br>
<jsp:include page="/interface/#search.jsp"></jsp:include>
</div>
<%} else if (session.getAttribute("per").equals(1)){ %>
<div style="float: right; padding: 10px; text-align: right;">
<font color="white">Welcome <%=session.getAttribute("username")%>!</font>
<a href='logout'><input type="button" value="Logout"/></a>
</br>
<font color="white">You have <a href="${pageContext.request.contextPath}/manage?forward=message"><%= count%> messages</a></font>
</br></br>
<jsp:include page="/interface/#search.jsp"></jsp:include>
</div>
<%} else {%>
<div style="float: right; padding: 10px; text-align: right;">
<font color="white">Welcome <%=session.getAttribute("username")%>!</font>
<a href='logout'><input type="button" value="Logout"/></a>
</br></br>
<jsp:include page="/interface/#search.jsp"></jsp:include>
</div>
<% } %>
</div>


</head>
</html>