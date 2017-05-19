<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<html>
<body>
<jsp:include page="/interface/#header.jsp"></jsp:include>

<% if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>

<%} else if ((!session.getAttribute("per").equals("admin")) && (session.getAttribute("vipTime").equals(0))){
%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>

<%} else if ((!session.getAttribute("per").equals("admin")) && (session.getAttribute("vipTime").equals(1))){
%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>

<%} else if ((session.getAttribute("per").equals("admin"))){
%>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>

<% } %>
<center>Something went wrong!</br></br>
<button onclick="goBack()">Go Back!</button></center>

    <jsp:include page="/interface/#footer.jsp"></jsp:include>
</body>
</html>